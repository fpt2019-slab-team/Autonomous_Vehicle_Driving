#!/usr/bin/python3
# -*- coding: utf-8 -*-

from ctypes import *
import numpy as np

from line import *

class pspl_comm:
    # Init PS/PL communication {
    def __init__(self):
        self.SO_PATH = "./pspl_comm.so"
        # Load C Library(.so) for PS/PL
        self.__so = cdll.LoadLibrary(self.SO_PATH)
        
        # Init PS/PL communication types
        # PS PL Standard {
        self.__so.pspl_init.argtypes = None
        self.__so.pspl_init.restype  = c_int
        self.__so.pspl_fin.argtypes  = None
        self.__so.pspl_fin.restype   = None
        # }
        
        # Test {
        self.__so.sw_read.argtypes = None
        self.__so.sw_read.restype  = c_uint32
        self.__so.led_write.argtypes = [c_int]
        self.__so.led_write.restype  = None
        # }
        
        # LSD to Kalman Filter and Keep Left {
        self.__so.get_lsd_ready.argtypes = [c_int]
        self.__so.get_lsd_ready.restype  = c_uint32
        self.__so.get_lsd_line_num.argtypes = [c_int]
        self.__so.get_lsd_line_num.restype  = c_uint32
        self.__so.get_lsd_line_start_v.argtypes = [c_int, c_uint32]
        self.__so.get_lsd_line_start_v.restype  = c_uint32
        self.__so.get_lsd_line_start_h.argtypes = [c_int, c_uint32]
        self.__so.get_lsd_line_start_h.restype  = c_uint32
        self.__so.get_lsd_line_end_v.argtypes = [c_int, c_uint32]
        self.__so.get_lsd_line_end_v.restype  = c_uint32
        self.__so.get_lsd_line_end_h.argtypes = [c_int, c_uint32]
        self.__so.get_lsd_line_end_h.restype  = c_uint32
        self.__so.send_lsd_write_protect.argtypes = [c_int, c_uint32]
        self.__so.send_lsd_write_protect.restype  = None
        # }
        
        # Motor Controller Feedback to Kalman Filter {
        self.__so.get_topview_ready.argtypes = [c_int]
        self.__so.get_topview_ready.restype  = c_uint32
        self.__so.get_topview_line_num.argtypes = [c_int]
        self.__so.get_topview_line_num.restype  = c_uint32
        self.__so.get_topview_line_start_v.argtypes = [c_int, c_uint32]
        self.__so.get_topview_line_start_v.restype  = c_uint32
        self.__so.get_topview_line_start_h.argtypes = [c_int, c_uint32]
        self.__so.get_topview_line_start_h.restype  = c_uint32 
        self.__so.get_topview_line_end_v.argtypes = [c_int, c_uint32]
        self.__so.get_topview_line_end_v.restype  = c_uint32    
        self.__so.get_topview_line_end_h.argtypes = [c_int, c_uint32]
        self.__so.get_topview_line_end_h.restype  = c_uint32
        self.__so.get_topview_line_valid.argtypes = [c_int, c_uint32]
        self.__so.get_topview_line_valid.restype  = c_uint32
        # }
        
        # Motor Controller Feedback to Kalman Filter {
        self.__so.get_motor_speed.argtypes = [c_int]
        self.__so.get_motor_speed.restype  = c_uint32
        # }
        
        # Keep Left to Motor Controller {
        self.__so.send_kl_accel.argtypes = [c_char]
        self.__so.send_kl_accel.restype  = None
        self.__so.send_kl_steer.argtypes = [c_uint32]
        self.__so.send_kl_steer.restype  = None
        # }
    # }

    # functions to communicate { ###############################################

    # PS PL communicaton begins
    def begin(self):
        self.__so.pspl_init()

    # PS PL communicaton ends
    def end(self):
        self.__so.pspl_fin()

    # } ########################################################################

    # functions to get PL value (PL->PS) { #####################################

    # Get is running
    # OUT: is_run (FPGA switch[1])
    def get_sw1(self):
        return self.__so.sw_read()

    # Get left motor speed
    # OUT: left_motor_speed
    def get_left_motor_speed(self):
        f =  self.__so.get_motor_speed(0)
        return f * (0.33 / 60) * 4 * np.pi if f < 300 else 0

    # Get right motor speed
    # OUT: right_motor_speed
    def get_right_motor_speed(self):
        f =  self.__so.get_motor_speed(1)
        return f * (0.33 / 60) * 4 * np.pi if f < 300 else 0

    # Get motors speed
    # OUT: [right_motor_speed, right_motor_speed]
    def get_motors_speed(self):
        return self.get_left_motor_speed(), self.get_right_motor_speed()

    # Get front lsd lines as ndarray for kalman (plane) 
    # OUT: lsd_line_ndarray shape(N, 4)
    # [ line0[start_v, start_h, end_v, end_h],
    #   line1[...], 
    #   ... ,
    #   lineN[...]
    # ]
    def get_front_lsd_lines(self):
        self.__so.send_lsd_write_protect(0, 1)
        while self.__so.get_lsd_ready(0) != 1: pass
        lines = np.zeros((self.__so.get_lsd_line_num(0), 4))
        for i, line in enumerate(lines):
            line[0] = self.__so.get_lsd_line_start_h(0, i)
            line[1] = self.__so.get_lsd_line_start_v(0, i)
            line[2] = self.__so.get_lsd_line_end_h(0, i)
            line[3] = self.__so.get_lsd_line_end_v(0, i)
        self.__so.send_lsd_write_protect(0, 0)
        return lines

    # Get rear lsd lines as ndarray for kalman (plane) 
    # OUT: lsd_line_ndarray shape(N, 4)
    # [ line0[start_v, start_h, end_v, end_h],
    #   line1[...], 
    #   ... ,
    #   lineN[...]
    # ]
    def get_rear_lsd_lines(self):
        self.__so.send_lsd_write_protect(1, 1)
        while self.__so.get_lsd_ready(1) != 1: pass
        lines = np.zeros((self.__so.get_lsd_line_num(1), 4))
        for i, line in enumerate(lines):
            line[0] = self.__so.get_lsd_line_start_h(1, i)
            line[1] = self.__so.get_lsd_line_start_v(1, i)
            line[2] = self.__so.get_lsd_line_end_h(1, i)
            line[3] = self.__so.get_lsd_line_end_v(1, i)
        self.__so.send_lsd_write_protect(1, 1)
        return lines

    # Get front topview lines as ndarray for kalman (plane) 
    # OUT: topview_line_ndarray shape(N, 4)
    # [ line0[start_v, start_h, end_v, end_h],
    #   line1[...], 
    #   ... ,
    #   lineN[...]
    # ]
    def get_front_topview_lines(self, EYE_Y, BIRD, CONTEXT):
        self.__so.send_lsd_write_protect(0, 1)
        while self.__so.get_lsd_ready(0) != 1: pass
        line_num = self.__so.get_lsd_line_num(0)
        lines = []
        for i in range(line_num):
            uv_line = np.array([
                                self.__so.get_lsd_line_start_h(0, i),
                                self.__so.get_lsd_line_start_v(0, i),
                                self.__so.get_lsd_line_end_h(0, i),
                                self.__so.get_lsd_line_end_v(0, i)
                               ]).reshape(2,2)
            tv = fixed.uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            if not tv is None:
                lines.append([*tv.reshape(4), 1])
        self.__so.send_lsd_write_protect(0, 0)
        return np.array(lines)

    # Get rear topview lines as ndarray for kalman (plane) 
    # OUT: topview_line_ndarray shape(N, 4)
    # [ line0[start_v, start_h, end_v, end_h],
    #   line1[...], 
    #   ... ,
    #   lineN[...]
    # ]
    def get_rear_topview_lines(self, EYE_Y, BIRD, CONTEXT):
        self.__so.send_lsd_write_protect(1, 1)
        while self.__so.get_lsd_ready(1) != 1: pass
        # lines = np.zeros((self.__so.get_lsd_line_num(0), 4))
        line_num = self.__so.get_lsd_line_num(1)
        lines = []
        for i in range(line_num):
            uv_line = np.array([
                                self.__so.get_lsd_line_start_h(1, i),
                                self.__so.get_lsd_line_start_v(1, i),
                                self.__so.get_lsd_line_end_h(1, i),
                                self.__so.get_lsd_line_end_v(1, i)
                               ]).reshape(2,2)
            tv = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            if not tv is None:
                lines.append([*tv.reshape(4), 1])
        self.__so.send_lsd_write_protect(1, 0)
        return np.array(lines)

    # Get front/rear lsd and topview lines as ndarray
    # OUT: lsd_line_ndarray shape (N, 4), (N, 4), (N, 4), (N, 4), (N, 4)
    # [ line0[start_v, start_h, end_v, end_h],
    #   line1[...], 
    #   ... ,
    #   lineN[...]
    # ]
    def get_all_lines(self, EYE_Y, BIRD, CONTEXT, TV_VS):
        self.__so.send_lsd_write_protect(0, 1)
        while self.__so.get_lsd_ready(0) != 1: pass
        tvs_f = []
        tvs_r = []
        tvfs = []

        lsd_lines_f = np.zeros((self.__so.get_lsd_line_num(0), 4))
        for i, uv_line in enumerate(lsd_lines_f):
            uv_line[0] = self.__so.get_lsd_line_start_h(0, i)
            uv_line[1] = self.__so.get_lsd_line_start_v(0, i)
            uv_line[2] = self.__so.get_lsd_line_end_h(0, i)
            uv_line[3] = self.__so.get_lsd_line_end_v(0, i)
            tv         = uv_line2tv_fixed(uv_line.reshape(2,2), EYE_Y, BIRD, CONTEXT)
            tvf        = filter_uv_line(tv, CONTEXT, UV_VS=TV_VS)
            tvs_f.append(tv.flatten())
            if not tvf is None:
                tvfs.append(tvf.flatten())
        tv_lines_f = np.array(tvs_f)
        tvf_lines_f = np.array(tvfs)

        lsd_lines_r = np.zeros((self.__so.get_lsd_line_num(1), 4))
        for i, uv_line in enumerate(lsd_lines_r):
            uv_line[0] = self.__so.get_lsd_line_start_h(1, i)
            uv_line[1] = self.__so.get_lsd_line_start_v(1, i)
            uv_line[2] = self.__so.get_lsd_line_end_h(1, i)
            uv_line[3] = self.__so.get_lsd_line_end_v(1, i)
            tv         = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            tvs_r.append(tv.flatten())
        tv_lines_r = np.array(tvs_r.flatten())

        self.__so.send_lsd_write_protect(0, 0)
        return lsd_lines_f, lsd_lines_f, tv_lines_f, tv_lines_r, tvf_lines_f

    # } ########################################################################

    # functions to set PS value (PS->PL) { #####################################

    # Set accel
    # IN : accel (0 : 127)
    def set_accel(self, accel):
        self.__so.send_kl_accel(accel)

    # Set steer
    # IN : steer (-127 : 127)
    def set_steer(self, steer):
        self.__so.send_kl_steer(steer)

    # Set accel and steer
    # IN : steer (0 : 127, -127 : 127)
    def set_accel_and_steer(self, accel, steer):
        self.__so.send_kl_accel(accel)
        self.__so.send_kl_steer(steer)

    # } ########################################################################
# }

# Utilities { ##################################################################

# Draw lines
# IN : lsd or topview lines
def imwrite_lines(lines):
    import cv2
    res = np.zeros((480, 640, 3), dtype = np.uint8)
    for x in lines.astype(np.uint8):
        res = cv2.line(res, (x[0], x[1]), (x[2], x[3]), (0, 255, 0), 1)
    cv2.imwrite("lsd_view.png", res)
# } ############################################################################
