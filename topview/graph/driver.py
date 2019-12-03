#!/usr/bin/python3
from multiprocessing import Manager, Value, Process

import numpy as np
import math
import time, pickle

import pid
import pspl

from line import *

from keepleft import KeepLeft
# from kalman import KalmanFilter

# ROAD MAP
# z\x   0   1   2   3   4 (0-3500 [mm])
#     /-------------------\
#  0  |   i   i   i   i   |
#     | - /----   ----\   |
#  1  |   |   |   |   |   |
#     | - |   |   |   |   |
#  2  |   |   |   |   |   |
#     | - -----   -----   |
#  3  |         o         |
#     | - -----   -----   |
#  4  |   |   |   |   |   |
#     | - |   |   |   |   |
#  5  |   |   |   |   |   |
#     | - \----   ----/   |
#  6  |                   |
#     \-------------------/
# (0-4900 [mm])

class Driver:
    # instructions
    BEGIN       = 0
    END         = 1
    STRAIGHT    = 2
    TURN_LEFT   = 3
    TURN_RIGHT  = 4

    ##### initilizer ##### {
    def __init__(
        self,

        ### FIXED PARAMETER ### {
        # flag {
        IS_PID              = True,
        IS_KEEPLEFT         = True,
        IS_KALMAN           = True,
        IS_DETECT_COURSEOUT = True,
        IS_SIMULATION       = False,
        # }

        # map {
        TILE_LEN   =  700,         # [mm]
        DX         =  700 / 4,     # [mm]
        DZ         =  700 / 4 * 3, # [mm]
        ROUTE_PATH = './route.txt',
        # }

        # car {
        RADIUS     =  15,           # [mm]
        TREAD      =  110,          # [mm]
        RPS_MAX    =  9.0,          # [rad/sec]
        # }

        # pid {
        Kp         = 0.55,
        Ki         = 0.2,
        Kd         = 0.1,
        B          = 0,
        # }

        # keep left {
        XRNG_SPTH        = 0,             # START PIXEL OF VALID XRANGE [px]
        XRNG_EPTH        = 480,           # END   PIXEL OF VALID XRANGE [px] (0-640px)
        ZRNG_SPTH        = 0,             # START PIXEL OF VALID YRANGE [px]
        ZRNG_EPTH        = 640,           # END   PIXEL OF VALID YRANGE [px] (0-480px)
        LLEN_PTH         = 0,             # LENGTH      OF VALID LINE   [px]
        ANG_LTL          = np.pi * 60/180, # LOOSE TOLERANCE OF EQAUL ANGLE  [radian]
        ANG_TTL          = np.pi * 5/180,  # TIGHT TOLERANCE OF EQAUL ANGLE  [radian]
        PLD_PTL          = (500 ** 2) * 3, # TOLERANCE OF PAIR LINE DISTANCE [px] (500)
        # }

        # kalman {
        PX              = 1.0,
        PZ              = 1.0,
        PYAW            = 0.00001,
        CAMERA_DX       = 0.0,   # [mm]
        CAMERA_DZ       = 90.0,  # [mm]
        CAMERA_DY       = 100.0, # [mm]
        STDDEV_V        = 0.5,
        STDDEV_W        = 0.0,
        STDDEV_X        = 1.0,
        STDDEV_Z        = 1.0,
        STDDEV_YAW      = 0.0,
        REF_LINES_PATH  = 'map.npy',
        ROLLPITCH       = np.array([[1,0,0],
                                    [0,1,0],
                                    [0,0,1]]),
        THRESHOLD_LEN   = 2000,
        THRESHOLD_RAD   = np.deg2rad(15),
        THRESHOLD_DIS   = 5,
        PRM_ERR_CAM1    = 15,
        PRM_ERR_CAM2    = 15,
        # }

        # camera {
        HEIGHT          = 480, # [px]
        WIDTH           = 640, # [px]
        THETA_W         = 35 / 180 * math.pi,
        F               = 1,
        BIRD            = np.array([0, 2000, 2000])
        ):

        SCALE           = WIDTH / 2 / math.tan(THETA_W / 2) / F # px / l
        EYE_Y           = CAMERA_DY
        CONTEXT = {
            'F'     : F     ,
            'WIDTH' : WIDTH ,
            'HEIGHT': HEIGHT,
            'SCALE' : SCALE ,
            }

        ROUTE      = self.__init_route(ROUTE_PATH)
        REF_LINES_XZ    = np.load(REF_LINES_PATH)
        # }

        self.__fixed_param = {
            'tile_len': TILE_LEN,
            'radius'  : RADIUS,
            'rps_max' : RPS_MAX,
            'tread'   : TREAD,
            'route'   : ROUTE,
            'camera_y': EYE_Y,
            'bird'    : BIRD,
            'context' : CONTEXT,
        }

        # initialization {
        # PS / PL
        self.__pspl_comm = pspl.pspl_comm()

        # xhat initialize
        uth = self.__calibration() if not IS_SIMULATION else 0
        x, z, theta = self.init_xhat(DX, DZ, uth)
        self.INIT_XHAT = {'x': x, 'z': z, 'th': theta}
        print("x:{}, z:{}, theta:{}".format(x, z, theta))

        self.is_detect_courseout = IS_DETECT_COURSEOUT

        # keep left
        self.is_keepleft = IS_KEEPLEFT
        self.__keepleft = KeepLeft(
            WIDTH     = WIDTH,
            HEIGHT    = HEIGHT,
            XRNG_SPTH = XRNG_SPTH,
            XRNG_EPTH = XRNG_EPTH,
            ZRNG_SPTH = ZRNG_SPTH,
            ZRNG_EPTH = ZRNG_EPTH,
            LLEN_PTH  = LLEN_PTH,
            ANG_LTL   = ANG_LTL,
            ANG_TTL   = ANG_TTL,
            PLD_PTL   = PLD_PTL
        ) if not IS_KEEPLEFT else None

        # kalman {
        self.is_kalman  = IS_KALMAN
        xhat              = np.array([[x], [z], [theta]])
        p                 = np.diag([PX, PZ, PYAW]) ** 2
        dev               = np.array([STDDEV_V, STDDEV_W, STDDEV_X, STDDEV_Z, STDDEV_YAW])
        ref_lines_xyz     = np.insert(REF_LINES_XZ, (1, 3), 0, axis=1)
        ref_lines_wm      = ref_lines_xyz.reshape(len(ref_lines_xyz), 2, 3)
        front_camera_rad  = theta
        rear_camera_rad   = theta + np.pi if theta < 0 else theta - np.pi
        fcpdx             = CAMERA_DX * math.cos(theta) - CAMERA_DZ * math.sin(theta)
        fcpdz             = CAMERA_DX * math.sin(theta) + CAMERA_DZ * math.cos(theta)
        front_camera_pos  = xhat + np.array([[fcpdx], [CAMERA_DY], [fcpdz]])
        rear_camera_pos   = xhat + np.array([[-fcpdx], [CAMERA_DY], [-fcpdz]])

        self.__kalman = KalmanFilter(
            x_hat         = xhat,
            P             = p,
            dev           = dev,
            REF_LINE      = ref_lines_wm,
            HEIGHT        = HEIGHT,
            WIDTH         = WIDTH,
            DR            = TREAD,
            Tire_radius   = RADIUS,
            T_camera1     = front_camera_pos,
            T_camera2     = rear_camera_pos,
            R_camera1_rad = np.array([np.deg2rad(0), front_camera_rad, np.deg2rad(0)]),
            R_camera2_rad = np.array([np.deg2rad(0), rear_camera_rad, np.deg2rad(0)]),
            Rslope        = ROLLPITCH,
            Thre_len      = THRESHOLD_LEN,
            Thre_rad      = THRESHOLD_RAD,
            THRE          = THRESHOLD_DIS,
            c1            = PRM_ERR_CAM1,
            c2            = PRM_ERR_CAM2,
        ) if IS_KALMAN else None
        # } kalman

        # pid
        self.is_pid  = IS_PID
        self.__pid_l = pid.PID(Kp, Ki, Kd, B)
        self.__pid_r = pid.PID(Kp, Ki, Kd, B)
        # }

    # load route {
    def __init_route(self, path):
        f = open(path, 'rb')
        route = pickle.load(f)
        f.close()
        return route
    # }

    # initial xhat {
    def init_xhat(self, dx, dz, uth):
        route = self.__fixed_param['route']
        tlen  = self.__fixed_param['tile_len']

        z1, x1 = route[0][0], route[0][1]
        z2, x2 = route[1][0], route[1][1]

        n = np.array([(x2 - x1), (z2 - z1)])
        if   n[1] ==  1 and n[0] ==  0:
            theta = 0 * np.pi / 2
        elif n[1] ==  0 and n[0] ==  1:
            theta = 1 * np.pi / 2
        elif n[1] == -1 and n[0] ==  0:
            theta = 2 * np.pi / 2
        elif n[1] ==  0 and n[0] == -1:
            theta = 3 * np.pi / 2

        r = theta2r(np.array([0, theta, 0]))
        sx, _, sz = r @ np.array([dx, 0, dz])

        x, z = x1 * tlen + tlen / 2 + sx, z1 * tlen + sz + tlen / 2

        return x, z, theta + uth
    # }

    # calibration {
    def __calibration(self):
        self.__pspl_comm.begin()
        uth = 0
        EYE_Y   = self.__fixed_param['camera_y']
        BIRD    = self.__fixed_param['bird']
        CONTEXT = self.__fixed_param['context']
        topview_front_lines = self.__pspl_comm.get_front_topview_lines(EYE_Y, BIRD, CONTEXT)
        self.__pspl_comm.end()
        print("calibration finished.")
        return uth
    # }
    # } initializer

    # hard-coded steering {
    def __hard_coded_control(self, instruction):
        rps_max = self.__fixed_param['rps_max']
        if instruction == self.BEGIN:
            rps_l, rps_r = rps_max, rps_max
        elif instruction == self.STRAIGHT:
            rps_l, rps_r = rps_max, rps_max
        elif instruction == self.TURN_LEFT:
            rps_l, rps_r = self.__duty2rps(89/127), self.__duty2rps(1)
        elif instruction == self.TURN_RIGHT:
            rps_l, rps_r = self.__duty2rps(1), self.__duty2rps(95/127)
        elif instruction == self.END:
            rps_l, rps_r = 0, 0
        else:
            rps_l, rps_r = 0, 0
        return rps_l, rps_r
    # }

    def pos2tile(self, posx, posz):
        tl = self.__fixed_param['tile_len']
        tx = int(posx / tl)
        tz = int(posz / tl)
        return [tz, tx]

    # motor speed to vw {
    def rpslr2vw(self, rps_l, rps_r):
        v = self.__rpslr2v(rps_l, rps_r)
        w = self.__rpslr2w(rps_l, rps_r)
        return v, w
    # }

    # motor speed to v {
    def __rpslr2v(self, rps_l, rps_r):
        v = self.__fixed_param['radius']*0.5*(rps_r+rps_l)
        return v
    # }

    # motor speed to w {
    def __rpslr2w(self, rps_l, rps_r):
        w = self.__fixed_param['radius']*(rps_r-rps_l)/self.__fixed_param['tread']
        return w
    # }

    # motor speed to xhat {
    def __feedback2odometry(self, feedback, pre_xhat, elapsed_time):
        v, w = self.rpslr2vw(*feedback)
        theta = w * elapsed_time                   + pre_xhat['th']
        x     = v * elapsed_time * math.sin(theta) + pre_xhat['x']
        z     = v * elapsed_time * math.cos(theta) + pre_xhat['z']
        return x, z, theta
    # }

    # motor speed to duty {
    def __rps2duty(self, rps):
        return rps / self.__fixed_param['rps_max']
    # }

    # duty to motor speed {
    def __duty2rps(self, duty):
        return duty * self.__fixed_param['rps_max']
    # }

    # acc, ste to left and right duty {
    def __accste2dutylr(self, acc, ste):
        if ste < 0:
            duty_l = acc / 127
            duty_r = (acc + ste) / 127 if acc + ste > 0 else 0
        else:
            duty_l = (acc - ste) / 127 if acc - ste > 0 else 0
            duty_r = acc / 127
        return duty_l, duty_r
    # }

    # left and right duty to acc, ste {
    def dutylr2accste(self, duty_l, duty_r):
        if duty_l < duty_r:
            if duty_l < 0:
                duty_l, duty_r = 0, duty_r - duty_l
            if duty_r > 1:
                duty_l, duty_r = duty_l / duty_r, 1
            acc = duty_r * 127
            ste = acc - (duty_l * 127)

        else:
            if duty_r < 0:
                duty_l, duty_r = duty_l - duty_r, 0
            if duty_l > 1:
                duty_l, duty_r = 1, duty_r / duty_l
            acc = duty_l * 127
            ste = duty_r * 127 - acc

        return int(acc), int(ste)
    # }

    # left and right rps to acc, ste {
    def accste2rpslr(self, acc, ste):
        dl, dr = self.__accste2dutylr(acc, ste)
        rps_l = self.__duty2rps(dl)
        rps_r = self.__duty2rps(dr)
        return rps_l, rps_r
    # }

    # diff theta to diff left rps and right rps {
    def __utheta2urpslr(self, utheta):
        urps_l, urps_r = 0, 0
        rps_max = self.__fixed_param['rps_max']
        k       = self.__fixed_param['radius'] / self.__fixed_param['tread']

        if utheta > 0:       # ste -> left
            urps_r = rps_max
            urps_l = urps_r - utheta / k
        else:                # ste -> right
            urps_l = rps_max
            urps_r = urps_l + utheta / k
        return urps_l, urps_r
    # }

    # handle cantrol process {
    def __control_proc(self, is_pspl_comm, xhat, trigger_time):
        rps_l, rps_r = 0, 0
        route_id = [0] # for by reference

        while True:
            time.sleep(0.5)

            while is_pspl_comm == 1: pass
            is_pspl_comm = 1
            EYE_Y   = self.__fixed_param['camera_y']
            BIRD    = self.__fixed_param['bird']
            CONTEXT = self.__fixed_param['context']
            topview_front_lines = self.__pspl_comm.get_front_topview_lines(EYE_Y, BIRD, CONTEXT)
            fbrps_l, fbrps_r = self.__pspl_comm.get_motors_speed()
            is_pspl_comm = 0

            acc, ste = self.control(xhat, trigger_time.value, topview_front_lines, (fbrps_l, fbrps_r), route_id)

            # Set RESULT {
            while is_pspl_comm == 1: pass
            is_pspl_comm = 1
            self.__pspl_comm.set_accel_and_steer(acc, ste)
            is_pspl_comm = 0
            # }
    # }

    # handle cantrol {
    # inst is by reference
    def control(self, xhat, trigger_time, topview_front_lines, feedback, route_id):
        fbrps_l, fbrps_r = feedback
        v, w = self.rpslr2vw(fbrps_l, fbrps_r)
        utheta = xhat['th']

        tile_hat     = self.pos2tile(xhat['x'], xhat['z'])
        tile_current = self.__fixed_param['route'][route_id[0]][:2]
        #tile_next    = self.__fixed_param['route'][self.__route_id + 1][:2]
        if tile_hat != tile_current:
            route_id[0] = route_id[0] + 1

        tile_inst    = self.__fixed_param['route'][route_id[0]  ][2]
        nx_tile_inst = self.__fixed_param['route'][route_id[0]+1][2] if tile_inst != self.END else self.END

        inst = tile_inst
        #if tile_inst != nx_tile_inst:
        #    if trigger_time < 0:
        #        inst = tile_inst
        #    elif trigger_time < time.time():
        #        inst = tile_inst

        # BEGIN
        if inst == self.BEGIN:
            inst = self.STRAIGHT

        # END
        elif inst == self.END:
            pass

        # STRAIGHT {
        elif inst == self.STRAIGHT:
            if self.is_keepleft:
                utheta = self.__keepleft.keep_left(topview_front_lines)
                # utheta = xhat['th']
            else:
                utheta = xhat['th']
        # }

        # TURN {
        else:
            pass
        # }

        rps_l, rps_r = self.__hard_coded_control(inst)

        if self.is_keepleft:
            udrps_l, udrps_r = self.__utheta2urpslr(utheta)
            rps_l, rps_r = rps_l + udrps_l, rps_r + udrps_r

        if self.is_pid:
            uprps_l = self.__pid_l.pid(rps_l, fbrps_l)
            uprps_r = self.__pid_r.pid(rps_r, fbrps_r)
            rps_l, rps_r = rps_l + uprps_l, rps_r + uprps_r

        acc, ste = self.dutylr2accste(self.__rps2duty(rps_l), self.__rps2duty(rps_r))


        def inst2str(inst):
            if   inst == self.BEGIN:
                return 'BEGIN'
            elif inst == self.END:
                return 'END'
            elif inst == self.STRAIGHT:
                return 'STRAIGHT'
            elif inst == self.TURN_LEFT:
                return 'TURN_LEFT'
            elif inst == self.TURN_RIGHT:
                return 'TURN_RIGHT'

        #print("x:{:>+7,.2f}".format         (xhat['x']              ), end=', ')
        #print("z:{:>+7,.2f}".format         (xhat['z']              ), end=', ')
        #print("th:{:>+7.3f}".format         (np.rad2deg(xhat['th']) ), end=', ')
        #print("[{:^10}]".format             (inst2str(inst)         ), end=', ')
        ##print("[{:^10}]".format             (route_id[0]            ), end=', ')
        #print("acc:{:>+3}".format           (acc                    ), end=', ')
        #print("ste:{:>+3}".format           (ste                    ), end=', ')
        ##print("l:{:>7.3f}({:>+7.3e})".format(fbrps_l, uprps_l       ), end=', ')
        ##print("r:{:>7.3f}({:>+7.3e})".format(fbrps_r, uprps_r       ), end=', ')
        #print("v:{:>7.3f}[mm/sec]".format   (v                      ), end=', ')
        #print("w:{:>+7.3f}[deg/sec]".format (math.degrees(w)        ), end=', ')
        #print()
        return acc, ste
    # }

    # route navigation process {
    def __navi_proc(self, is_pspl_comm, xhat, trigger_time):
        previos_time = time.time()
        while True:
            time.sleep(0.5)
            if is_pspl_comm == 1: pass
            is_pspl_comm = 1
            lsd_front_lines     = self.__pspl_comm.get_front_lsd_lines()
            lsd_rear_lines      = self.__pspl_comm.get_rear_lsd_lines()
            EYE_Y   = self.__fixed_param['camera_y']
            BIRD    = self.__fixed_param['bird']
            CONTEXT = self.__fixed_param['context']
            topview_front_lines = self.__pspl_comm.get_front_topview_lines(EYE_Y, BIRD, CONTEXT)
            topview_rear_lines  = self.__pspl_comm.get_rear_topview_lines(EYE_Y, BIRD, CONTEXT)
            feedback            = self.__pspl_comm.get_motors_speed()
            is_pspl_comm = 0

            elapsed_time = time.time() - previos_time
            previos_time = time.time()

            xhat = self.navi(xhat, trigger_time, lsd_front_lines, lsd_rear_lines, topview_front_lines, topview_rear_lines, feedback, elapsed_time)
    # }

    # route navigation {
    def navi(self, xhat_in, trigger_time, lsd_front_lines, lsd_rear_lines, topview_front_lines, topview_rear_lines, feedback, elapsed_time):
        if self.is_kalman:
            x, z, theta = self.__kalman.kalman_filter(
                    lsd_front_lines, lsd_rear_lines,
                    topview_front_lines, topview_rear_lines,
                    np.array(feedback),
                    elapsed_time
                    ).flatten().tolist()
        else:
            x, z , theta = self.__feedback2odometry(feedback, xhat_in, elapsed_time)

        xhat = {'x': x, 'z': z, 'th': theta}
        return xhat
    # }

    # let's drive {
    def drive(self):
        self.__pspl_comm.begin()
        is_pspl_comm = Manager().Value('i', 0)

        x, z, theta = self.__kalman.get_xhat().flatten().tolist()
        xhat = Manager().dict({
            'x':  x,
            'z':  z,
            'th': theta,
            })

        trigger_time = Manager().Value('f', -1)

        process_ctrl = Process(
                target=self.__control_proc,
                kwargs={
                    'is_pspl_comm'  : is_pspl_comm,
                    'xhat'          : xhat,
                    'trigger_time'  : trigger_time,
                    })

        process_navi = Process(
                target=self.__navi_proc,
                kwargs={
                    'is_pspl_comm'  : is_pspl_comm,
                    'xhat'          : xhat,
                    'trigger_time'  : trigger_time,
                    })

        while self.__pspl_comm.get_sw1() != 1: pass

        print("start driving")

        process_ctrl.start()
        process_navi.start()

        process_ctrl.join()
        process_navi.join()

        self.__pspl_comm.end()
        return
    #}
