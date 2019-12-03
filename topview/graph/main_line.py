#!/usr/bin/python3

from line import *
from debug_line import debug, to_affine
import driver

import time

from multiprocessing import Manager

def FUNC_UPDATE(dargs):
    eye              = dargs['eye']
    r                = dargs['r']
    CONTEXT          = dargs['CONTEXT']
    BIRD             = dargs['BIRD']
    WM_LINES_MAP     = dargs['WM_LINES_MAP']
    EYE_Y            = dargs['EYE_Y']
    TIME_ORIGIN      = dargs['TIME_ORIGIN']
    DRIVER           = dargs['DRIVER']
    D_EYE_CAM_F      = dargs['D_EYE_CAM_F']
    D_EYE_CAM_R      = dargs['D_EYE_CAM_R']

    time_before = dargs['time_before']
    time_now    = time.time()
    dargs['time_before'] = time_now
    #sec = time_now - time_before
    sec = 0.1

    r_f = r
    r_r = r @ theta2r(np.array([0, pi, 0]))
    eye_f = eye + r_f @ np.array([0, D_EYE_CAM_F, 0])
    eye_r = eye + r_r @ np.array([0, D_EYE_CAM_R, 0])

    # get camera view
    uv_lines_f = wm_lines2uv_lines(WM_LINES_MAP, eye_f, r_f, CONTEXT)
    uv_lines_r = wm_lines2uv_lines(WM_LINES_MAP, eye_r, r_r, CONTEXT)
    # get top view
    tv_f = uv_lines2tvs_fixed(uv_lines_f, EYE_Y, BIRD, CONTEXT)
    tv_r = uv_lines2tvs_fixed(uv_lines_r, EYE_Y, BIRD, CONTEXT)

    # op: (acc, ste)
    if True:
        elapsed_time = sec

        accste       = dargs['accste']
        xhat         = dargs['xhat']
        trigger_time = dargs['trigger_time']
        route_id     = dargs['route_id']

        feedback = DRIVER.accste2rpslr(*accste)

        lsd_front_lines     = uv_lines_f
        lsd_rear_lines      = uv_lines_r
        topview_front_lines = tv_f
        topview_rear_lines  = tv_r
        xhat = DRIVER.navi(xhat, trigger_time, lsd_front_lines, lsd_rear_lines, topview_front_lines, topview_rear_lines, feedback, elapsed_time)

        accste = DRIVER.control(xhat, trigger_time, topview_front_lines, feedback, route_id)

        dargs['accste']       = accste
        dargs['xhat']         = xhat
        dargs['trigger_time'] = trigger_time
        dargs['route_id']     = route_id

    #accste = (127, 32) # (0, 127), (-128, 127)

    deye, dr = accste2deye_dr_fixed(accste, r, sec, DRIVER)

    #deye   = np.array([0, 0, 0])
    #dr     = theta2r(np.array([0, 0.01, 0]))

    eye = eye + deye
    r   = r   @ dr

    dargs['eye'] = eye
    dargs['r']   = r

    #time.sleep(0.01)

# theta  = [0, theta_y, 0]
# deye   = np.array([0, 0, *])
# dtheta = np.array([0, *, 0])
def accste2deye_dr_fixed(accste, r, sec, DRIVER):
    rpslr = DRIVER.accste2rpslr(accste[0], accste[1])
    distance_per_sec, dtheta_y = DRIVER.rpslr2vw(*rpslr)
    deye = (r @ np.array([0, 0, 1])) * distance_per_sec * sec
    dr = theta2r(np.array([0, (dtheta_y * sec), 0]))
    return deye, dr

def main():
    # setup
    np.seterr(divide='raise')

    # definition: never changed on actual driving
    EYE_Y = 100 # mm
    BIRD = np.array([0, 2000, 1000])
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
    #LINES_LSD_XZ = np.load('map.large_18522x13230.npy') / 18522 * max(MAP_SIZE)
    LINES = np.load('map.3500x4900.npy')
    LINES_XZ = LINES.reshape(len(LINES), 4)
    # (293, 6)
    LINES_XYZ = np.insert(LINES_XZ, (1, 3), 0, axis=1)
    # (293, 2, 3)
    WM_LINES_MAP  = LINES_XYZ.reshape(len(LINES_XYZ), 2, 3)

    # definition: can be changed on actual driving
    #x, z = 1575, 700
    #theta_y = 180

    # debug
    LINE_WIDTH = 3 # line width of img [px]
    FIGSIZE=np.array((1 * 2, 1)) * 6 # (width, height) [inches]
    FIGPOS=([0.00, 0.05, 0.40, 0.9], # [left_edge_pos, bottom_edge_pos,
            [0.40, 0.05, 0.60, 0.9]) #     width, height]
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
    SHOWN_IMG = ['TV', 'CAMERA'               ][1]
    IS_REAR = False
    D_EYE_CAM_F = 90  # mm
    D_EYE_CAM_R = 120 # mm
    DRIVER = driver.Driver(
        IS_PID              = False,
        IS_KEEPLEFT         = False,
        IS_KALMAN           = False,
        IS_DETECT_COURSEOUT = False,
        IS_SIMULATION       = True,
        BIRD                = BIRD,
    )
    INIT_XHAT = DRIVER.INIT_XHAT

    x, z, theta_y = 175, 4160, INIT_XHAT['th']
    eye = np.array([x, EYE_Y, z])
    theta = np.array([0, theta_y, 0]) # 0 <= theta_x <= pi / 2
    r = theta2r(theta)

    uv_lines = wm_lines2uv_lines(WM_LINES_MAP, eye, r, CONTEXT)
    #uv_lines = bird_view(uv_lines, eye, r, BIRD, CONTEXT)
    #uv_lines = bird_view_fixed(uv_lines, eye, BIRD, CONTEXT)

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
        'IS_REAR'           : IS_REAR,
        'DRIVER'            : DRIVER,
        'D_EYE_CAM_F'       : D_EYE_CAM_F,
        'D_EYE_CAM_R'       : D_EYE_CAM_R,
    })

    debug(dargs)

if __name__ == '__main__':
    main()

