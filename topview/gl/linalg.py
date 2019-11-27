#!/usr/bin/python3

import numpy as np
from math import sin,cos,pi,asin,acos,sqrt

class Linalg:
    def get_R(self, theta):
        R_x = np.array([[          1  ,            0  ,            0  ],
                        [          0  ,  cos(theta[0]), -sin(theta[0])],
                        [          0  ,  sin(theta[0]),  cos(theta[0])]])

        R_y = np.array([[cos(theta[1]),            0  , -sin(theta[1])],
                        [          0  ,            1  ,            0  ],
                        [sin(theta[1]),            0  ,  cos(theta[1])]])

        R_z = np.array([[cos(theta[2]), -sin(theta[2]),            0  ],
                        [sin(theta[2]),  cos(theta[2]),            0  ],
                        [          0  ,              0,            1  ]])

        R = np.dot(R_y, R_x)

        return R

    def get_normalized(self, direction):
        return direction / np.linalg.norm(direction)

    def get_n(self, eye, center):
        return self.get_normalized(center - eye)

    def get_theta(self, eye, center):
        n = self.get_n(eye, center)
        n_xz = self.get_normalized(np.array([n[0], 0, n[2]]))
        theta_y = -sign(n_xz[0]) * acos(n_xz[2])
        # -pi <= theta_y < pi
        theta_x = -sign(n[1]) * acos(np.clip(np.dot(n, n_xz), -1, 1))
        # -pi / 2 <= theta_x < pi / 2
        theta = np.array([theta_x, theta_y , 0])
        #print(theta / pi * 180)
        return theta

    def get_center(self, eye, theta):
        return eye + np.dot(self.get_R(theta), np.array([0, 0, 1]))

    def R3toR4(self, r_in):
        r = r_in
        r = np.hstack((r, np.array([[0], [0], [0]])))
        r = np.vstack((r, np.array([0, 0, 0, 1])))
        return r
