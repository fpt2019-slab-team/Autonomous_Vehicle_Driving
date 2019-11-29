#!/usr/bin/python3

from line import *

import matplotlib.animation as animation
import time
import matplotlib.pyplot as plt
import sys

from multiprocessing import Manager, Value, Process
from itertools import product
from mpl_toolkits.mplot3d import Axes3D
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from functools import reduce
from PIL import Image, ImageDraw

# gui { ########################################################################

# ax:   Axes3D
# lims: (lim_x, lim_y, lim_z)
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
    DIFF = 500
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

# ax:        Axes3D
# points:    np.shape == (4, 3) (4 points)
# line_type: (optional) str ('-' or '--')
# c:         (optional) str (6 hex digits, color code)
def plot_rectangle(ax, points, line_type='-', c='000000'):
    ax.plot(*list(zip(*points, points[0])), line_type, c=c)

# matrix: np.shape == (3, 3)
# ret:    np.shape == (4, 4)
def to_affine(matrix):
    if matrix.shape == (3, 3):
        r = matrix
        r = np.vstack((r, np.array([0, 0, 0])))
        r = np.hstack((r, np.array([[0, 0, 0, 1]]).T))
        return r

    print('error: graph.py: to_affine: unknown shape')
    exit(1)

# gui } ########################################################################

