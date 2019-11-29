#!/usr/bin/python3

from line import *
from debug_line import debug, to_affine

import time

from multiprocessing import Manager

def FUNC_UPDATE(dargs):
    eye           = dargs['eye']
    r             = dargs['r']
    CONTEXT       = dargs['CONTEXT']
    BIRD          = dargs['BIRD']
    WM_LINES_MAP  = dargs['WM_LINES_MAP']
    EYE_Y         = dargs['EYE_Y']

    # get camera view
    uv_lines = wm_lines2uv_lines(WM_LINES_MAP, eye, r, CONTEXT)
    # get top view
    tv = uv_lines2tvs_fixed(uv_lines, EYE_Y, BIRD, CONTEXT)

    # op = (acc, ste)
    #op = get_op_wrap(uv_lines, tv, dargs)
    #deye, dr = op2deye_dr(op)
    #eye = eye + deye
    #r   = r   + dr

    eye = np.array([eye[0], eye[1], eye[2] - 10])
    r   = r @ theta2r(np.array([0, 0.1, 0]) / 180 * pi)

    dargs['eye'] = eye
    dargs['r']   = r

    #time.sleep(0.001)

def uv_lines2op(uv_lines, dargs):
    return op

def get_op_wrap(uv_lines, tv, dargs):
    op = dargs['op']
    feedback = op2feedback(op)
    #x_hat = kalman(uv_lines_f, uv_lines_r, tv_f, tv_r, feedback, passed_time) # imamura
    #op = get_op(uv_lines_f, uv_lines_r, tv_f, tv_r, feedback, x_hat)  # fukui
    op = get_op(uv_lines_f, uv_lines_r, tv_f, tv_r, feedback)  # fukui
    dargs['op'] = op
    return op

def main():
    # setup
    np.seterr(divide='raise')

    # definition: never changed on actual driving
    EYE_Y = 100 # mm
    BIRD = np.array([0, 2000, 2000])
    THETA_W = 35 / 180 * pi
    REDUCE = 1
    F = 100 # l
    MAP_SIZE = (3500, 4900) # x, z

    # initialization: never changed on actual driving, calculated by definition
    WIDTH, HEIGHT = (np.array((640, 480)) / REDUCE).astype(int) # px
    SCALE = WIDTH / 2 / tan(THETA_W / 2) / F # px / l
    CONTEXT = {
        'F'     : F     ,
        'WIDTH' : WIDTH ,
        'HEIGHT': HEIGHT,
        'SCALE' : SCALE ,
    }
    # (293, 4)
    LINES_LSD_XZ = np.load('map.large_18522x13230.npy') / 18522 * max(MAP_SIZE)
    # (293, 6)
    LINES_LSD_XYZ = np.insert(LINES_LSD_XZ, (1, 3), 0, axis=1)
    # (293, 2, 3)
    WM_LINES_MAP  = LINES_LSD_XYZ.reshape(len(LINES_LSD_XYZ), 2, 3)

    # definition: can be changed on actual driving
    x, z = 3500 / 2, 4900
    theta_y = 180

    # body
    eye = np.array([x, EYE_Y, z])
    theta = np.array([0, theta_y, 0]) / 180 * pi # 0 <= theta_x <= 90
    r = theta2r(theta)

    uv_lines = wm_lines2uv_lines(WM_LINES_MAP, eye, r, CONTEXT)
    #uv_lines = bird_view(uv_lines, eye, r, BIRD, CONTEXT)
    #uv_lines = bird_view_fixed(uv_lines, eye, BIRD, CONTEXT)

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
    IS_TV = False
    SHOWN_MAP = ['TV', 'CAMERA', 'MAP', 'NONE'][1]
    SHOWN_IMG = ['TV', 'CAMERA'               ][0]

    dargs = Manager().dict({
        # modified by func_update
        'eye'               : eye,
        'r'                 : r,
        'uv_lines'          : uv_lines,
        # const
        'CONTEXT'           : CONTEXT,
        'BIRD'              : BIRD,
        'WM_LINES_MAP'      : WM_LINES_MAP,
        'MAP_SIZE'          : MAP_SIZE,
        'LINE_WIDTH'        : LINE_WIDTH,
        'FIGSIZE'           : FIGSIZE,
        'FIGPOS'            : FIGPOS,
        'AFS'               : AFS,
        'EYE_Y'             : EYE_Y,
        'FUNC_UPDATE'       : FUNC_UPDATE,
        'IS_TV'             : IS_TV,
        'SHOWN_MAP'         : SHOWN_MAP,
        'SHOWN_IMG'         : SHOWN_IMG,
    })

    debug(dargs)

if __name__ == '__main__':
    main()

