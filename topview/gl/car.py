#!/usr/bin/python3

import numpy as np
import datetime
from math import sin,cos,pi,asin,acos,sqrt
import copy

from linalg import Linalg

class Car:
    def __init__(self, eye, theta):
        self.__LINALG = Linalg()
        self.__ACCURACY = 1 / 30.0
        self.__SCALE = 2
        self.__DISTANCE_PER_SEC = 100 * self.__SCALE
        self.__RAD_PER_SEC = pi / 4 * self.__SCALE

        self.__eye = np.array(eye, dtype=np.float)
        self.__theta = np.array(theta, dtype=np.float)

        self.__odmetry = (0, 0) # (0 <= accel <= 1, -128 <= handle <= 128)
        self.__time_before = datetime.datetime.now()

    def set_odmetry(self, odmetry):
        self.__odmetry = odmetry

    def get_sample(self):
        time_now = datetime.datetime.now()
        sec_diff = (time_now - self.__time_before).total_seconds()
        sec_diff = sec_diff if sec_diff < self.__ACCURACY else self.__ACCURACY
        self.__time_before = time_now

        accel, handle = self.__odmetry

        center = self.__LINALG.get_center(self.__eye, self.__theta)
        n = self.__LINALG.get_n(self.__eye, center)
        n_xz = self.__LINALG.get_normalized(np.array([n[0], 0, n[2]]))
        self.__eye += n_xz * self.__DISTANCE_PER_SEC * sec_diff * accel

        theta_y_diff = self.__RAD_PER_SEC * sec_diff * handle / 128.0
        self.__theta[1] = (self.__theta[1] + theta_y_diff) % (pi * 2)

        return np.copy(self.__eye), np.copy(self.__theta)

    def get_status(self):
        return {
            "theta":        copy.copy(self.__theta),
            "eye":          copy.copy(self.__eye),
            "odmetry":      copy.copy(self.__odmetry),
        }