# debug { ######################################################################
def func_draw(_, dargs, aw, ax):
    eye             = dargs['eye']
    r               = dargs['r']
    uv_lines        = dargs['uv_lines']
    CONTEXT         = dargs['CONTEXT']
    BIRD            = dargs['BIRD']
    LINES_LSD_XYZ   = dargs['LINES_LSD_XYZ']
    MAP_SIZE        = dargs['MAP_SIZE']
    LINE_WIDTH      = dargs['LINE_WIDTH']
    FIGSIZE         = dargs['FIGSIZE']
    FIGPOS          = dargs['FIGPOS']
    AFS             = dargs['AFS']
    WM_LINES        = dargs['WM_LINES']
    EYE_Y           = dargs['EYE_Y']

    IS_TV = True
    uv_lines = wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT) # get camera view
    #append_lines  = np.array([
    #    filter_uv_line_pretv_fixed(np.array([[0, 0],[640, 480]]), CONTEXT),
    #    np.array([[0, 240],[640, 240]]),
    #])
    #uv_lines = np.append(uv_lines, append_lines, axis=0)
    filter_uv_line_pretv_fixed(np.array([[0, 0], [640, 480]]), CONTEXT),
    if IS_TV:
        #uv_lines = bird_view_fixed(uv_lines, eye, BIRD, CONTEXT)
        #time_before = time.time()
        uv_lines = uv_lines2tvs_fixed(uv_lines, EYE_Y, BIRD, CONTEXT) # TODO
        #time_after = time.time()
        #print(time_after - time_before)
    img = uv_lines2img(uv_lines, CONTEXT, LINE_WIDTH)

    aw.cla()
    ax.cla()
    aw.set_position([0.05, 0.05, 0.4, 0.9])
    ax.set_position([0.40, 0.05, 0.6, 0.9])
    aw.imshow(img, cmap='gray', vmin=0, vmax=255, interpolation='none')
    ax.set_axis_off()

    # plot map
    if IS_TV:
        EYE_ZERO = np.array([0, BIRD[1], 0])
        R_ZERO = theta2r(np.array([pi / 2, 0, 0]))
        wm_lines = uv_lines2wm_lines(uv_lines, EYE_ZERO, R_ZERO, CONTEXT)
        wm_lines = wm_lines + np.array([BIRD[0], 0, BIRD[2]])
    else:
        wm_lines = uv_lines2wm_lines_fixed(uv_lines, EYE_Y, CONTEXT)
    for i in range(len(wm_lines)):
        wm_lines[i] = np.array([
            np.dot(r, wm_lines[i][0]),
            np.dot(r, wm_lines[i][1]),
        ])
    wm_lines = wm_lines + np.array([eye[0], 0, eye[2]])
    lines = np.array((
        wm_lines[:,0,0], wm_lines[:,1,0], # x
        [0] * len(wm_lines), [0] * len(wm_lines), # y
        wm_lines[:,0,2], wm_lines[:,1,2], # z
    )).T.reshape(len(wm_lines), 3, 2)
    #lines = np.array((
    #    LINES_MAP_XYZ[:,0], LINES_MAP_XYZ[:,3], # x
    #    LINES_MAP_XYZ[:,1], LINES_MAP_XYZ[:,4], # y
    #    LINES_MAP_XYZ[:,2], LINES_MAP_XYZ[:,5], # z
    #)).T.reshape(len(LINES_MAP_XYZ), 3, 2)
    for line in lines:
        ax.plot(*line, "-", c='red', linewidth=0.5)

    # plot axis
    lims = (np.array((MAP_SIZE[0], min(MAP_SIZE) / 2, MAP_SIZE[1]))).astype(int)
    plot_axis(ax, lims)

    # plot eye, axis of c
    ax.plot(*zip(eye), "o")
    ax.plot([eye[0]], [0], [eye[2]], "o")
    l = min(MAP_SIZE) / 10
    ax.plot(*list(zip(eye, c2w(np.array([l, 0, 0]), eye, r))), '-', c='green')
    ax.plot(*list(zip(eye, c2w(np.array([0, l, 0]), eye, r))), '-', c='green')
    ax.plot(*list(zip(eye, c2w(np.array([0, 0, l]), eye, r))), '-', c='green')

    # UV_VS
    UV_VS = get_UV_VS(CONTEXT)

    # plot rectangle of F
    wf_vs = [] # 4 verticies of focused surface (4, 3)
    for uv in UV_VS:
        cf_v = uv2cf(uv, CONTEXT)
        wf_v =   c2w(cf_v, eye, r);
        wf_vs.append(wf_v)
    plot_rectangle(ax, wf_vs)

    # plot rectangle of map, lines from eye to rectangle of map
    wm_vs = [] # 4 verticies of projected region on map
    for uv in UV_VS:
        wm_v = uv2wm(uv, eye, r, CONTEXT)
        wm_vs.append(wm_v)
    if w2c(wm_vs[3], eye, r)[2] >= 0: # top edge of view is on map
        wm_vs = np.array(wm_vs)
        plot_rectangle(ax, wm_vs)
        for wm_v in wm_vs:
            ax.plot(*list(zip(eye, wm_v)), '--', c='000000')
    else: # top edge of view is at infinity (behind of camera)
        # convert wm_vs[2'], wm_vs[3'] -> wm_vs[2], wm_vs[3]
        #        2'______________________________ 3'        |
        #          -                            -           |
        #           \ -                      - /            |
        #            \   -                -   /             |
        #             \     -  camera  -     /              |
        #              \       - /\ -       /               |
        #               \      / -- \      /                |
        #                \   /-      -\   /                 |
        #                 \-____________-/                  |
        #               - 0              1 -                |
        #            -           ||           -             |
        #         -             \||/             -          |
        #      -                 \/                 -       |
        # 3 -                  front                   - 2  |
        #                                                   |
        n21 = line2n((wm_vs[2], wm_vs[1]))
        n30 = line2n((wm_vs[3], wm_vs[0]))
        wm_vs[2] = wm_vs[0] + n21 * max(MAP_SIZE)
        wm_vs[3] = wm_vs[1] + n30 * max(MAP_SIZE)
        wm_vs = np.array(wm_vs)
        ax.plot(*list(zip(wm_vs[0], wm_vs[1])), '-', c='000000')
        ax.plot(*list(zip(wm_vs[1], wm_vs[2])), '-', c='000000')
        ax.plot(*list(zip(wm_vs[3], wm_vs[0])), '-', c='000000')
        ax.plot(*list(zip(eye, wm_vs[0])), '--', c='000000')
        ax.plot(*list(zip(eye, wm_vs[1])), '--', c='000000')
        ax.plot(*list(zip(eye, wf_vs[2])), '--', c='000000')
        ax.plot(*list(zip(eye, wf_vs[3])), '--', c='000000')

    # plot eye_b
    eye_b, r_b = eye_r2eye_r_b(eye, r, BIRD)
    ax.plot(*zip(eye_b), "o")
    ax.plot([eye_b[0]], [0], [eye_b[2]], "o")
    # plot rectangle of bird
    wm_bvs = [] # 4 verticies of bird (4, 3)
    for uv in UV_VS:
        wm_bv = uv2wm(uv, eye_b, r_b, CONTEXT)
        wm_bvs.append(wm_bv)
    wm_bvs = np.array(wm_bvs)
    plot_rectangle(ax, wm_bvs)
    # plot lines from eye_b to rectangle of bird
    for wm_bv in wm_bvs:
        ax.plot(*list(zip(eye_b, wm_bv)), '--', c='000000')
    l = min(MAP_SIZE) / 5
    c = 'green'
    ax.plot(*list(zip(eye_b, c2w(np.array([l, 0, 0]), eye_b, r_b))), '-', c=c)
    ax.plot(*list(zip(eye_b, c2w(np.array([0, l, 0]), eye_b, r_b))), '-', c=c)
    ax.plot(*list(zip(eye_b, c2w(np.array([0, 0, l]), eye_b, r_b))), '-', c=c)

    # affine
    AF = reduce(lambda res, x: np.dot(res, x), AFS, np.eye(4))
    ax.get_proj = lambda: np.dot(Axes3D.get_proj(ax), AF)

