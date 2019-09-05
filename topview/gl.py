#!/usr/bin/python3

import random
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

import select
import statistics
import numpy as np
from math import sin,cos,pi,asin,acos,sqrt
from PIL import Image
import datetime
import copy

# memo #########################################################################
##########################################################################################

class Linalg:
    def get_R(self, theta):
        R_x = np.array([[          1  ,            0  ,            0  ],
                        [          0  ,  cos(theta[0]), -sin(theta[0])],
                        [          0  ,  sin(theta[0]),  cos(theta[0])]])

        R_y = np.array([[cos(theta[1]),            0  , -sin(theta[1])],
                        [          0  ,            1  ,            0  ],
                        [sin(theta[1]),            0  ,  cos(theta[1])]])

        R_z = np.array([[cos(theta[2]), -sin(theta[2]),            0  ],
                        [sin(theta[2]),  cos(theta[2]),            0  ],
                        [          0  ,              0,            1  ]])

        R = np.dot(R_y, R_x)

        return R

    def get_normalized(self, direction):
        return direction / np.linalg.norm(direction)

    def get_n(self, eye, center):
        return self.get_normalized(center - eye)

    def get_theta(self, eye, center):
        n = self.get_n(eye, center)
        n_xz = self.get_normalized(np.array([n[0], 0, n[2]]))
        theta_y = -sign(n_xz[0]) * acos(n_xz[2])
        # -pi <= theta_y < pi
        theta_x = -sign(n[1]) * acos(np.clip(np.dot(n, n_xz), -1, 1))
        # -pi / 2 <= theta_x < pi / 2
        theta = np.array([theta_x, theta_y , 0])
        #print(theta / pi * 180)
        return theta

    def get_center(self, eye, theta):
        return eye + np.dot(linalg.get_R(theta), np.array([0, 0, 1]))

class Animation:
    def __init__(self, eye, theta, odmetries):
        self.stop()
        self.__eye = np.array(eye)
        self.__theta = np.array(theta)
        self.__odmetries = odmetries
        self.__linalg = Linalg()
        # (accel, handle, time_len)

    def stop(self):
        self.__is_playing = False
        self.__sec_progress = 0
        self.__odmetry_i = 0
        self.__time_before = -1

    def is_playing(self):
        return self.__is_playing

    def play(self):
        self.__time_before = datetime.datetime.now()
        self.__is_playing = True
        #self.__timer(0)

    def pause(self):
        self.__is_playing = False

    def toggle(self):
        if self.is_playing():
            self.pause()
        else:
            self.play()

    def get_sample(self):
        if not self.is_playing():
            return np.copy(self.__eye), np.copy(self.__theta)

        DISTANCE_PER_SEC = 100
        RAD_PER_SEC = pi / 4

        time_now = datetime.datetime.now()
        sec_diff = (time_now - self.__time_before).total_seconds()
        self.__time_before = time_now

        self.__sec_progress = self.__sec_progress + sec_diff
        if self.__sec_progress > self.__odmetries[self.__odmetry_i][2]:
            self.__sec_progress = 0
            self.__odmetry_i = self.__odmetry_i + 1
            if self.__odmetry_i >= len(self.__odmetries):
                self.stop()
                return np.copy(self.__eye), np.copy(self.__theta)

        accel, handle, duration = self.__odmetries[self.__odmetry_i]
        eye, theta = self.__eye, self.__theta

        center = self.__linalg.get_center(eye, theta)

        n = self.__linalg.get_n(eye, center)
        n_xz = self.__linalg.get_normalized(np.array([n[0], 0, n[2]]))
        eye = eye + n_xz * DISTANCE_PER_SEC * sec_diff * accel

        theta_y_diff = RAD_PER_SEC * sec_diff * handle / 128.0
        theta[1] = (theta[1] + theta_y_diff) % (pi * 2)

        sample = (eye, theta)

        self.__eye, self.__theta = sample

        return np.copy(self.__eye), np.copy(self.__theta)

    def get_status(self):
        return {
            "is_playing":   copy.copy(self.__is_playing),
            "theta":        copy.copy(self.__theta),
            "eye":          copy.copy(self.__eye),
            "odmetry_i":    copy.copy(self.__odmetry_i),
            "odmetry":      copy.copy(self.__odmetries[self.__odmetry_i]),
            "sec_progress": copy.copy(self.__sec_progress),
        }

