#!/usr/bin/python3

import cv2
import numpy as np
from math import sin,cos,pi
from itertools import product

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from functools import reduce
from PIL import Image, ImageDraw

################################################################################
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

################################################################################
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

################################################################################
# w:   np.array([x, y, z])
# c:   np.array([x, y, z])
# eye: np.array([x, y, z])
# r:   np.array.shape == (3, 3)

def w2c(w, eye, r):
    c = np.dot(np.linalg.inv(r), (w - eye))
    return c

def c2w(c, eye, r):
    w = np.dot(r, c) + eye
    return w

################################################################################
# uv:     (float, float)
# cf:     np.array([float, F, float])
# F:      float
# WIDTH:  int
# HEIGHT: int
# SCALE:  float

def cf2uv(cf, F, WIDTH, HEIGHT, SCALE):
    x = cf[0]
    y = cf[1]
    u = WIDTH  / 2 - x * SCALE
    v = HEIGHT / 2 - y * SCALE
    uv = np.array([u, v])
    return uv

def uv2cf(uv, F, WIDTH, HEIGHT, SCALE):
    u = uv[0]
    v = uv[1]
    x = (WIDTH  / 2 - u) / SCALE
    y = (HEIGHT / 2 - v) / SCALE
    cf = np.array([x, y, F])
    return cf

################################################################################
# wm:     np.array([x, 0, z])
# uv:     (float, float)
# eye:    np.array([x, y, z])
# r:      np.array.shape == (3, 3)
# F:      float
# WIDTH:  int
# HEIGHT: int
# SCALE:  float

def wm2uv(wm, eye, r, F, WIDTH, HEIGHT, SCALE):
    #print('wm: ', wm.astype(int))
    cm = w2c(wm, eye, r)
    #print('cm: ', cm.astype(int))
    cf = cm2cf(cm, F)
    #print('cf: ', cf.astype(int))
    uv = cf2uv(cf, F, WIDTH, HEIGHT, SCALE)
    #print('uv: ', uv.astype(int))
    return uv

def uv2wm(uv, eye, r, F, WIDTH, HEIGHT, SCALE):
    cf = uv2cf(uv, F, WIDTH, HEIGHT, SCALE)
    wf = c2w(cf, eye, r)
    wm = wf2wm(wf, eye, r)
    return wm
    # uv, cf, wf, wm

################################################################################
# cm: np.array([x, y, z])
# F:  float
def cm2cf(cm, F):
    x = F / cm[2] * cm[0]
    y = F / cm[2] * cm[1]
    z = F
    cf = np.array([x, y, z])
    return cf

################################################################################
# wf:  np.array([x, y, z])
# eye: np.array([x, y, z])
# r:   np.array.shape == (3, 3)
def wf2wm(wf, eye, r):
    n = wf - eye
    x = -eye[1] / n[1] * n[0] + eye[0]
    y = 0
    z = -eye[1] / n[1] * n[2] + eye[2]
    wm = np.array([x, y, z])
    return wm

################################################################################
# eye:     np.array([x, y, z])
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
        uv = (u, v)
        wm_p = uv2wm(uv, eye, r, F, WIDTH, HEIGHT, SCALE).astype(int)

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

# added
def is_inside(u, v, WIDTH, HEIGHT):
    return 0 <= u <= WIDTH - 1 and 0 <= v <= HEIGHT - 1

# added
# https://www.hiramine.com/programming/graphics/2d_segmentintersection.html
# line: np.shape == (2, 2)
def get_intersection(line_0, line_1):
    pa = line_0[0]
    pb = line_0[1]
    pc = line_1[0]
    pd = line_1[1]

    d = (pb[0] - pa[0]) * (pd[1] - pc[1]) - (pb[1] - pa[1]) * (pd[0] - pc[0])

    if d == 0: # parallel
        return None

    dac = pc - pa;

    r = ((pd[1] - pc[1]) * dac[0] - (pd[0] - pc[0]) * dac[1]) / d
    s = ((pb[1] - pa[1]) * dac[0] - (pb[0] - pa[0]) * dac[1]) / d

    intersection = pa + r * ( pb - pa )

    if 0 <= r <= 1 and 0 <= s <= 1:
        return intersection
    else:
        return None

