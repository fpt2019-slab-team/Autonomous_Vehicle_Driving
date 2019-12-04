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
    DIFF = 700
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
    WM_LINES_MAP    = dargs['WM_LINES_MAP']
    MAP_SIZE        = dargs['MAP_SIZE']
    LINE_WIDTH      = dargs['LINE_WIDTH']
    FIGSIZE         = dargs['FIGSIZE']
    FIGPOS          = dargs['FIGPOS']
    AFS             = dargs['AFS']
    WM_LINES_MAP    = dargs['WM_LINES_MAP']
    EYE_Y           = dargs['EYE_Y']
    IS_TV           = dargs['IS_TV']
    SHOWN_MAP       = dargs['SHOWN_MAP']
    SHOWN_IMG       = dargs['SHOWN_IMG']
    IS_REAR         = dargs['IS_REAR']
    D_EYE_CAM_F     = dargs['D_EYE_CAM_F']
    D_EYE_CAM_R     = dargs['D_EYE_CAM_R']

    r_f = r
    r_r = r @ theta2r(np.array([0, pi, 0]))
    eye_f = eye + r_f @ np.array([0, 0, D_EYE_CAM_F])
    eye_r = eye + r_r @ np.array([0, 0, D_EYE_CAM_R])

    eye, r = (eye_f, r_f) if not IS_REAR else (eye_r, r_r)

    uv_lines = wm_lines2uv_lines(WM_LINES_MAP, eye, r, CONTEXT) #  camera view

    # additional draw line
    #append_lines  = np.array([
        #np.array([[0, 0],[640, 480]]),
    #])
    #uv_lines = np.append(uv_lines, append_lines, axis=0)

    tv = uv_lines2tvs_fixed(uv_lines, EYE_Y, BIRD, CONTEXT)

    uv_lines_img = tv if SHOWN_IMG == 'TV' else uv_lines
    img = uv_lines2img(uv_lines_img, CONTEXT, LINE_WIDTH)

    aw.tick_params(labelbottom=False, labelleft=False, labelright=False, labeltop=False)
    aw.cla()
    ax.cla()
    aw.set_position(FIGPOS[0])
    ax.set_position(FIGPOS[1])
    aw.imshow(img, cmap='gray', vmin=0, vmax=255, interpolation='none')
    ax.set_axis_off()

    # plot map
    if SHOWN_MAP == 'TV':
        EYE_ZERO = np.array([0, BIRD[1], 0])
        R_ZERO = theta2r(np.array([pi / 2, 0, 0]))
        wm_lines = uv_lines2wm_lines(tv, EYE_ZERO, R_ZERO, CONTEXT)
        if len(wm_lines) != 0:
            wm_lines = wm_lines + np.array([BIRD[0], 0, BIRD[2]])
    elif SHOWN_MAP == 'CAMERA':
        wm_lines = uv_lines2wm_lines_fixed(uv_lines, EYE_Y, CONTEXT)
    else:
        wm_lines = WM_LINES_MAP
    if len(wm_lines) == 0:
        lines = np.array([])
    else:
        if SHOWN_MAP in ['CAMERA', 'TV']:
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
    # 4 verticies of projected region on map
    wm_vs = np.array([uv2wm(uv, eye, r, CONTEXT) for uv in UV_VS])

    if w2c(wm_vs[3], eye, r)[2] >= 0: # top edge of view is on map
        plot_rectangle(ax, wm_vs)
        for wm_v in wm_vs:
            ax.plot(*list(zip(eye, wm_v)), '--', c='000000')
    else: # top edge of view is at infinity (behind of camera)
        # convert wm_vs[2'], wm_vs[3'] -> wm_vs[2], wm_vs[3]
        #        2'______________________________ 3'        |
        #          \                            /           |
        #           \                          /            |
        #            \                        /             |
        #             \        camera        /              |
        #              \         /\         /               |
        #               \      /    \      /                |
        #                \   /        \   /                 |
        #                 \/____________\/                  |
        #               - 0              1 -                |
        #            -           ||           -             |
        #         -             \||/             -          |
        #      -                 \/                 -       |
        # 3 -                  front                   - 2  |
        #                                                   |
        wm_vs = get_wm_vs_infinity(eye, r, CONTEXT, max(MAP_SIZE))
        ax.plot(*list(zip(wm_vs[0], wm_vs[1])), '-', c='000000')
        ax.plot(*list(zip(wm_vs[1], wm_vs[2])), '-', c='000000')
        ax.plot(*list(zip(wm_vs[3], wm_vs[0])), '-', c='000000')
        ax.plot(*list(zip(eye, wm_vs[0])), '--', c='000000')
        ax.plot(*list(zip(eye, wm_vs[1])), '--', c='000000')
        ax.plot(*list(zip(eye, wf_vs[2])), '--', c='000000')
        ax.plot(*list(zip(eye, wf_vs[3])), '--', c='000000')

    # plot eye_b
    # todo
    eye_b, r_b = eye_r2eye_r_b(eye, r, BIRD)
    ax.plot(*zip(eye_b), "o")
    ax.plot([eye_b[0]], [0], [eye_b[2]], "o")
    #ax.plot([eye_b[0], wm_vs[0][0]], [0, 0], [eye_b[2], wm_vs[0][2]])
    # plot rectangle of bird (4 verticies of bird (4, 3))
    wm_bvs = np.array([uv2wm(uv, eye_b, r_b, CONTEXT) for uv in UV_VS])
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
    init_dargs  = dargs['INIT_DARGS']
    func_update = dargs['FUNC_UPDATE']
    init_dargs(dargs)
    while True:
        func_update(dargs)

# debug } #######################################################################