def debug(dargs):
    fig = plt.figure(figsize=dargs['FIGSIZE'])
    aw = fig.add_subplot(1, 2, 1)
    ax = fig.add_subplot(1, 2, 2, projection='3d')

    process_update = Process(target=func_update_wrap, kwargs={'dargs': dargs})
    process_update.start()

    #interval=100
    _ = animation.FuncAnimation(fig, func_draw, fargs=(dargs, aw, ax))
    plt.show()

def func_update_wrap(dargs):
    while True:
        func_update(dargs)

# debug } #######################################################################

# main { #######################################################################
def func_update(dargs):
    eye           = dargs['eye']
    r             = dargs['r']
    uv_lines      = dargs['uv_lines']
    CONTEXT       = dargs['CONTEXT']
    BIRD          = dargs['BIRD']
    #LINES_LSD_XYZ = dargs['LINES_LSD_XYZ']
    #MAP_SIZE      = dargs['MAP_SIZE']
    #LINE_WIDTH    = dargs['LINE_WIDTH']
    #FIGSIZE       = dargs['FIGSIZE']
    #FIGPOS        = dargs['FIGPOS']
    #AFS           = dargs['AFS']
    WM_LINES      = dargs['WM_LINES']

    eye = np.array([eye[0], eye[1], eye[2] - 10])
    r = np.dot(r, theta2r(np.array([0, 0.1, 0]) / 180 * pi))

    uv_lines = wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT)
    uv_lines = bird_view_fixed(uv_lines, eye, BIRD, CONTEXT)

    dargs['eye']      = eye
    dargs['r']        = r
    #dargs['uv_lines'] = uv_lines

    time.sleep(0.001)

def main():
    # setup
    np.seterr(divide='raise')

    # definition: never changed on actual driving
    EYE_Y = 100 # mm
    BIRD = np.array([0, 2000, 2000])
    THETA_H = 35 / 180 * pi
    REDUCE = 1
    F = 100 # l
    MAP_SIZE = (3500, 4900) # x, z

    # initialization: never changed on actual driving, calculated by definition
    WIDTH, HEIGHT = (np.array((640, 480)) / REDUCE).astype(int) # px
    SCALE = HEIGHT / 2 / tan(THETA_H / 2) / F # px / l
    CONTEXT = {
        'F'     : F     ,
        'WIDTH' : WIDTH ,
        'HEIGHT': HEIGHT,
        'SCALE' : SCALE ,
    }
    LINES_LSD_XZ = np.load('map.large_18522x13230.npy') / 18522 * max(MAP_SIZE)
            # (293, 4)
    LINES_LSD_XYZ = np.insert(LINES_LSD_XZ, (1, 3), 0, axis=1) # (293, 6)
    WM_LINES  = LINES_LSD_XYZ.reshape(len(LINES_LSD_XYZ), 2, 3) # (293, 2, 3)

    # definition: can be changed on actual driving
    x, z = 3500 / 2, 4900
    theta_y = 180

    # body
    eye = np.array([x, EYE_Y, z])
    theta = np.array([0, theta_y, 0]) / 180 * pi # 0 <= theta_x <= 90
    r = theta2r(theta)

    uv_lines = wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT)
    #uv_lines = bird_view(uv_lines, eye, r, BIRD, CONTEXT)
    uv_lines = bird_view_fixed(uv_lines, eye, BIRD, CONTEXT)

    # debug
    LINE_WIDTH = 3 # line width of img [px]
    FIGSIZE=np.array((1 * 2, 1)) * 6 # (width, height) [inches]
    FIGPOS=([0.05, 0.05, 0.4, 0.9], # [left_edge_pos, bottom_edge_pos,
            [0.40, 0.05, 0.6, 0.9]),#     width, height]
    AFS = [ # list of affine matrix
        to_affine(theta2r(np.array([90,   0, 0]) * pi / 180)),
        to_affine(theta2r(np.array([ 0,  30, 0]) * pi / 180)),
        np.diag([*([1.6] * 3), 1]),
        np.array([
            [1, 0, 0,  600],
            [0, 1, 0, 2500],
            [0, 0, 1,    1],
            [0, 0, 0,    1],
        ]),
    ]

    dargs = Manager().dict({
        # modified by func_update
        'eye'               : eye,
        'r'                 : r,
        'uv_lines'          : uv_lines,
        # const
        'CONTEXT'           : CONTEXT,
        'BIRD'              : BIRD,
        'LINES_LSD_XYZ'     : LINES_LSD_XYZ,
        'MAP_SIZE'          : MAP_SIZE,
        'LINE_WIDTH'        : LINE_WIDTH,
        'FIGSIZE'           : FIGSIZE,
        'FIGPOS'            : FIGPOS,
        'AFS'               : AFS,
        'WM_LINES'          : WM_LINES,
        'EYE_Y'             : EYE_Y,
    })

    debug(dargs)

if __name__ == '__main__':
    main()

# main } #######################################################################
