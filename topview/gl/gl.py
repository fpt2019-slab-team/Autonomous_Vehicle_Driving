#!/usr/bin/python3

from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

import select
import statistics
import numpy as np
from math import sin,cos,pi,asin,acos,sqrt
from PIL import Image
import datetime
import io
from stl import mesh
import glm

from linalg import Linalg
from car import Car
from vao.lib import *

# memo #########################################################################
# https://github.com/SausageTaste/practiceOpenGL-FirstPerson/blob/master/src/main_v2.py
################################################################################

def init():
    global linalg
    global STATUS_WINDOW_H
    global mx
    global my
    global is_mouse_pressing
    global map_tex
    global lims
    global diff_tick
    global lims_mean
    global ARROW_H
    global ARROW_R
    global SPHERE_R
    global UP
    global map_tex
    global is_plot_axis
    global is_plot_tick
    global is_im_car
    global is_front_camera
    global is_view_car
    global is_capturing
    global is_driving
    global time_before
    global car
    global VIEWPORT_W
    global VIEWPORT_H
    global THETA_H

    VIEWPORT_W = 480
    VIEWPORT_H = 640
    THETA_H = 15

    glutInitWindowPosition(0, 0)
    glutInitWindowSize(VIEWPORT_W, VIEWPORT_H)
    glutInit(sys.argv)
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH)
    glutCreateWindow(sys.argv[0].split('/')[-1])
    glEnable(GL_DEPTH_TEST)

    linalg = Linalg()

    STATUS_WINDOW_H = 100

    mx = 0.0
    my = 0.0
    is_mouse_pressing = False

    #map_tex = get_tex('ref_map.png')
    map_tex = get_tex('ref_map_m.png')
    #map_tex = get_tex('batsun.jpg')

    lims = np.array([map_img.size[0], 500, map_img.size[1]])
    diff_tick = 100
    lims_mean = statistics.mean(lims)
    ARROW_H = min(lims) / 100 * 15
    ARROW_R = ARROW_H / 5

    SPHERE_R = lims_mean / 100 * 1

    UP = np.array([0, 1, 0])

    # overview
    eye_init = np.array([200, 100, 1100])
    theta_init = np.array([0, 170, 0]) / 180 * pi

    set_eye(eye_init)
    set_theta(theta_init)

    is_plot_axis = True
    is_plot_tick = True

    time_before = datetime.datetime.now()

    is_im_car = False # never True here
    is_front_camera = True
    is_view_car = True
    is_capturing = False # never True here
    is_driving = True

    car = Car(
        np.array([370, SPHERE_R * 4, 470]), # eye
        np.array([0, 180, 0]) / 180 * pi,   # theta
    )

    #init_yukicotan()

    return

def init_yukicotan():
    global YUKICOTAN
    global vao
    global SHADER_PROGRAM
    global UNIFORM_PROJECTION
    global UNIFORM_MODEL
    global UNIFORM_VIEW

    #YUKICOTAN = mesh.Mesh.from_file('yukicotan_3dData.stl').vectors[::10]
    YUKICOTAN = mesh.Mesh.from_file('yukicotan_3dData.stl').vectors
    YUKICOTAN = YUKICOTAN[len(YUKICOTAN) // 100 * 90::]
    #YUKICOTAN = YUKICOTAN[]
    YUKICOTAN = YUKICOTAN / np.max(YUKICOTAN) * SPHERE_R
    #print(np.max(YUKICOTAN));exit()
    #print(YUKICOTAN.shape);exit()

    SHADER_PROGRAM = \
        create_program('vao/simple/shader.vert', 'vao/simple/shader.frag')
    #print(GL_COMPILE_STATUS);exit()
    #print(glGetProgramInfoLog(SHADER_PROGRAM));exit()

    UNIFORM_PROJECTION = glGetUniformLocation(SHADER_PROGRAM, 'projection')
    UNIFORM_MODEL      = glGetUniformLocation(SHADER_PROGRAM, 'model')
    UNIFORM_VIEW       = glGetUniformLocation(SHADER_PROGRAM, 'view')

    vao = create_vao()

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
        glRasterPos(0, 0, ARROW_H * 1.5)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18, ord('x') + axis)
        glutSolidCone(ARROW_R, ARROW_H, 8, 8)

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
    global perspective

    perspective = (THETA_H, w/h, 1.0, max(lims) * 10)

    window_w, window_h = w, h

    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    #gluPerspective(THETA_H, w/h, 1.0, max(lims) * 10)
    gluPerspective(*perspective)
    glMatrixMode(GL_MODELVIEW)

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

