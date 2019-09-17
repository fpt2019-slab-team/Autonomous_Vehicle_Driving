#!/usr/bin/python3

import numpy as np
import datetime
from math import sin,cos,pi,asin,acos,sqrt
import copy

from linalg import Linalg

class Animation:
    def __init__(self, eye, theta, odmetries):
        self.stop()
        self.__eye = np.array(eye, dtype=np.float)
        self.__theta = np.array(theta, dtype=np.float)
        self.__odmetries = odmetries
        self.__linalg = Linalg()
        # (accel, handle, time_len)

    def stop(self):
        self.__is_playing = False
        self.__sec_progress = 0
        self.__odmetry_i = 0
        self.__time_before = -1

    def is_playing(self):
        return self.__is_playing

    def play(self):
        self.__time_before = datetime.datetime.now()
        self.__is_playing = True
        #self.__timer(0)

    def pause(self):
        self.__is_playing = False

    def toggle(self):
        if self.is_playing():
            self.pause()
        else:
            self.play()

    def get_sample(self):
        if not self.is_playing():
            return np.copy(self.__eye), np.copy(self.__theta)

        DISTANCE_PER_SEC = 100
        RAD_PER_SEC = pi / 4

        time_now = datetime.datetime.now()
        sec_diff = (time_now - self.__time_before).total_seconds()
        self.__time_before = time_now

        accuracy = 1 / 100.0
        sec_diff = sec_diff if sec_diff < accuracy else accuracy

        self.__sec_progress = self.__sec_progress + sec_diff
        if self.__sec_progress > self.__odmetries[self.__odmetry_i][2]:
            self.__sec_progress = 0
            self.__odmetry_i = self.__odmetry_i + 1
            if self.__odmetry_i >= len(self.__odmetries):
                self.stop()
                return np.copy(self.__eye), np.copy(self.__theta)

        accel, handle, duration = self.__odmetries[self.__odmetry_i]
        # eye, theta = self.__eye, self.__theta

        center = self.__linalg.get_center(self.__eye, self.__theta)

        n = self.__linalg.get_n(self.__eye, center)
        n_xz = self.__linalg.get_normalized(np.array([n[0], 0, n[2]]))
        self.__eye += n_xz * DISTANCE_PER_SEC * sec_diff * accel

        theta_y_diff = RAD_PER_SEC * sec_diff * handle / 128.0
        self.__theta[1] = (self.__theta[1] + theta_y_diff) % (pi * 2)

        #sample = (eye, theta)

        #self.__eye, self.__theta = sample

        return np.copy(self.__eye), np.copy(self.__theta)

    def get_status(self):
        return {
            "is_playing":   copy.copy(self.__is_playing),
            "theta":        copy.copy(self.__theta),
            "eye":          copy.copy(self.__eye),
            "odmetry_i":    copy.copy(self.__odmetry_i),
            "odmetry":      copy.copy(self.__odmetries[self.__odmetry_i]),
            "sec_progress": copy.copy(self.__sec_progress),
        }

