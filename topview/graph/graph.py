#!/usr/bin/python3

import cv2
import numpy as np
from math import sin,cos,pi
from itertools import product

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from functools import reduce
from PIL import Image

# wm_p:  1 point    of point cloud on map             on world  coodinate
# wm_ps: N points   of point cloud on map             on world  coodinate
# wm_v:  1 vertex                  on map             on world  coodinate
# wm_vs: N vertexes                on map             on world  coodinate
# wf_p:  1 point    of point cloud on focused surface on world  coodinate
# wf_ps: N points   of point cloud on focused surface on world  coodinate
# wf_v:  1 vertex                  of focused surface on world  coodinate
# wf_vs: N vertexes                of focused surface on world  coodinate
# cf_p:  1 point    of point cloud on focused surface on camera coodinate
# cf_ps: N points   of point cloud on focused surface on camera coodinate
# cf_v:  1 vertex                  of focused surface on camera coodinate
# cf_vs: N vertexes                of focused surface on camera coodinate

# calculate rotation matrix by theta
# theta: [theta_x, theta_y, theta_z] (float, rad)
def get_r(theta):
    r_x = np.array([[          1  ,            0  ,            0  ],
                    [          0  ,  cos(theta[0]), -sin(theta[0])],
                    [          0  ,  sin(theta[0]),  cos(theta[0])]])
    r_y = np.array([[cos(theta[1]),            0  , -sin(theta[1])],
                    [          0  ,            1  ,            0  ],
                    [sin(theta[1]),            0  ,  cos(theta[1])]])
    r_z = np.array([[cos(theta[2]), -sin(theta[2]),            0  ],
                    [sin(theta[2]),  cos(theta[2]),            0  ],
                    [          0  ,            0  ,            1  ]])
    r = np.dot(r_y, r_x)
    return r

# convert camera coodinate to world coodinate
# c:   np.array.shape == (3,)
# eye: np.array.shape == (3,)
# r:   np.array.shape == (3, 3)
def c2w(c, eye, r):
    w = np.dot(r, c) + eye
    return w

# convert point on focused surface on camere coodinate to
# point on map on world coodinate
# cf:  np.array.shape == (3,)
# eye: np.array.shape == (3,)
# r:   np.array.shape == (3, 3)
def cf2wm(cf, eye, r):
    wf = c2w(cf, eye, r)
    n = wf - eye
    x = -eye[1] / n[1] * n[0] + eye[0]
    y = 0
    z = -eye[1] / n[1] * n[2] + eye[2]
    wm = np.array([x, y, z])
    return wm

# uv -> cf
# u:      scalar int
# v:      scalar int
# F:      scalar float
# WIDTH:  scalar int
# HEIGHT: scalar int
# SCALE:  scalar float
def uv2cf(u, v, F, WIDTH, HEIGHT, SCALE):
    c = np.array([(WIDTH / 2 - u) / SCALE, (HEIGHT / 2 - v) / SCALE, F])
    return c

#def get_img_view(eye, r, F, WIDTH, HEIGHT, SCALE, IMG_MAP):
#    img_view = Image.new('L', (WIDTH, HEIGHT), 0)
#
#    for v, u in product(range(0, HEIGHT), range(0, WIDTH)):
#        cf_p = uv2cf(u, v, F, WIDTH, HEIGHT, SCALE)
#        wm_p = cf2wm(cf_p, eye, r).astype(int)
#
#        if 0 < wm_p[0] < IMG_MAP.shape[0] and 0 < wm_p[2] < IMG_MAP.shape[1]:
#            img_view.putpixel((u, v), (IMG_MAP[wm_p[2]][wm_p[0]],))
#
#    return img_view

# eye:     np.array.shape == (3,)
# r:       np.array.shape == (3, 3)
# F:       scalar float
# WIDTH:   scalar int
# HEIGHT:  scalar int
# SCALE:   scalar float
# IMG_MAP: np.array.shape == (*, *) (must be grayscale, use cv2.imread())
# ret:     np.array.shape == (WIDTH, HEIGHT) (img_view)
def get_img_view(eye, r, F, WIDTH, HEIGHT, SCALE, IMG_MAP):
    img_view = np.zeros((HEIGHT, WIDTH))

    for v, u in product(range(0, HEIGHT), range(0, WIDTH)):
        cf_p = uv2cf(u, v, F, WIDTH, HEIGHT, SCALE)
        wm_p = cf2wm(cf_p, eye, r).astype(int)

        x, z = wm_p[0], wm_p[2]
        if 0 <= z < IMG_MAP.shape[0] and 0 <= x < IMG_MAP.shape[1]:
            img_view[v][u] = IMG_MAP[z][x]

    return img_view

# gui { ########################################################################