def draw_yukicotan(point):
    glPushAttrib(GL_CURRENT_BIT)
    glColor3d(1, 0, 0)
    glPushMatrix()
    glTranslated(point[0], point[1] + SPHERE_R, point[2])

    #glutSolidSphere(SPHERE_R / 4, 10, 10)

    glUseProgram(SHADER_PROGRAM)
    projection = np.array(glm.perspective(*perspective)).transpose().astype(np.float32)
    view = np.array(glm.lookAt(*lookAt)).transpose().astype(np.float32)
    model = np.matrix([
        [100.0, 0.0, 0.0, 0.0],
        [0.0, 100.0, 0.0, 0.0],
        [0.0, 0.0, 100.0, 0.0],
        [0.0, 0.0, 0.0, 1.0],
    ], dtype=np.float32).transpose()
    #glUniformMatrix4fv(UNIFORM_MODEL,      1, GL_FALSE, model);
    #glUniformMatrix4fv(UNIFORM_VIEW,       1, GL_FALSE, view);
    #glUniformMatrix4fv(UNIFORM_PROJECTION, 1, GL_FALSE, projection);
    # marker

    glBindVertexArray(vao)
    glDrawElements(GL_TRIANGLES, 3, GL_UNSIGNED_INT, None)
    glBindVertexArray(0)
    glUseProgram(0)

    glPopMatrix()
    glPopAttrib()
    return

    glPushMatrix()
    projection = np.array(glm.perspective(*perspective)).astype(np.float32)
    #print(projection.transpose());exit()
    view = np.array(glm.lookAtLH(*lookAt)).astype(np.float32)
    model = np.matrix([
        [100.0, 0.0, 0.0, 0.0],
        [0.0, 100.0, 0.0, 0.0],
        [0.0, 0.0, 100.0, 0.0],
        [0.0, 0.0, 0.0, 1.0],
    ], dtype=np.float32).transpose()

    points = np.array((
        ( 0.0,  0.5, 0.0),
        ( 0.5, -0.5, 0.0),
        (-0.5, -0.5, 0.0),
        #lookAt[0],
        #lookAt[1],
    )) * 100
    points = np.hstack((points, np.array([[1]] * len(points))))
    points = np.linalg.multi_dot((
        #np.linalg.inv(projection),
        #np.linalg.inv(model),
        points,
        view,
        projection,
        #projection.transpose(),
        #np.linalg.inv(projection),
        #np.linalg.inv(projection.transpose()),
    ))
    points = points / points[:,3][:,np.newaxis]
    #print(points);exit()
    #return
    glBegin(GL_TRIANGLES)
    glVertex3f(*points[0][:3])
    glVertex3f(*points[1][:3])
    glVertex3f(*points[2][:3])
    glEnd()
    glPopMatrix()

    return

def draw_sphere(point):
    glPushAttrib(GL_CURRENT_BIT)
    glColor3d(1, 0, 0)
    glPushMatrix()
    glTranslated(point[0], point[1] + SPHERE_R, point[2])
    glutSolidSphere(SPHERE_R, 10, 10)
    glPopMatrix()
    glPopAttrib()