def init():
    global linalg
    global status_window_h
    global mx
    global my
    global is_mouse_pressing
    global map_tex
    global lims
    global diff_tick
    global lims_mean
    global arrow_h
    global arrow_r
    global sphere_r
    global up
    global eye
    global map_tex
    global is_plot_axis
    global is_plot_tick
    global is_im_car
    global theta
    global animation
    global time_before

    glutInitWindowPosition(0, 0);
    glutInitWindowSize(800, 800);
    glutInit(sys.argv)
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH)
    glutCreateWindow(sys.argv[0].split('/')[-1])
    glEnable(GL_DEPTH_TEST)

    linalg = Linalg()

    status_window_h = 100

    mx = 0.0
    my = 0.0
    is_mouse_pressing = False

    map_tex = get_tex('ref_map.png')
    #map_tex = get_tex('batsun.jpg')

    lims = np.array([map_img.size[0], 500, map_img.size[1]])
    diff_tick = 100
    lims_mean = statistics.mean(lims)
    arrow_h = min(lims) / 100 * 15
    arrow_r = arrow_h / 5

    sphere_r = lims_mean / 100 * 1

    up = np.array([0, 1, 0])

    #eye_init = np.array([365, lims[2] / 16, 470])
    #eye_init = np.array([lims[0] / 1, lims[1] / 1, lims[2] / 1])
    eye_init = np.array([200, 800, 1100])
    eye = eye_init

    #center_init = np.array([lims[0] / 2, 0, 0])
    #center_init = np.array([0, 0, 0]) # debug
    #center_init = eye + (center_init - eye) / np.linalg.norm(center_init - eye)
    #center_init = eye + get_n(eye, center_init)

    #theta_init= linalg.get_theta(eye, center_init)
    theta_init = np.array([45, 180, 0]) / 180 * pi
    #theta_init = np.array([20, 180, 0]) / 180 * pi
    theta = theta_init

    is_plot_axis = True
    is_plot_tick = True

    time_before = datetime.datetime.now()

    is_im_car = False

    # animation_init
    animation = Animation(
        np.array([370, sphere_r * 4, 470]),
        np.array([20, 180, 0]) / 180 * pi,
        [
            [1.0,    0, 3.5],
            [0.5, -128,   2],
            [1.0,    0, 1.9],
            [0.5, -128,   2],
        ] * 100
    )
    animation.play()

def get_powered_size(size):
    width = size[0]
    height = size[1]

    w = 1
    h = 1

    while(w < width):
        w = w * 2

    while(h < height):
        h = h * 2

    return w, h

def get_tex(path):
    global map_img

    img_file = Image.open(path)
    img_mask = Image.new('1', img_file.size, 1)
    w, h = get_powered_size(img_file.size)

    img_map = Image.new('RGBA', (w, h), (0, 0, 0, 0))
    img_map.paste(img_file, (0, 0), img_mask)
    map_img = img_map

    tex = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, tex)
    glTexImage2D(
        GL_TEXTURE_2D,
        0, # used if mipmap
        GL_RGBA,
        #GL_RGB,
        w,
        h,
        0, # border weight
        GL_RGBA,
        #GL_RGB,
        GL_UNSIGNED_BYTE,
        map_img.tobytes()
    )

    return tex

def sign(num):
    return -1 if num < 0 else 1

def idle():
    glutPostRedisplay()

def plot_axis():
    for axis in range(3):
        glPushMatrix()

        r = [[0, 1, 0], [-1, 0, 0], [0, 0, 0]][axis]
        glRotated(90, *r)

        glBegin(GL_LINES)
        glVertex3d(0, 0, 0)
        glVertex3d(0, 0, lims[axis])
        glEnd()

        glTranslated(0, 0, lims[axis])
        glRasterPos(0, 0, arrow_h * 1.5)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18, ord('x') + axis)
        glutSolidCone(arrow_r, arrow_h, 8, 8)

        glPopMatrix()