def plot_axis(ax, lims):
    #ax.set_xlim3d(0, lims[0])
    #ax.set_ylim3d(0, lims[1])
    #ax.set_zlim3d(0, lims[2])

    ax.set_xlim3d(0, max(lims))
    ax.set_ylim3d(0, max(lims))
    ax.set_zlim3d(0, max(lims))

    # plot axis
    ax.plot([0, lims[0]], [0,       0], [0,       0] , "-", c='000000')
    ax.plot([0,       0], [0, lims[1]], [0,       0] , "-", c='000000')
    ax.plot([0,       0], [0,       0], [0, lims[2]] , "-", c='000000')

    # label x, y, z, O
    ax.text(lims[0] * 1.08,              0,              0, "x", color='black')
    ax.text(             0, lims[1] * 1.08,              0, "y", color='black')
    ax.text(             0,              0, lims[2] * 1.08, "z", color='black')
    ax.text(             0,              0,              0, "O", color='black')

    # plot tick
    DIFF = 50
    lims_axis = []
    for axis in range(3):
        for i in range(0, lims[axis] + 1, DIFF):
            begin = [0, 0, 0]
            begin[axis - 0] = i
            begin[axis - 2] = lims[axis - 2]
            begin[axis - 1] = 0
            end = list(begin)
            end[axis - 2] = 0
            ax.plot(*list(zip(begin, end)), "--", c='black', linewidth=0.5)

            begin[axis - 2] = 0
            begin[axis - 1] = lims[axis - 1]
            end = list(begin)
            end[axis - 1] = 0
            ax.plot(*list(zip(begin, end)), "--", c='black', linewidth=0.5)

            labelpos = [0, 0, 0]
            labelpos[axis - 0] = i
            labelpos[axis - 2] = 0
            labelpos[axis - 1] = 0
            ax.text(*labelpos, str(i), color='black')

def plot_rectangle(ax, points, line_type='-', c='000000'):
    ax.plot(*list(zip(*points, points[0])), line_type, c=c)

def to_affine(matrix):
    if matrix.shape == (3, 3):
        r = matrix
        r = np.vstack((r, np.array([0, 0, 0])))
        r = np.hstack((r, np.array([[0, 0, 0, 1]]).T))
        return r

    print('error: graph.py: to_affine: unknown shape')
    exit(1)

# gui } ########################################################################

def main():
    eye = np.array([300, 100, 400])

    # 0 <= theta_x <= 90, 0 <= theta_y <= 180
    theta = np.array([40, 180, 0]) / 180 * pi
    r = get_r(theta)

    REDUCE = 4
    F = 50

    WIDTH, HEIGHT = (np.array((640, 480)) / REDUCE).astype(int)
    SCALE = 600 / F / REDUCE

    IMG_MAP = cv2.imread("ref_map.png", 0)

    img_view = get_img_view(eye, r, F, WIDTH, HEIGHT, SCALE, IMG_MAP)
    img_view = Image.fromarray(img_view)
    img_view.show()
    #img_view.convert('RGB').save('a.png')

    DIFF = int(1 + WIDTH / 100 * 5)
    wm_ps = [] # point cloud of projected region on map
    for v, u in product(range(0, HEIGHT, DIFF), range(0, WIDTH, DIFF)):
        cf_p = uv2cf(u, v, F, WIDTH, HEIGHT, SCALE)
        wm_p = cf2wm(cf_p, eye, r)
        wm_ps.append(wm_p)

    wf_vs = [] # 4 vertexes of focused surface
    wm_vs = [] # 4 vertexes of projected region on map
    for v, u in ((0, 0), (HEIGHT, 0), (HEIGHT, WIDTH), (0, WIDTH)):
        cf_v = uv2cf(u, v, F, WIDTH, HEIGHT, SCALE)
        wf_v =   c2w(cf_v, eye, r); wf_vs.append(wf_v)
        wm_v = cf2wm(cf_v, eye, r); wm_vs.append(wm_v)

    # init #####################################################################
    fig = plt.figure()
    ax = Axes3D(fig)
    ax.set_axis_off()

    # plot map #################################################################
    #img = cv2.imread("ref_map.png",0)
    #shape = img.shape
    #lsd = cv2.createLineSegmentDetector(0)
    #lines = lsd.detect(img)[0]
    #lines = np.array(lines).reshape(len(lines), 4)

    lines = np.load('map.npy')
    shape = (600, 428)

    lines = np.array(
        [
            lines[0:,0], lines[0:,2],                   # x
            np.zeros(len(lines)), np.zeros(len(lines)), # y = 0
            lines[0:,1], lines[0:,3]                    # z
        ]
    ).T.reshape(len(lines), 3, 2)

    for line in lines:
        ax.plot(*line, "-", c='red', linewidth=0.5)

    # ax #######################################################################

    # axis
    lims = (shape[1], 300, shape[0])
    plot_axis(ax, lims)

    # eye
    ax.plot(*zip(eye), "o")
    ax.plot(*list(zip(eye, c2w(np.array([0, 50, 0]), eye, r))), '-', c='blue')

    # rectangle on F
    plot_rectangle(ax, wf_vs)

    # point cloud on map
    for wm_p in wm_ps:
        if 0 < wm_p[0] < lims[0] and 0 < wm_p[2] < lims[2]:
            ax.plot([wm_p[0]], [wm_p[1]], [wm_p[2]], "o", c='000000', ms=2)

    # lines from eye to vertexes on map
    for wm_v in wm_vs:
        ax.plot(*list(zip(eye, wm_v)), "--", c='000000')

    # rectangle on map
    plot_rectangle(ax, wm_vs)

    #vaio
    #ax.set_aspect('equal')

    AFS = [
        to_affine(get_r([pi / 180 * 90, 0, 0])),
        to_affine(get_r([0, -pi / 180 * 30, 0])),
        np.diag([*([1.6] * 3), 1]),
        np.array([
            [1, 0, 0, 60],
            [0, 1, 0, 250],
            [0, 0, 1, 1],
            [0, 0, 0, 1],
        ]),
    ]
    AF = reduce(lambda res, x: np.dot(res, x), AFS, np.eye(4))
    ax.get_proj = lambda: np.dot(Axes3D.get_proj(ax), AF)

    plt.show()

if __name__ == '__main__':
    main()