def display():
    global time_before
    global is_capturing

    if select.select([sys.stdin], [], [], 0)[0]:
        for i in sys.stdin.readline():
            pass
        exit(0)

    glViewport(0, STATUS_WINDOW_H, window_w, window_h)

    default_color = np.array([1, 1, 1]) * 0
    glClearColor(*default_color, 0.0)
    glColor3f(*(1 - default_color))

    glLoadIdentity()

    glPushMatrix() # pushpop_null_0 {

    # car { ####################################################################
    #is_im_car = True
    sample       = car.get_sample()

    car_eye      = sample[0]

    car_theta_f  = sample[1]
    car_theta_r  = np.copy(car_theta_f); car_theta_r[1] += pi

    car_center_f = linalg.get_center(car_eye, car_theta_f)
    car_center_r = linalg.get_center(car_eye, car_theta_r)

    glPushMatrix() # pushpop_null_1 {
    if is_front_camera:
        glPushMatrix()
        img_r = draw_camera(car_eye, car_center_r); #img_r.show();exit()
        glPopMatrix()
        img_f = draw_camera(car_eye, car_center_f); #img_f.show();exit()
    else:
        glPushMatrix()
        img_f = draw_camera(car_eye, car_center_f); #img_f.show();exit()
        glPopMatrix()
        img_r = draw_camera(car_eye, car_center_r); #img_r.show();exit()
    #img_f.show();exit()
    #img_f, img_r = None, None

    additional = {'car': car, 'is_driving': is_driving}
    car.set_odmetry(drive(img_f, img_r, additional))

    if not is_im_car:
        glPopMatrix()  # pushpop_null_1 }
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        setLookAt(eye, linalg.get_center(eye, theta), UP)
        draw_tex(map_tex, map_img)

    if is_capturing:
        img = get_img()
        filename = datetime.datetime.now().strftime('%Y%m%dT%H%M%S.png')
        img.save(filename)
        img.show()
        is_capturing = not is_capturing

    if not is_im_car:
        if is_view_car:
            point = [sample[0][0], 0, sample[0][2]]
            draw_sphere(point)
            #draw_yukicotan(point)
            car_arrow_eye = np.copy(car_eye); car_arrow_eye[1] = SPHERE_R * 3
            draw_arrow(car_arrow_eye, car_theta_f)
        glPushMatrix() # pushpop_world {

    # car } ####################################################################

    # axis { ###################################################################
    if is_plot_axis:
        plot_axis()

    if is_plot_tick:
        plot_tick()
    # axis } ###################################################################

    glPopMatrix()  # pushpop_null_1 or pushpop_world }
    glPopMatrix()  # pushpop_null_0

    # show_status { ############################################################
    car_status = car.get_status()

    time_now = datetime.datetime.now()
    sec_diff = (time_now - time_before).total_seconds()
    time_before = time_now
    frame_per_sec = 1 / sec_diff

    glPushMatrix() # pushpop_status {
    setLookAt((0, 0, window_h), (0, 0, 0), (0, 1, 0))
    #gluPerspective(80, window_w / STATUS_WINDOW_H, 1.0, window_w * 2)
    #glOrtho(-window_w // 2, window_w // 2, STATUS_WINDOW_H // 2, -STATUS_WINDOW_H // 2, -window_w // 2, window_w // 2)

    glViewport(0, 0, window_w // 2, STATUS_WINDOW_H)
    #glPushMatrix()
    #glTranslated(0, 0, 100)
    #glutSolidCone(ARROW_R, ARROW_H, 8, 8)
    #glPopMatrix()
    #glRasterPos(-window_w // 4 * 0.8 // 1, STATUS_WINDOW_H, 0)
    #glRasterPos(-window_w // 4 * 0.8 // 1, STATUS_WINDOW_H, 10)
    #glRasterPos(0, STATUS_WINDOW_H, 0)
    #glRasterPos(-window_w // 4, 0, 0)
    #glRasterPos(-window_w * window_w / VIEWPORT_W ** 2 // 4, 0, 0)
    #glRasterPos(-window_w / cos(pi/180*35) // 4 // 1, 0, 0)
    #VIEWPORT_H = 640
    #VIEWPORT_W = 480
    #window_h = 
    #STATUS_WINDOW_H = 100
    #35
    glRasterPos(-window_w / 1.91 // 4 // 1, 0, 0)
    #glRasterPos(-1000, STATUS_WINDOW_H, 0)
    putstr('eye:   ' + str(eye.astype(int)))
    putstr('___________________________________________________________________theta: ' + str((theta / pi * 180).astype(int)))
    putstr('fps:   ' + str(int(frame_per_sec)))

    #glViewport(window_w // 2, 0, window_w, STATUS_WINDOW_H)
    #glRasterPos(-window_w // 4 * 0.8 // 1, STATUS_WINDOW_H, 0)
    #putstr('eye:       ' + str(car_status['eye'].astype(np.int)))
    #putstr('theta:     ' + str((car_status['theta'] / pi * 180).astype(np.int)))
    #putstr('odmetry:   ' + str(car_status['odmetry']))

    glPopMatrix()  # pushpop_status }
    # show_status } ############################################################

    glutSwapBuffers()

def putstr(string):
    glutBitmapString(GLUT_BITMAP_HELVETICA_18, str(string + '\n').encode())

def keyboard(key, x, y):
    global is_key_pressing
    global is_plot_axis
    global is_plot_tick
    global is_im_car
    global is_front_camera
    global is_view_car
    global is_capturing
    global is_driving
    global sample_before

    char = key.decode('utf-8')
    keycode = int.from_bytes(key, "big")

    #print("char: '{}', keycode: '{}'".format(char, keycode))

    if keycode == 3 or keycode == 23 or keycode == 13: # C-c C-w Enter
        exit(0)
    if keycode == 9: # Tab
        if is_im_car:
            set_eye(sample_before[0])
            set_theta(sample_before[1])
        else:
            sample_before = eye, theta
        is_im_car = not is_im_car
    elif char == ' ':
        is_driving = not is_driving
    elif char == 'b':
        is_front_camera = not is_front_camera
    elif char == 'c':
        is_capturing = True
    elif char == 't':
        is_plot_tick = not is_plot_tick
    elif char == 'v':
        is_view_car = not is_view_car
    elif char == 'x':
        is_plot_axis = not is_plot_axis
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
    n[1] = 0 if char in 'hjkl' else n[1]
    n = -np.cross(n, np.array([0, 1, 0])) if char in 'hl' else n
    n = np.array([0, 1, 0]) if char in '20-+=;'             else n
    diff = sign * n * lims_mean / 100 * 1
    set_eye(eye + diff)

def mouse(button, state, x, y):
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

    if is_mouse_pressing or is_key_pressing:
        dx = mx - x
        dy = my - y

        mx = x
        my = y

        n = linalg.get_n(eye, linalg.get_center(eye, theta))

        set_theta((theta + np.array([dy, dx, 0]) * 0.001) % (pi * 2))

def set_eye(eye_in):
    global eye
    eye = eye_in

def set_theta(theta_in):
    global theta
    theta = theta_in

def get_img():
    content_w = window_w
    content_h = window_h - STATUS_WINDOW_H

    pixels = glReadPixels(
        0,
        STATUS_WINDOW_H,
        content_w,
        content_h,
        GL_RGB,
        GL_UNSIGNED_BYTE
    )

    array = np.frombuffer(pixels, dtype=np.uint8)
    array = array.reshape(content_h, content_w, 3)[:,:,0]
    array = np.flipud(array)

    img = Image.fromarray(array)

    return img

def draw_camera(car_eye, car_center):
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    setLookAt(car_eye, car_center, UP)
    draw_tex(map_tex, map_img)
    img = get_img(); #img.show();exit()

    return img

from drive_py import drive
#def drive(img_f, img_r):
#    status = car.get_status()
#    car_eye = status['eye']
#    car_theta = status['theta'] / pi * 180
#
#    if not is_driving:
#        odmetry = (0, 0)
#    elif \
#        90 < car_theta[1] <= 180 and car_eye[2] <  90 or \
#         0 < car_theta[1] <=  90 and car_eye[0] <  90 or \
#       270 < car_theta[1] <= 360 and car_eye[2] > 505 or \
#       180 < car_theta[1] <= 270 and car_eye[0] > 335 or \
#       False:
#        odmetry = (0.25, -128)
#    else:
#        odmetry = (1.0,    0)
#
#    return odmetry

def draw_arrow(eye, theta):
    glPushMatrix()
    glTranslated(*eye)
    glRotated(-theta[1] / pi * 180, 0, 1, 0)
    glRotated( theta[0] / pi * 180, 1, 0, 0)
    glutSolidCone(ARROW_R / 4, ARROW_H / 4, 8, 8)
    glPopMatrix()

def setLookAt(eye, center, up):
    global lookAt
    lookAt = np.array((eye, center, up)).astype(np.float32)
    gluLookAt(*eye, *center, *up)

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