def plot_tick():
    glPushAttrib(GL_ENABLE_BIT)
    glEnable(GL_LINE_STIPPLE)
    glLineStipple(1, 0xf0f0)

    for axis in range(3):
        for i in range(0, lims[axis], diff_tick):
            begin = [0, 0, 0]
            begin[axis - 0] = i
            begin[axis - 2] = lims[axis - 2]
            begin[axis - 1] = 0
            end = list(begin)
            end[axis - 2] = 0

            glBegin(GL_LINES)
            glVertex3d(*begin)
            glVertex3d(*end)
            glEnd()

            begin[axis - 2] = 0
            begin[axis - 1] = lims[axis - 1]
            end = list(begin)
            end[axis - 1] = 0

            glBegin(GL_LINES)
            glVertex3d(*begin)
            glVertex3d(*end)
            glEnd()

            labelpos = [0, 0, 0]
            labelpos[axis - 0] = i
            labelpos[axis - 2] = 0
            labelpos[axis - 1] = 0

            glRasterPos(*labelpos)
            glutBitmapString(GLUT_BITMAP_HELVETICA_18, str(i).encode())

    glPopAttrib()

def reshape(w, h):
    global window_w
    global window_h

    window_w, window_h = w, h

    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(30.0, w/h, 1.0, max(lims) * 10)
    glMatrixMode (GL_MODELVIEW)

def draw_tex(tex, img):
    glEnable(GL_TEXTURE_2D)
    glBindTexture(GL_TEXTURE_2D, tex)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

    glDepthMask(GL_TRUE);

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

    w, h = img.size

    glBegin(GL_QUADS)
    glTexCoord2f(0.0, 1.0); glVertex3f(0, 1, h)
    glTexCoord2f(1.0, 1.0); glVertex3f(w, 1, h)
    glTexCoord2f(1.0, 0.0); glVertex3f(w, 1, 0)
    glTexCoord2f(0.0, 0.0); glVertex3f(0, 1, 0)
    glEnd()

    glBindTexture(GL_TEXTURE_2D, 0)

def draw_sphere(point):
    glPushAttrib(GL_CURRENT_BIT)
    glColor3d(1, 0, 0)
    glPushMatrix()
    glTranslated(point[0], point[1] + sphere_r, point[2])
    glutSolidSphere(sphere_r, 10, 10)
    glPopMatrix()
    glPopAttrib()

def display():
    global eye
    global theta
    global time_before

    glPushMatrix()
    glViewport(0, 100, window_w, window_h)

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    default_color = np.array([1, 1, 1]) * 0
    glClearColor(*default_color, 0.0)
    glColor3f(*(1 - default_color))

    glLoadIdentity()

    sample = animation.get_sample()

    if is_im_car and animation.is_playing():
        eye, theta = sample

    gluLookAt(*eye, *linalg.get_center(eye, theta), *up)

    if not is_im_car:
        draw_sphere([sample[0][0], 0, sample[0][2]])

    animation_status = animation.get_status()
    glPushMatrix()
    car_eye = animation_status['eye']
    car_eye[1] = sphere_r * 3
    car_theta = animation_status['theta']
    car_center = linalg.get_center(car_eye, car_theta)
    car_n = linalg.get_n(car_eye, car_center)
    car_distance = car_n * sphere_r

    glTranslated(*car_eye)
    glRotated(-car_theta[1] / pi * 180, 0, 1, 0)
    glRotated(car_theta[0] / pi * 180, 1, 0, 0)

    glutSolidCone(arrow_r / 4, arrow_h / 4, 8, 8)
    glPopMatrix()

    if is_plot_axis:
        plot_axis()

    if is_plot_tick:
        plot_tick()

    draw_tex(map_tex, map_img)

    if select.select([sys.stdin], [], [], 0)[0]:
        for i in sys.stdin.readline():
            pass
        exit(0)

    glPopMatrix()

    # fps { ####################################################################
    time_now = datetime.datetime.now()
    sec_diff = (time_now - time_before).total_seconds()
    time_before = time_now
    frame_per_sec = 1 / sec_diff
    # fps } ####################################################################

    # show_status { ############################################################
    glPushMatrix()
    gluLookAt(0, 0, window_w, 0, 0, 0, 0, 1, 0)

    glViewport(0, 0, int(window_w / 2), status_window_h)
    glRasterPos(-int(window_w / 4), status_window_h, 0)
    putstr('eye:   ' + str(eye.astype(int)))
    putstr('theta: ' + str((theta / pi * 180).astype(int)))
    putstr('fps:   ' + str(int(frame_per_sec)))

    glViewport(int(window_w / 2), 0, window_w, status_window_h)
    glRasterPos(-int(window_w / 4), status_window_h, 0)
    putstr('odmetry_i: ' + str(animation_status['odmetry_i']))
    putstr('odmetry:   ' + str(animation_status['odmetry']))
    putstr('progress:  ' + str(animation_status['sec_progress'])[0:4])

    glPopMatrix()
    # show_status } ############################################################

    glutSwapBuffers()