def get_true_indexes(array):
    indexes = []
    for i in range(len(array)):
        if hasattr(array[i], '__iter__'):
            if len(array[i]) != 0:
                indexes.append(i)
        elif bool(array[i]):
            indexes.append(i)

    return indexes

def main():
    eye = np.array([300, 100, 350])

    # 0 <= theta_x <= 90, 0 <= theta_y <= 180
    theta = np.array([40, 180, 0]) / 180 * pi
    r = get_r(theta)

    REDUCE = 1
    F = 50

    WIDTH, HEIGHT = (np.array((640, 480)) / REDUCE).astype(int)
    SCALE = 600 / F / REDUCE

    eye_m = c2w(np.array([0, 0, 2 * F]), eye, r)
    theta_m = pi - theta
    #theta_m = np.array([pi - theta[0], pi - theta[1], theta[2]])
    r_m = get_r(theta_m)

    ############################################################################
    #wm = np.array([300, 0, 0])
    #uv = wm2uv(wm, eye, r, F, WIDTH, HEIGHT, SCALE)
    #wm = uv2wm(uv, eye, r, F, WIDTH, HEIGHT, SCALE)
    #print(uv, wm)
    #exit()

    ############################################################################
    lines_lsd = np.load('map.npy')[29:30] # (293, 4)
    lines_tmp = lines_lsd
    lines_tmp = np.insert(lines_tmp, 1, 0, axis=1)
    lines_tmp = np.insert(lines_tmp, 4, 0, axis=1)
    lines_wm  = lines_tmp.reshape(len(lines_tmp), 2, 3) # (293, 2, 3)

    lines_uv = [] # (293, 2, 2)
    for line_wm in lines_wm: # (2, 3)
        line_uv = [] # (2, 2)
        for wm in line_wm: # (2,)
            cm = w2c(wm, eye, r)
            if cm[2] >= F:
                uv = wm2uv(wm, eye,   r,   F, WIDTH, HEIGHT, SCALE) # (2,)
            else:
                uv = wm2uv(wm, eye_m, r_m, F, WIDTH, HEIGHT, SCALE) # (2,)
            line_uv.append(uv)
        lines_uv.append(line_uv)
    lines_uv = np.array(lines_uv)

    img_line = Image.fromarray(np.zeros((HEIGHT, WIDTH)))
    draw_line = ImageDraw.Draw(img_line)
    for i in range(len(lines_uv)):
        #line_uv = lines_uv_filtered[i]
        line_uv = lines_uv[i]
        uv0 = line_uv[0]
        uv1 = line_uv[1]
        draw_line.line((*uv0, *uv1), fill=255, width=1)
    img_line.show()

    ############################################################################
    edges_uv = np.array([
        [[    0,      0], [WIDTH,      0]],
        [[WIDTH,      0], [WIDTH, HEIGHT]], 
        [[WIDTH, HEIGHT], [    0, HEIGHT]],
        [[    0, HEIGHT], [    0,      0]],
    ])

    is_insides = [] # (293, 2)
    for line_uv in lines_uv:
        is_insides.append([
            is_inside(line_uv[0][0], line_uv[0][1], WIDTH, HEIGHT),
            is_inside(line_uv[1][0], line_uv[1][1], WIDTH, HEIGHT),
        ])

    intersections = [] # (293, 4, 2)
    for line_uv in lines_uv:
        intersections.append([
            get_intersection(line_uv, edges_uv[0]),
            get_intersection(line_uv, edges_uv[1]),
            get_intersection(line_uv, edges_uv[2]),
            get_intersection(line_uv, edges_uv[3]),
        ])

    #lines_uv_filtered = [] # (293 - *, 2, 2)
    #for i in range(len(lines_uv)):
    #    indexes_is_inside = get_true_indexes(is_insides[i])
    #    indexes_intersection = get_true_indexes(intersections[i])
    #    if len(indexes_is_inside) == 2:
    #        lines_uv_filtered.append(lines_uv[i])
    #    elif len(indexes_is_inside) == 1: # len(intersections[i]) == 1
    #        pa = lines_uv[i][indexes_is_inside[0]]
    #        pb = intersections[i][indexes_intersection[0]]
    #        if indexes_is_inside[0] == 1:
    #            pa, pb = np.copy(pb), np.copy(pa)
    #        lines_uv_filtered.append(np.array([pa, pb]))
    #    elif len(indexes_intersection) == 2: # 0 or 2
    #        pa = intersections[i][indexes_intersection[0]]
    #        pb = intersections[i][indexes_intersection[1]]
    #        norm_pa_0 = np.linalg.norm(lines_uv[i][0] - pa)
    #        norm_pa_1 = np.linalg.norm(lines_uv[i][1] - pa)
    #        if norm_pa_0 > norm_pa_1:
    #            pa, pb = pb, pa
    #        lines_uv_filtered.append(np.array([pa, pb]))
    #    if len(lines_uv_filtered) == 3:
    #        print(i)
    #        print(lines_uv[i])
    ##lines_uv_filtered = lines_uv_filtered[:int(len(lines_uv_filtered) / 4)]
    #lines_uv_filtered = lines_uv_filtered[2:4]
    #print(lines_uv_filtered[0])
    #print(len(lines_uv_filtered))

    ############################################################################

    #IMG_MAP = cv2.imread("ref_map.png", 0)

    #img_view = get_img_view(eye, r, F, WIDTH, HEIGHT, SCALE, IMG_MAP)
    #img_view = Image.fromarray(img_view)
    #img_view.show()
    #exit()

    ############################################################################
    DIFF = int(1 + WIDTH / 100 * 5)
    wm_ps = [] # point cloud of projected region on map
    for v, u in product(range(0, HEIGHT, DIFF), range(0, WIDTH, DIFF)):
        wm_p = uv2wm((u, v), eye, r, F, WIDTH, HEIGHT, SCALE)
        wm_ps.append(wm_p)

    wf_vs = [] # 4 vertexes of focused surface
    for v, u in ((0, 0), (HEIGHT, 0), (HEIGHT, WIDTH), (0, WIDTH)):
        cf_v = uv2cf((u, v), F, WIDTH, HEIGHT, SCALE)
        wf_v =   c2w(cf_v, eye, r);
        wf_vs.append(wf_v)

    wm_vs = [] # 4 vertexes of projected region on map
    for v, u in ((0, 0), (HEIGHT, 0), (HEIGHT, WIDTH), (0, WIDTH)):
        wm_v = uv2wm((u, v), eye, r, F, WIDTH, HEIGHT, SCALE)
        wm_vs.append(wm_v)

    # init #####################################################################
    fig = plt.figure()
    ax = Axes3D(fig)
    ax.set_axis_off()

    # plot map #################################################################

    map_size = (600, 428)

    lines = np.array([
        lines_lsd[:,0],           lines_lsd[:,2],           # x
        np.zeros(len(lines_lsd)), np.zeros(len(lines_lsd)), # y = 0
        lines_lsd[:,1],           lines_lsd[:,3]            # z
    ]).T.reshape(len(lines_lsd), 3, 2)

    for line in lines:
        ax.plot(*line, "-", c='red', linewidth=0.5)

    # ax #######################################################################

    # axis
    lims = (map_size[1], 300, map_size[0])
    plot_axis(ax, lims)

    # eye
    ax.plot(*zip(eye), "o")
    ax.plot(*list(zip(eye, c2w(np.array([0, 50, 0]), eye, r))), '-', c='blue')

    # rectangle on F
    plot_rectangle(ax, wf_vs)

    # point cloud on map
    for wm_p in wm_ps:
        if 0 < wm_p[0] < lims[0] and 0 < wm_p[2] < lims[2]:
            #ax.plot([wm_p[0]], [wm_p[1]], [wm_p[2]], "o", c='000000', ms=2)
            pass

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