def putstr(string):
    glutBitmapString(GLUT_BITMAP_HELVETICA_18, str(string + '\n').encode())

def keyboard(key, x, y):
    global eye
    global theta
    global is_key_pressing
    global is_plot_axis
    global is_plot_tick
    global is_im_car
    global tab_before

    char = key.decode('utf-8')
    keycode = int.from_bytes(key, "big")

    #print("char: '{}', keycode: '{}'".format(char, keycode))

    if keycode == 3 or keycode == 23 or keycode == 13: # C-c C-w Enter
        exit(0)
    if keycode == 9: # Tab
        #if is_im_car and 'tab_before' in globals():
        if is_im_car:
            eye, theta = tab_before
        else:
            tab_before = eye, theta
        is_im_car = not is_im_car
    elif char == ' ':
        animation.toggle()
    elif char == 'x':
        is_plot_axis = not is_plot_axis
    elif char == 't':
        is_plot_tick = not is_plot_tick
    elif char in 'asdwf':
        is_key_pressing = True
        diff = 30
        if   char == 'a':
            motion(mx + diff, my)
        elif char in 'df':
            motion(mx - diff, my)
        elif char == 'w':
            motion(mx, my + diff)
        elif char == 's':
            motion(mx, my - diff)
        is_key_pressing = False

    sign = 1 if char in '3hk2-' else -1 if char in '4jl0+=;' else 0
    n = linalg.get_n(eye, linalg.get_center(eye, theta))
    n[1] = 0 if char in '34hjkl' else n[1]
    n = -np.cross(n, np.array([0, 1, 0])) if char in 'hl' else n
    n = np.array([0, 1, 0]) if char in '20-+=;'             else n
    diff = sign * n * lims_mean / 100 * 1
    eye = eye + diff

def mouse(button, state, x, y):
    global eye
    global is_mouse_pressing
    global mx, my
    global mx_push, my_push

    print(button, state, x, y)

    if state == 0:
        mx_push, my_push = x, y

    if str(button) in '20': # right, left
        is_mouse_pressing = state == 0
        if state == 1 and mx_push == x and my_push == y:
            keyboard(str(button).encode(), -1, -1)
        mx = x
        my = y
    elif str(button) in '34': # wheel_up, wheel_down
        keyboard(str(button).encode(), -1, -1)

def motion(x, y):
    global mx
    global my
    global theta

    if is_mouse_pressing or is_key_pressing:
        dx = mx - x
        dy = my - y

        mx = x
        my = y

        n = linalg.get_n(eye, linalg.get_center(eye, theta))

        theta = (theta + np.array([dy, dx, 0]) * 0.001) % (pi * 2)

def main():
    init()
    glutIdleFunc(idle)
    glutReshapeFunc(reshape)
    glutDisplayFunc(display)
    glutKeyboardFunc(keyboard)
    glutMouseFunc(mouse)
    glutMotionFunc(motion)

    glutMainLoop()


if __name__ == "__main__":
    main()
