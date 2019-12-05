#!/usr/bin/python3
# -*- coding: utf-8 -*-


import numpy as np
import time
from line import *

#pynqで消す
import matplotlib.pyplot as plt #draw用
#from PIL import Image

from operator import itemgetter #matching用
import math


###########################################################################
#                                                                         #
#   x_hat   : 事後推定値 (3, 1)                                           #
#   x_hat_m : 事前推定値 (3, 1)                                           #
#   F       : ヤコビ行列 (3, 3)                                           #
#   P       : (事後)共分散行列(feedbackに関する)  (3, 3)                  #
#   P_m     : (事前)共分散行列(feedbackに関する)  (3, 3)                  #
#   Q       : 予測誤差   (3, 3)                                           #
#   G       : カルマンゲイン        (3, *)                                #
#   R_obs   : 観測誤差の共分散行列  (*, *)                                #
#   Delta   : 観測誤差              (*, 1)                                #
#   H       : ヤコビ行列            (*, 3)                                #
#   u       : 制御行列   (2, 1)                                           #
#   I       : 単位行列   (3, 3)                                           #
#   f(x_hat, u) : x_hatの位置姿勢に対して, uを作用させたときの位置姿勢    #
#   .T      : 転置                                                        #
#                                                                         #
#============= prediction step ========================================== #
#                                                                         #
#   x_hat_m = f(x_hat, u)       (A)                                       #
#       P_m = F @ P @ F.T + Q   (B)                                       #
#                                                                         #
#============ observation step ========================================== #
#                                                                         #
#         K = P_m @ H.T (H @ P_m @ H.T + R_obs)^-1   (C)                  #
#     x_hat = x_hat_m - K @ Delta                    (D)                  #
#         P = (I - K @ H) @ P_m                      (E)                  #
#                                                                         #
###########################################################################

class KalmanFilter:
    __x_hat = None
    def __init__(self, kwargs):

        x_hat         = kwargs['x_hat']
        P             = kwargs['P']
        dev           = kwargs['dev']
        REF_LINE      = kwargs['REF_LINE']
        HEIGHT        = kwargs['HEIGHT']
        WIDTH         = kwargs['WIDTH']
        DR            = kwargs['DR']
        Tire_radius   = kwargs['Tire_radius']
        T_camera1     = kwargs['T_camera1']
        T_camera2     = kwargs['T_camera2']
        R_camera1_rad = kwargs['R_camera1_rad']
        R_camera2_rad = kwargs['R_camera2_rad']
        Rslope        = kwargs['Rslope']
        Thre_len      = kwargs['Thre_len']
        Thre_rad      = kwargs['Thre_rad']
        THRE          = kwargs['THRE']
        c1            = kwargs['c1']
        c2            = kwargs['c2']
        BIRD          = kwargs['BIRD']
        MAP_SIZE      = kwargs['MAP_SIZE']
        CONTEXT       = kwargs['CONTEXT']



        # x_hat         : 前時刻の事後推定値  (3, 1)    [[x(mm)], [z(mm)], [yaw(rad)]] x...0-MAP_WIDTH  z...0-MAP_HEIGHT
        # P             : 共分散行列          (3, 3)
        # dev           : 誤差を示す標準偏差 (1, 5)    [v, omega, x, z, yaw]
        # REF_LINE      : MAP line data
        # HEIGHT        : image height
        # WIDTH         : image width
        # DR            : 車輪間距離 [mm]
        # Tire_radius   : タイヤ半径 [mm]

        # T_camera1     : front camera 位置 (3, 1)      [[x], [y], [z]]  (mm)
        # T_camera2     : rear  camera 位置 (3, 1)      [[x], [y], [z]]  (mm)
        '''    2つ後輪の中間地点を原点とした位置
                 x...左向き正
                 y...上向き正 地面からの高さ
                 z...前向き正                   '''

        # R_camera1_rad : front camera 向き (1, 3)  [[x_rad], [y_rad], [z_rad]] (rad)
        # R_camera2_rad : rear  camera 向き (1, 3)  [[x_rad], [y_rad], [z_rad]] (rad)
        '''    車両前方 ........ 0度
               車両左方向 ......90度   '''

        # Rslope        : ROLL/PITCH 回転   (3, 3)単位行列  [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
        # Thre_len      : matchingしきい値
        # Thre_rad      : matchingしきい値
        # THRE          : 端点間の距離のしきい値
        # c1            : cameraの中心から離れるほど誤差が大きくなるように調整するパラメータ
        # c2            : cameraの中心から離れるほど誤差が大きくなるように調整するパラメータ
        # BIRD          : 鳥瞰変換位置 (3, 1)
        # MAP_SIZE      : マップのサイズ (MAP_WIDTH(x), MAP_HEIGHT(z))
        # CONTEXT       : {F, WIDTH, HEIGHT, SCALE}


        # MAP_SIZE
        self.__MAP_HEIGHT = max(MAP_SIZE)
        self.__MAP_WIDTH  = min(MAP_SIZE)
        self.__MAP_SIZE   = MAP_SIZE

        # CONTEXT
        self.__CONTEXT    = CONTEXT

        self.__x_hat = x_hat
        self.__P = P

        # map line data
        self.__WM_LINES = REF_LINE

        #---------- 定数定義 ----------
        # camera 画面サイズ
        self.__HEIGHT = HEIGHT
        self.__WIDTH  = WIDTH

        self.__DR = DR      # 車輪間距離
        self.__Tire_radius = Tire_radius
        self.__camera_Height = T_camera1[1,0] # カメラの高さ


        # カメラの位置, 姿勢
        #self.__T_camera1 = np.array([[T_camera1[0,0]],
        #                             [T_camera1[1,0]],
        #                             [T_camera1[2,0]]])
        #self.__T_camera2 = np.array([[T_camera2[0,0]],
        #                             [T_camera2[1,0]],
        #                             [T_camera2[2,0]]])
        self.__T_camera1 = np.array([[0],
                                     [100],
                                     [0]])
        self.__T_camera2 = np.array([[0],
                                     [100],
                                     [0]])
        self.__R_camera1 = theta2r(np.array([R_camera1_rad[0], R_camera1_rad[1], R_camera1_rad[2]]))
        self.__R_camera2 = theta2r(np.array([R_camera2_rad[0], R_camera2_rad[1], R_camera2_rad[2]]))

        # Roll/Pitch 回転無し
        self.__Rslope = Rslope

        # matching 閾値
        self.__Thre_len = Thre_len
        self.__Thre_rad = Thre_rad

        #param
        self.__THRE = THRE
        self.__c1 = c1
        self.__c2 = c2

        #ずれ 標準偏差
        self.__dev_v     = dev[0]
        self.__dev_omega = dev[1]
        self.__dev_x     = dev[2]
        self.__dev_z     = dev[3]
        self.__dev_yaw   = dev[4]

        # 鳥瞰変換位置
        self.__BIRD = BIRD

        self.__observation_error = []
        self.__r_up   = []
        self.__r_mid  = []
        self.__r_down = []
        self.__H_comp = []


        
        self.__ratio = 2*self.__BIRD[1]*np.sqrt(1-cos(np.deg2rad(17.5))*cos(np.deg2rad(17.5))) / cos(np.deg2rad(17.5)) / self.__WIDTH
        print(self.__ratio)
        
        #sim用
        self.__step = 0
        #---------- 定数定義 ここまで ----------

    ############### 制御行列系 ###############
    def __wheel_velocities2control_mat(self, v_r, v_l):
        ''' 左右の車輪速度から制御行列を求める
        引数：
            v_r  : 右後輪車速 (float, [pixel/sec])
            v_l  : 左後輪車速 (float, [pixel/sec])
        返値：
            control_mat  : 制御行列  (2, 1)
        '''
        v     = (v_r + v_l) / 2               # 車両速度
        omega = (v_r - v_l) / (2 * self.__DR) # 車両角速度
        control_mat = np.array([[  v  ],
                                [omega]])
        return control_mat
    ###########################################

    ############### 誤差系 ###############
    def __get_prediction_error_mat(self, control_mat, delta_d, DT_s):
        '''
        予測誤差をあらわす行列を求める
        引数：
        　　control_mat : 制御行列   (2, 1)
            delta_d     : 一時刻前との走行距離の差分 [pixel]
        返値：
            Q           : 予測誤差   (3, 3)
        '''
        # Q_u : 制御量に対応した誤差を表現する対角行列 (2*2)
        Q_u = np.diag([self.__dev_v, self.__dev_omega]) ** 2

        # Q_c : モデルに従わない小さな誤差を表現する対角行列 (3*3)
        Q_c = np.diag([self.__dev_x, self.__dev_z, np.deg2rad(self.__dev_yaw)]) ** 2

        # Q : 予測誤差を表す (3*3)
        Q = (self.__jacobFU(control_mat, DT_s) @ Q_u @ self.__jacobFU(control_mat, DT_s).T) * delta_d + Q_c * DT_s
        return Q

    #------------4.7自己位置の誤差モデル------------------------
    def __delta_p(self, A, Rv2m, Tv2m, q):
        '''画像線分の端点qの射影誤差δを計算
            引数：
                 A   ：直線の方程式の係数  (1, 4)
               　Rv2m：vehicle座標系->world座標系 回転    (3, 3)
             　　Tv2m：vehicle座標系->world座標系 並進    (3, 1)
            　 　q   ：車両座標系における線分の端点の座標 (3, 1)
            返値：
                 dp  ：射影誤差
        '''
        tmp = (self.__Rslope @ Rv2m @ q) + Tv2m
        tmp2 = np.hstack((tmp.T.reshape(3), np.array([1.0])))
        dp = A.T @ tmp2.T
        dp = A.T @ tmp2.T * self.__ratio
        return dp

    def __delta_q(self, b, Rv2m, Tv2m, q):
        '''画像線分の端点qの射影誤差δを計算(端点間の距離がしきい値以下)
            引数：
                b   ：ms,meどちらかの端点の座標 (m...地図座標系における端点の座標)  (2, 1)
            　　Rv2m：vehicle座標系->world座標系 回転     (3, 3)
            　　Tv2m：vehicle座標系->world座標系 並進     (3, 1)
            　　q   ：車両座標系における線分の端点の座標  (3, 1)
            返値：
                dq  ：射影誤差(端点間の距離がしきい値以下)
        '''
        b = np.array([[b[0]],
                      [  0 ],
                      [b[1]]])

        # 論文の間違いっぽい
        # X = np.array([[1.0, 0.0, 0.0],
        #               [0.0, 1.0, 0.0]])
        X = np.array([[1.0, 0.0, 0.0],
                      [0.0, 0.0, 1.0]])
        Y = q - Rv2m.T @ self.__Rslope.T @ (b - Tv2m)

        dq = X @ Y

        if abs(dq[0,0]) < 1e-10:
            dq[0] = 0
        if abs(dq[1,0]) < 1e-10:
            dq[1] = 0
            
        return dq


    def __R_q(self, n, jB, l):
        '''観測誤差計算(鳥瞰変換の誤差モデル 共分散行列)
        引数：
        　 　n ：画像上での端点の座標
             jB：ヤコビ行列 rounded_b/rounded_n
             l ：画像上での線分の長さ
        返値：
             Rq：観測誤差(鳥瞰変換の誤差モデル 共分散行列)
        '''
        n_u = n[0,0]
        n_v = n[1,0]

        # 端点の誤差の共分散行列
        if l < 0.1:
            Rl = np.diag([0, 0])
        else:
            Rl = np.diag([(self.__c1*n_u**2 + self.__c2)**2, (self.__c1*n_v**2 + self.__c2)**2]) / l

        #print(Rl)
            
        Rq = jB @ Rl @ jB.T
        return Rq


    def __R_p(self, A, Rq):
        '''観測誤差計算
        引数：
             A：直線の方程式の係数
        　　Rq：鳥瞰変換の誤差モデル 共分散行列
        返値：
            Rp：観測誤差
        '''
        ax = A[0]
        az = A[2]
        X = np.array([ax, az])
        Rp = X @ Rq @ X.T

        return Rp
    #------------4.7ここまで------------------------

    #------------4.8自己位置に対する観測誤差と線形化------------------------
    def __jacob_Hp(self, A, Rv2m ,q):
        '''ヤコビ行列Hp計算
        引数：
             A：直線の方程式の係数
        Rslope：Roll/Pitch回転
        　Rv2m：vehicle座標系->world座標系 回転
         　　q：車両座標系における線分の端点の座標
        返値：
            Hp：ヤコビ行列
        '''
        tmp = np.array([[ 0, 0, 1],
                        [ 0, 0, 0],
                        [-1, 0, 0]])
        l = self.__Rslope @ tmp @ Rv2m @ q

        ax = A[0]
        az = A[2]
        Hp = np.array([ax, az, float(ax*l[0] + az*l[2])])
        return Hp


    def __jacob_Hq(self, x_hat_m, b):
        '''ヤコビ行列Hq計算
        引数：
        x_hat_m：事前状態予測値
         Rslope：Roll/Pitch回転
              b：ms,meどちらかの端点の座標 (m...地図座標系における端点の座標)
        返値：
             Hq：ヤコビ行列
        '''
        x     = x_hat_m[0,0]
        z     = x_hat_m[1,0]
        theta = x_hat_m[2,0]

        bx = b[0]
        bz = b[1]

        R11 = self.__Rslope[0,0]
        R13 = self.__Rslope[0,2]
        R31 = self.__Rslope[2,0]
        R33 = self.__Rslope[2,2]

        a = R11*np.cos(theta) - R13*np.sin(theta)
        b = R11*np.sin(theta) + R13*np.cos(theta)
        c = R31*np.cos(theta) - R33*np.sin(theta)
        d = R31*np.sin(theta) + R33*np.cos(theta)
        e =  np.sin(theta) * (R11*(bx-x) + R31*(bz-z)) + np.cos(theta) * (R13*(bx-x) + R33*(bz-z))
        f = -np.cos(theta) * (R11*(bx-x) + R31*(bz-z)) + np.sin(theta) * (R13*(bx-x) + R33*(bz-z))

        Hq = np.array([[a,c,e],
                       [b,d,f]])
        return Hq
    #------------4.8ここまで-----------------------
    ############### 誤差系 ここまで ###############

    def __predict_position_from_feedback(self, u, DT_s):
        '''状態x(k)算出
        状態方程式：x(k) = f(x(k-1),u(k-1))
        引数：
        　  # x_hat ：前時刻の事後推定値　状態x(k-1)
        　  u     ：制御行列
        返値：
        　x_hat_m ：現時刻の事前推定値　状態x(k)
        '''
        yaw   = self.__x_hat[2, 0]
        v     = u[0,0]  # 車両速度
        omega = u[1,0]  # 車両角速度

        x_hat_m = self.__x_hat + np.array([[v*DT_s*np.sinc(omega*DT_s/2)*np.sin(yaw + omega*DT_s/2)],
                                           [v*DT_s*np.sinc(omega*DT_s/2)*np.cos(yaw + omega*DT_s/2)],
                                           [omega*DT_s]])
        if x_hat_m[2] > 2*np.pi:
            x_hat_m = x_hat_m + np.array([[0],
                                          [0],
                                          [-2*np.pi]])
        if x_hat_m[2] < 0:
            x_hat_m = x_hat_m + np.array([[0],
                                          [0],
                                          [2*np.pi]])
        return x_hat_m


    def __calc_kalman_gain(self, P_m, R, H):
        '''カルマンゲイン算出
        引数：
            P_m : 事前誤差共分散行列Pm(k)
            R   : 観測雑音の共分散行列
            H   : ヤコビ行列 rounded_delta(k) / rounded_x(k)
        返値：
            G   : カルマンゲインG(k)
        '''
        S = (H @ P_m @ H.T) + R

        # 逆行列が存在しない場合があるから とりあえず擬似逆行列に.......
        G = (P_m @ H.T) @ np.linalg.pinv(S)
        #G = (P_m @ H.T) @ np.linalg.inv(S)
        return G


    def __correct_position(self, x_hat_m, G, Delta):
        # 観測誤差 と カルマンゲインにより 予測を修正

        # (プラス の可能性あり)
        self.__x_hat = x_hat_m - (G @ Delta)
        return self.__x_hat


    def __jacobF(self, u, DT_s):
        '''運動に関するヤコビ行列(1) rounded_f/rounded_x(k-1)
        引数：
             u：制御行列
        返値：
            jF：ヤコビ行列jF(k)
        '''
        yaw   = self.__x_hat[2, 0]
        v     = u[0,0]
        omega = u[1,0]

        if abs(omega) < 1e-10:
            a =  DT_s * v * np.cos(yaw)
            b = -DT_s * v * np.sin(yaw)
        else :
            a = (v / omega) * (-np.sin(yaw) + np.sin(yaw + omega*DT_s))
            b = (v / omega) * (-np.cos(yaw) + np.cos(yaw + omega*DT_s))

        jF = np.array([[1.0, 0.0, a  ],
                       [0.0, 1.0, b  ],
                       [0.0, 0.0, 1.0]])
        return jF


    def __jacobFU(self, u, DT_s):
        '''運動に関するヤコビ行列(2) rounded_f/rounded_u(k)
        引数：
      　  u   ：制御行列
        返値：
        　jFU ：ヤコビ行列
        '''
        yaw   = self.__x_hat[2, 0]
        v     = u[0,0]
        omega = u[1,0]

        if abs(omega) < 1e-10:
            a = DT_s*np.sin(yaw)
            b = (v*(DT_s**2)*np.cos(yaw))/2
            c = DT_s*np.cos(yaw)
            d = (-v*(DT_s**2)*np.sin(yaw))/2
        else:
            a = np.cos(yaw)/omega - np.cos(yaw + omega*DT_s)/omega
            b = -v*np.cos(yaw)/(omega**2) + v*np.cos(yaw + omega*DT_s)/(omega**2) + v*DT_s*np.sin(yaw + omega*DT_s)/omega
            c = -np.sin(yaw)/omega + np.sin(yaw + omega*DT_s)/omega
            d = v*np.sin(yaw)/(omega**2) - v*np.sin(yaw + omega*DT_s)/(omega**2) + v*DT_s*np.cos(yaw + omega*DT_s)/omega

        jFU = np.array([[   a ,    b],
                        [   c ,    d],
                        [ 0.0 , DT_s]])

        return jFU


    def __jacobB(self, n):
        '''Rqの計算に必要なヤコビ行列 rounded_b/rounded_n の計算
        引数：
        　　 n：画像上での端点の座標
        返値：
            jB：ヤコビ行列 rounded_b/rounded_n
        '''
        n_u = n[0,0]
        n_v = n[1,0]
        jB = np.array([[self.__camera_Height/n_v, -self.__camera_Height*n_u/(n_v**2)],
                       [                      0 , -self.__camera_Height    /(n_v**2)]])
        return jB


    def __calc_coefficient(self, ms, me):
        #  mapの2点から直線の方程式を求める
        # AA*x + BB*y + CC = 0
        # sqrt(AA^2 + BB^2) = 1 になるよう正規化
        # AA'*x + BB'*y + CC' = 0
        # 返値  A = [AA', 0.0, BB', CC']
        AA = me[1]-ms[1]
        BB = ms[0]-me[0]
        CC = (ms[1]-me[1])*ms[0] + (me[0]-ms[0])*ms[1]
        root = np.sqrt(AA**2 + BB**2)

        if abs(root) < 1e-10:
            A = np.array([0.0, 0.0, 0.0, 0.0])
        else:
            A = np.array([float(AA/root), 0.0, float(BB/root), float(CC/root)])
        return A


    def __get_observation_error(self, distance, m, q, Rv2m, Tv2m, A, i):
        # 観測誤差取得
        if distance < self.__THRE:
            dq = self.__delta_q(m, Rv2m, Tv2m, q)
            if i == 0:
                self.__observation_error = dq
            else:
                self.__observation_error = np.vstack((self.__observation_error, dq))
            #print(dq)
        else :
            dp = self.__delta_p(A, Rv2m, Tv2m, q)
            if i == 0:
                self.__observation_error = dp
            else:
                self.__observation_error = np.vstack((self.__observation_error, dp))
            #print(dp)
        return self.__observation_error


    def __get_Robs(self, distance, n, line_len, A, i):
        # 観測誤差の共分散行列の要素取得
        rq = self.__R_q(n, self.__jacobB(n), line_len)

        if distance < self.__THRE:
            if i == 0:
                self.__r_up   = np.array([float(rq[0,1]), 0.0])
                self.__r_mid  = np.array([rq[0,0], rq[1,1]])
                self.__r_down = np.array([float(rq[1,0]), 0.0])
            else:
                self.__r_up   = np.hstack((self.__r_up,   [float(rq[0,1])], [0.0]))
                self.__r_mid  = np.hstack((self.__r_mid,  [rq[0,0], rq[1,1]]))
                self.__r_down = np.hstack((self.__r_down, [float(rq[1,0])], [0.0]))
        else:
            rp = self.__R_p(A, rq)
            if i == 0:
                self.__r_up   = np.array([0.0])
                self.__r_mid  = np.array([float(rp)])
                self.__r_down = np.array([0.0])
            else:
                self.__r_up   = np.hstack((self.__r_up,   [0.0]))
                self.__r_mid  = np.hstack((self.__r_mid,  [float(rp)]))
                self.__r_down = np.hstack((self.__r_down, [0.0]))
        return self.__r_up, self.__r_mid, self.__r_down


    def __get_H(self, distance, x_hat_m, m, q, Rv2m, Tv2m, A, i):
        # ヤコビ行列取得
        if distance < self.__THRE:
            Hq = self.__jacob_Hq(x_hat_m, m)
            if i == 0:
                self.__H_comp = np.array(Hq)
            else:
                self.__H_comp = np.vstack((self.__H_comp, Hq))
        else:
            Hp = self.__jacob_Hp(A, Rv2m ,q)
            if i == 0:
                self.__H_comp = np.array(Hp)
            else:
                self.__H_comp = np.vstack((self.__H_comp, Hp))

        return self.__H_comp


    def __combine_R(self, Robs_up, Robs_mid, Robs_down):
        # 観測誤差の共分散行列取得
        Robs_up   = np.diag(np.delete(Robs_up, -1), k=1)
        Robs_mid  = np.diag(Robs_mid)
        Robs_down = np.diag(np.delete(Robs_down, -1), k=-1)
        Robs = Robs_up + Robs_mid + Robs_down

        #return Robs_mid
        return Robs


    def __calc_line_length(self, coordinate1, coordinate2):
        length = np.sqrt((coordinate1[0]-coordinate2[0])**2 + (coordinate1[1]-coordinate2[1])**2)
        return length


    def __distance_between_endpoints(self, point2D, point3D):
        distance = np.sqrt((point2D[0]-point3D[0])**2 + (point2D[1]-point3D[2])**2)
        return distance


    def __get_lines_from_position(self, x_hat_m):
        # x_hat_m の位置で見える線分情報を取得

        eye = np.array([x_hat_m[0][0], 100, x_hat_m[1][0]])
        theta = np.array([0, x_hat_m[2][0], 0])

        r = theta2r(theta)

        lines = wm_lines2uv_lines(self.__WM_LINES, eye, r, self.__CONTEXT)
        return lines.reshape((len(lines),4))


    def __matched_lines2obs_error(self, matched_obs, matched_pred, matched_vehicle, Rv2m, Tv2m):
        matched_obs_length = len(matched_obs)
        for i in range(matched_obs_length):
            # ２端点のリスト -> それぞれの点に分ける
            obs_vb_3Dpoint1, obs_vb_3Dpoint2 = self.__get_XYZ_coordinates(matched_vehicle[i])
            obs_mb_3Dpoint1, obs_mb_3Dpoint2 = self.__get_XYZ_coordinates(matched_obs[i])
            pred_mb_point1 = np.array([matched_pred[i,0],matched_pred[i,1]])
            pred_mb_point2 = np.array([matched_pred[i,2],matched_pred[i,3]])

            # A : 直線の方程式にしたときの係数
            A = self.__calc_coefficient(pred_mb_point1, pred_mb_point2)

            dist_s = self.__distance_between_endpoints(pred_mb_point1, obs_mb_3Dpoint1)
            dist_e = self.__distance_between_endpoints(pred_mb_point2, obs_mb_3Dpoint2)

            #print(dist_s, dist_e)
            
            # check どちらかの端点をbとおく
            obs_error = self.__get_observation_error(dist_s, pred_mb_point1, obs_vb_3Dpoint1, Rv2m, Tv2m, A, i)
            obs_error = self.__get_observation_error(dist_e, pred_mb_point2, obs_vb_3Dpoint2, Rv2m, Tv2m, A, 1)

        return obs_error


    def __matched_lines2Robs(self, matched_obs, matched_pred, matched_cam):
        matched_obs_length = len(matched_obs)
        for i in range(matched_obs_length):
            # ２端点のリスト -> それぞれの点に分ける
            obs_mb_3Dpoint1, obs_mb_3Dpoint2 = self.__get_XYZ_coordinates(matched_obs[i])
            pred_mb_point1 = np.array([matched_pred[i,0],matched_pred[i,1]])
            pred_mb_point2 = np.array([matched_pred[i,2],matched_pred[i,3]])
            obs_c_point1, obs_c_point2 = self.__get_XZ_coordinates(matched_cam[i])

            cam_line_len = self.__calc_line_length(obs_c_point1, obs_c_point2)
            #print(cam_line_len)
            
            # A : 直線の方程式にしたときの係数
            A = self.__calc_coefficient(pred_mb_point1, pred_mb_point2)

            dist_s = self.__distance_between_endpoints(pred_mb_point1, obs_mb_3Dpoint1)
            dist_e = self.__distance_between_endpoints(pred_mb_point2, obs_mb_3Dpoint2)

            Robs_up, Robs_mid, Robs_down = self.__get_Robs(dist_s, obs_c_point1, cam_line_len, A, i)
            Robs_up, Robs_mid, Robs_down = self.__get_Robs(dist_e, obs_c_point2, cam_line_len, A, 1)

        return  Robs_up, Robs_mid, Robs_down


    def __matched_lines2H(self, matched_obs, matched_pred, matched_vehicle, Rv2m, Tv2m, x_hat_m):
        matched_obs_length = len(matched_obs)
        for i in range(matched_obs_length):
            # ２端点のリスト -> それぞれの点に分ける
            obs_vb_3Dpoint1, obs_vb_3Dpoint2 = self.__get_XYZ_coordinates(matched_vehicle[i])
            obs_mb_3Dpoint1, obs_mb_3Dpoint2 = self.__get_XYZ_coordinates(matched_obs[i])
            pred_mb_point1 = np.array([matched_pred[i,0],matched_pred[i,1]])
            pred_mb_point2 = np.array([matched_pred[i,2],matched_pred[i,3]])

            # A : 直線の方程式にしたときの係数
            A = self.__calc_coefficient(pred_mb_point1, pred_mb_point2)

            dist_s = self.__distance_between_endpoints(pred_mb_point1, obs_mb_3Dpoint1)
            dist_e = self.__distance_between_endpoints(pred_mb_point2, obs_mb_3Dpoint2)

            H = self.__get_H(dist_s, x_hat_m, pred_mb_point1, obs_vb_3Dpoint1, Rv2m, Tv2m, A, i)
            H = self.__get_H(dist_e, x_hat_m, pred_mb_point2, obs_vb_3Dpoint2, Rv2m, Tv2m, A, 1)

        return H

    #---------- 関数定義(座標・座標変換系) ----------
    def __get_XZ_coordinates(self, point_list):
        # 2点(始点/終点)を
        # 始点, 終点に分ける　(2次元座標)
        point1 = np.array([[point_list[0]],
                           [point_list[1]]])
        point2 = np.array([[point_list[2]],
                           [point_list[3]]])
        return point1, point2


    def __get_XYZ_coordinates(self, point_list):
        # 2点(始点/終点)を
        # 始点, 終点に分ける　(3次元座標)
        point1 = np.array([[point_list[0]],
                           [0.0],
                           [point_list[1]]])
        point2 = np.array([[point_list[2]],
                           [0.0],
                           [point_list[3]]])
        return point1, point2


    def __get_Rv2m(self, x):
        '''車両座標系から地図座標系へ 回転行列
        引数：
             x：状態
        返値：
          rv2m：回転行列
        '''
        yaw  = np.array([0, x[2][0], 0])
        Ryaw = theta2r(yaw)
        rv2m = self.__Rslope @ Ryaw

        return rv2m


    def __get_Tv2m(self, x_hat_m):
        Tv2m = np.array([[float(x_hat_m[0])],
                         [0],
                         [float(x_hat_m[1])]])
        return Tv2m


    def __convert_rear_position(self, front_position):
        # front camera の姿勢 から rear camera の姿勢を求める
        # y軸回転 180度 するだけ

        yaw = float(front_position[2])
        yaw += np.pi

        if yaw >= 2*np.pi:
            yaw -= 2*np.pi
        if yaw < 0:
            yaw += 2*np.pi

        rear_position = np.array([[float(front_position[0])],
                                  [float(front_position[1])],
                                  [yaw]])
        return rear_position


    def __LSD_uv2camera_uv(self, LSD_lines):
        camera_uv_lines = []
        for LSD_line in LSD_lines:
            camera_uv_line = [
                -(LSD_line[0] - self.__WIDTH /2),
                -(LSD_line[1] - self.__HEIGHT/2),
                -(LSD_line[2] - self.__WIDTH /2),
                -(LSD_line[3] - self.__HEIGHT/2)
            ]
            camera_uv_lines.append(camera_uv_line)
        camera_uv_lines = np.array(camera_uv_lines)
        return camera_uv_lines


    
    def __tv_uv2vehicle_xz(self, tv_lines, valid):

        vehicle_xz_lines = []
        length = len(tv_lines)
        for i in range(length):
            if valid[i] == False:
                vehicle_xz_line = tv_lines[i]
            else:
                vehicle_xz_line = [
                    -(tv_lines[i][0] - self.__WIDTH/2),
                    -(tv_lines[i][1] - (self.__HEIGHT/2 + self.__BIRD[2])),
                    -(tv_lines[i][2] - self.__WIDTH/2),
                    -(tv_lines[i][3] - (self.__HEIGHT/2 + self.__BIRD[2]))
                ]
            vehicle_xz_lines.append(vehicle_xz_line)
        vehicle_xz_lines = np.array(vehicle_xz_lines)
        return vehicle_xz_lines


    def __vehicle_xz2map_xz(self, vehicle_lines, T, x, valid):
        yaw = x[2,0]
        Ryaw = np.array([[float(np.cos(yaw)), 0, float(np.sin(yaw))],
                         [0, 1, 0],
                         [-float(np.sin(yaw)), 0, float(np.cos(yaw))]])

        map_xz_lines = []
        length = len(vehicle_lines)
        for i in range(length):            
            if valid[i] == False:
                map_xz_line = vehicle_lines[i]
            else:
                p1 = np.array([[vehicle_lines[i][0]],
                               [                 0 ],
                               [vehicle_lines[i][1]]])
                pt1 = Ryaw @ p1
                pt1 = pt1 + T
                p2 = np.array([[vehicle_lines[i][2]],
                               [                 0 ],
                               [vehicle_lines[i][3]]])
                pt2 = Ryaw @ p2
                pt2 = pt2 + T
                map_xz_line = np.array([pt1[0][0], pt1[2][0], pt2[0][0], pt2[2][0]])
            map_xz_lines.append(map_xz_line)
        map_xz_lines = np.array(map_xz_lines)
        return map_xz_lines
                
    #---------- 関数定義(座標変換系) ここまで ----------

    #---------- 関数定義(線分取得) ----------
    def __get_ib_lines_egw_sim(self, lines, x_hat_m):
        eye = np.array([float(x_hat_m[0]), 100, float(x_hat_m[1])])
        theta = np.array([0, (np.rad2deg(x_hat_m[2])), 0]) / 180 * np.pi
        r = theta2r(theta)

        lines = lines.reshape((len(lines),2,2))
        lines = bird_view(lines, eye, r, self.__BIRD, self.__CONTEXT)
        return lines.reshape((len(lines),4))


    # def __get_ib_lines_egw_sim_no_filter(self, lines, x_hat_m):
    #     eye = np.array([float(x_hat_m[0]), 100, float(x_hat_m[1])])
    #     theta = np.array([0, (np.rad2deg(x_hat_m[2])), 0]) / 180 * np.pi
    #     r = theta2r(theta)

    #     lines = lines.reshape((len(lines),2,2))
    #     lines = bird_view_no_filter(lines, eye, r, self.__BIRD, self.__CONTEXT)
    #     return lines.reshape((len(lines),4))
    #---------- 関数定義(線分取得) ここまで ----------

    #---------- 関数定義(線分マッチング)  ----------
    def __distance(self, px, py, x1, y1, x2, y2, mode):
        '''
        点と線分の距離を求める
        px,py : 点
        x1,y1 : 端点１
        x2.y2 : 端点２
        mode  : x1,y1が終点...0 otherwise...1
        '''
        a = x2 - x1
        b = y2 - y1
        a2 = a * a
        b2 = b * b
        r2 = a2 + b2
        tt = -(a * (x1 - px) + b * (y1 - py))
        # if tt < 0: # 端点１と点の距離
        #     return (x1 - px) * (x1 - px) + (y1 - py) * (y1 - py)
        # if tt > r2: # 端点２と点の距離
        #     return (x2 - px) * (x2 - px) + (y2 - py) * (y2 - py)

        if tt < 0 or tt > r2: # 対応する端点との距離
            if mode == 0:
                return (x1 - px) * (x1 - px) + (y1 - py) * (y1 - py)
            else:
                return (x2 - px) * (x2 - px) + (y2 - py) * (y2 - py)
        else: # 線分に下ろした垂線の長さ
            f1 = a * (y1 - py) - b * (x1 - px)
            return f1 * f1 / r2


    #def __matching(self, p, q, r, s, mode):
    def __matching(self, p, q, r, s, valid, mode):
        ### mode == 0
        # p : maplines  (*, 4)
        # q : obslines  (*, 5)
        ### mode == 1
        # p : obslines  (*, 5)
        # q : maplines  (*, 4)

        # r : camlines      (*, 4)
        # s : vehiclelines  (*, 5)
        theta_p = 0
        theta_q = 0

        listtemp = [[0,0,0,0,0,0]]

        px1 = p[0]
        py1 = p[1]
        px2 = p[2]
        py2 = p[3]

        # pの直線の方程式
        # ax + by + c = 0
        a = py2-py1
        b = px1-px2
        # c = (py1-py2)*px1 + (px2-px1)*py1
        if -1.0e-3 < b and b < 1.0e-3:
            theta_p = np.pi/2.0 #90度
        else:
            m1 = -a/b # 傾き

        #print(len(p), len(q), len(r), len(s))
            
        # qの全ての点について
        # pに対応しそうな点を探す
        q_length = len(q)
        for j in range(q_length):
            # if mode == 0 and q[j,4] == 0: #invalid  変な値のとき
            #     continue
            if valid[j] == False:
                continue
            
            qqq = q[j]
            qx1 = qqq[0]
            qy1 = qqq[1]
            qx2 = qqq[2]
            qy2 = qqq[3]

            
            # 点と線分の距離
            # (基本は点と直線の距離.  直線に対して垂線が引けなければ対応する端点との距離)
            dist1 = self.__distance(qx1,qy1,px1,py1,px2,py2, 0)
            if dist1 > self.__Thre_len:
                continue
            dist2 = self.__distance(qx2,qy2,px1,py1,px2,py2, 1)
            if dist2 > self.__Thre_len:
                continue


            # qの直線  傾き計算
            a2 = qy2-qy1
            b2 = qx1-qx2
            if -1.0e-3 <b2 and b2 < 1.0e-3:
                theta_q = np.pi/2.0
            else:
                m2 = -a2/b2

            # 二直線のなす角  p基準
            if theta_p == np.pi/2.0 and theta_q == np.pi/2.0: #どちらも90度 -> なす角0度
                theta = 0
            elif theta_p == np.pi/2.0: #pだけ90度
                if m2 >= 0: #m2は正 -> なす角は90度-atan(m2)
                    theta = (math.atan(m2)) - theta_p
                else: #m2は負 ->
                    theta = (math.atan(m2)) + theta_p # +theta_p = -(-theta_p)
            elif theta_q == np.pi/2.0:
                if m1 >= 0:
                    theta = theta_q - (math.atan(m1))
                else:
                    theta = -theta_q - (math.atan(m1))
            else:
                if m1 * m2 == -1: #直交
                    theta = np.pi/2.0
                else:
                    theta = math.atan((m2-m1)/(1+m2*m1))

            if abs(theta) > self.__Thre_rad:
                continue

            distdist = dist1 + dist2

            # 候補を保存
            # x1, y1, x2, y2, 距離, index
            listtemp = np.vstack((listtemp, [qx1, qy1, qx2, qy2, distdist, j]))

        if len(listtemp) != 1:   # 候補が存在すれば
            listtemp = sorted(listtemp, key=itemgetter(4))

            # 一番近いやつを選択
            temp = listtemp[1]

            # matchingしたobslineと同じindexのvehicleline camlineも返す
            if(mode == 1):
                temp_r = r
                temp_s = s
            else:
                temp_r = r[int(temp[5])]
                temp_s = s[int(temp[5])]

            return p[0:4], temp[0:4], temp_r[0:4], temp_s[0:4]
        else:
            return [0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]


    def __match_lines(self, maplines, obslines, camlines, vehiclelines, pred_valid, obs_valid):
        ### maplines と obslines のマッチング
        # camlines と vehiclelines も 同じ順番になるよう並び替え

        aaa = maplines     #(*, 4) map
        bbb = obslines     #(*, 5) obs
        ccc = camlines     #(*, 4) obs
        ddd = vehiclelines #(*, 5) obs

        matched_obslines     = np.array([[0,0,0,0]])
        matched_maplines     = np.array([[0,0,0,0]])
        matched_camlines     = np.array([[0,0,0,0]])
        matched_vehiclelines = np.array([[0,0,0,0]])

        maplines_length = len(maplines)
        obsline_length = len(obslines)

        if obsline_length < maplines_length:
            for i in range(obsline_length):
                # if bbb[i,4] == 0: #invalid 変な値のとき
                #     continue
                if obs_valid[i] == False:
                    continue
                #obs_temp, map_temp, cam_temp, vehicle_temp = self.__matching(bbb[i], aaa, ccc[i], ddd[i], 1)
                obs_temp, map_temp, cam_temp, vehicle_temp = self.__matching(bbb[i], aaa, ccc[i], ddd[i], pred_valid, 1)
                if np.all(obs_temp == [0,0,0,0]):
                    continue
                matched_obslines = np.vstack((matched_obslines, obs_temp))
                matched_maplines = np.vstack((matched_maplines, map_temp))
                matched_camlines = np.vstack((matched_camlines, cam_temp))
                matched_vehiclelines = np.vstack((matched_vehiclelines, vehicle_temp))
        else:
            for i in range(maplines_length):
                # if pred_valid[i] == False:
                #     continue
                #map_temp, obs_temp, cam_temp, vehicle_temp = self.__matching(aaa[i], bbb, ccc, ddd, 0)
                map_temp, obs_temp, cam_temp, vehicle_temp = self.__matching(aaa[i], bbb, ccc, ddd, obs_valid, 0)
                if np.all(obs_temp == [0,0,0,0]):
                    continue
                matched_obslines = np.vstack((matched_obslines, obs_temp))
                matched_maplines = np.vstack((matched_maplines, map_temp))
                matched_camlines = np.vstack((matched_camlines, cam_temp))
                matched_vehiclelines = np.vstack((matched_vehiclelines, vehicle_temp))

        matched_maplines = matched_maplines[1:]
        matched_obslines = matched_obslines[1:]
        matched_camlines = matched_camlines[1:]
        matched_vehiclelines = matched_vehiclelines[1:]

        return matched_maplines, matched_obslines, matched_camlines, matched_vehiclelines



    # def __matching_NOTtv(self, p, q, mode):
    #     ### mode == 0
    #     # p : maplines  (*, 4)
    #     # q : obslines  (*, 4)
    #     ### mode == 1
    #     # p : obslines  (*, 4)
    #     # q : maplines  (*, 4)

    #     theta_p = 0
    #     theta_q = 0

    #     listtemp = [[0,0,0,0,0,0,0]]

    #     px1 = p[0]
    #     py1 = p[1]
    #     px2 = p[2]
    #     py2 = p[3]

    #     # pの直線の方程式
    #     # ax + by + c = 0
    #     a = py2-py1
    #     b = px1-px2
    #     # c = (py1-py2)*px1 + (px2-px1)*py1
    #     if -1.0e-3 < b and b < 1.0e-3:
    #         theta_p = np.pi/2.0 #90度
    #     else:
    #         m1 = -a/b # 傾き
            
    #     # qの全ての点について
    #     # pに対応しそうな点を探す
    #     q_length = len(q)
    #     for j in range(q_length):

    #         qqq = q[j]
    #         qx1 = qqq[0]
    #         qy1 = qqq[1]
    #         qx2 = qqq[2]
    #         qy2 = qqq[3]

    #         # 点と線分の距離
    #         # (基本は点と直線の距離.  直線に対して垂線が引けなければ対応する端点との距離)
    #         dist1 = self.__distance(qx1,qy1,px1,py1,px2,py2, 0)
    #         if dist1 > self.__Thre_len:
    #             continue
    #         dist2 = self.__distance(qx2,qy2,px1,py1,px2,py2, 1)
    #         if dist2 > self.__Thre_len:
    #             continue


    #         # qの直線  傾き計算
    #         a2 = qy2-qy1
    #         b2 = qx1-qx2
    #         if -1.0e-3 <b2 and b2 < 1.0e-3:
    #             theta_q = np.pi/2.0
    #         else:
    #             m2 = -a2/b2

    #         # 二直線のなす角  p基準
    #         if theta_p == np.pi/2.0 and theta_q == np.pi/2.0: #どちらも90度 -> なす角0度
    #             theta = 0
    #         elif theta_p == np.pi/2.0: #pだけ90度
    #             if m2 >= 0: #m2は正 -> なす角は90度-atan(m2)
    #                 theta = (math.atan(m2)) - theta_p
    #             else: #m2は負 ->
    #                 theta = (math.atan(m2)) + theta_p # +theta_p = -(-theta_p)
    #         elif theta_q == np.pi/2.0:
    #             if m1 >= 0:
    #                 theta = theta_q - (math.atan(m1))
    #             else:
    #                 theta = -theta_q - (math.atan(m1))
    #         else:
    #             if m1 * m2 == -1: #直交
    #                 theta = np.pi/2.0
    #             else:
    #                 theta = math.atan((m2-m1)/(1+m2*m1))

    #         if abs(theta) > self.__Thre_rad:
    #             continue

    #         distdist = dist1 + dist2

    #         # 候補を保存
    #         # x1, y1, x2, y2, 距離, index, 角度
    #         listtemp = np.vstack((listtemp, [qx1, qy1, qx2, qy2, distdist, j, theta]))

    #     if len(listtemp) != 1:   # 候補が存在すれば
    #         listtemp = sorted(listtemp, key=itemgetter(4))

    #         # 一番近いやつを選択
    #         temp = listtemp[1]

    #         return p[0:4], temp[0:4]
    #     else:
    #         return [0,0,0,0],[0,0,0,0]

    
    # def __match_lines_NOTtv(self, pred_lines, obs_lines):
    #     aaa = pred_lines     #(*, 4) map
    #     bbb = obs_lines      #(*, 5) obs

    #     matched_obs_lines     = np.array([[0,0,0,0]])
    #     matched_pred_lines     = np.array([[0,0,0,0]])

    #     pred_lines_length = len(pred_lines)
    #     obsline_length    = len(obs_lines)

    #     if obsline_length < pred_lines_length:
    #         for i in range(obsline_length):
    #             obs_temp, map_temp = self.__matching_NOTtv(bbb[i], aaa, 1)
    #             if np.all(obs_temp == [0,0,0,0]):
    #                 continue
    #             matched_obs_lines = np.vstack((matched_obs_lines, obs_temp))
    #             matched_pred_lines = np.vstack((matched_pred_lines, map_temp))
    #     else:
    #         for i in range(pred_lines_length):
    #             map_temp, obs_temp = self.__matching_NOTtv(aaa[i], bbb, 0)
    #             if np.all(obs_temp == [0,0,0,0]):
    #                 continue
    #             matched_obs_lines = np.vstack((matched_obs_lines, obs_temp))
    #             matched_pred_lines = np.vstack((matched_pred_lines, map_temp))

    #     matched_pred_lines = matched_pred_lines[1:]
    #     matched_obs_lines = matched_obs_lines[1:]

    #     return matched_pred_lines, matched_obs_lines

    #---------- 関数定義(線分マッチング) ここまで ----------

    #---------- 線分描画 ----------
    def __draw(self, lines):
        plt.figure()

        lines_length = len(lines)
        for i in range(lines_length):
            # plt.xlim(0,self.__WIDTH )
            # plt.ylim(0,self.__HEIGHT)

            #vehecle
            # plt.xlim(-self.__WIDTH/2,self.__WIDTH/2)
            # plt.ylim(0,self.__HEIGHT/2+self.__BIRD[2])

            #map
            # plt.xlim(-self.__MAP_WIDTH*0.2,self.__MAP_WIDTH)
            # plt.ylim(-self.__MAP_WIDTH*0.2,self.__MAP_HEIGHT)

            plt.xlim(-1000, 640 * 2)
            plt.ylim(-1000, 480 * 2)
            plt.xlim(0, 480)
            plt.ylim(0, 640)

            plt.xlim(0, 640)
            plt.ylim(0, 680)
            
            plt.grid()
            #camera座標系は左上原点なので上下反転しているようにみえる
            #plt.plot([lines[i,0],lines[i,2]],[lines[i,1],lines[i,3]])

            #上下反転させる
            #image 座標系用
            plt.plot([lines[i,0],lines[i,2]],[self.__HEIGHT-lines[i,1],self.__HEIGHT-lines[i,3]])

            #camera 座標系用
            #plt.plot([lines[i,0],lines[i,2]],[self.__WIDTH-lines[i,1],self.__WIDTH-lines[i,3]])
            #vehicle
            #plt.plot([-lines[i,0],-lines[i,2]],[lines[i,1],lines[i,3]])
            #map
            #plt.plot([lines[i,0],lines[i,2]],[self.__MAP_HEIGHT-lines[i,1],self.__MAP_HEIGHT-lines[i,3]])

            #plt.plot([lines[i,0],lines[i,2]],[lines[i,1],lines[i,3]])

        plt.savefig('image/%03d.png' % self.__step)
        #plt.show()


    def __draw_match(self, lines, lines2):
        cmap = plt.get_cmap("tab20")

        plt.figure('matching')
        # plt.xlim(0,self.__WIDTH)
        # plt.ylim(0,self.__HEIGHT)
        plt.xlim(0,self.__MAP_WIDTH)
        plt.ylim(0,self.__MAP_HEIGHT)
        plt.grid(True)

        lines2_length = len(lines2)
        for count in range(lines2_length):
            cnt = count
            if cnt >= 20:
                cnt = cnt % 20
                # plt.plot([lines[count,0],lines[count,2]], [self.__HEIGHT-lines[count,1],self.__HEIGHT-lines[count,3]],  'k-', ls="solid", color=cmap(cnt))
                # plt.plot([lines2[count,0],lines2[count,2]], [self.__HEIGHT-lines2[count,1],self.__HEIGHT-lines2[count,3]],  'k-', ls="--", color=cmap(cnt))
                plt.plot([lines[count,0],lines[count,2]], [self.__MAP_HEIGHT-lines[count,1],self.__MAP_HEIGHT-lines[count,3]],  'k-', ls="solid", color=cmap(cnt))
                plt.plot([lines2[count,0],lines2[count,2]], [self.__MAP_HEIGHT-lines2[count,1],self.__MAP_HEIGHT-lines2[count,3]],  'k-', ls="--", color=cmap(cnt))

        plt.show()



    def __draw_match2(self, lines, lines2):
        cmap = plt.get_cmap("tab20")

        plt.figure('matching')
        # plt.xlim(0,self.__WIDTH)
        # plt.ylim(0,self.__HEIGHT)

        # plt.xlim(-self.__WIDTH,self.__WIDTH)
        # plt.ylim(0,self.__HEIGHT+self.__BIRD[2])
        plt.grid(True)

        
        length = min(len(lines),len(lines2))
        for count in range(length):
            cnt = count
            if cnt >= 20:
                cnt = cnt % 20
                # plt.plot([lines[count,0],lines[count,2]], [self.__HEIGHT-lines[count,1],self.__HEIGHT-lines[count,3]],  'k-', ls="solid", color=cmap(cnt))
                # plt.plot([lines2[count,0],lines2[count,2]], [self.__HEIGHT-lines2[count,1],self.__HEIGHT-lines2[count,3]],  'k-', ls="--", color=cmap(cnt))
                plt.plot([lines[count,0],lines[count,2]], [lines[count,1],lines[count,3]],  'k-', ls="solid", color=cmap(cnt))
                plt.plot([lines2[count,0],lines2[count,2]], [lines2[count,1],lines2[count,3]],  'k-', ls="--", color=cmap(cnt))

        plt.show()

    #---------- 線分描画 ここまで ----------


    #---------- feedback --------------
    def __calc_control_mat_from_odo(self, feedback):
        angv_r = feedback[0]
        angv_l = feedback[1]
        v_r = angv_r * self.__Tire_radius
        v_l = angv_l * self.__Tire_radius

        control_mat = self.__wheel_velocities2control_mat(v_r, v_l)
        return control_mat
    #---------- feedback ここまで--------------

    
    # def __TOPVIEW(self, lines, R_camera, T_camera):
    #     tv_lines = []
    #     R13 = R_camera[0][2]
    #     R23 = R_camera[1][2]
    #     R33 = R_camera[2][2]
    #     R31 = R_camera[2][0]
    #     R21 = R_camera[1][0]
    #     R11 = R_camera[0][0]
    #     Tx = T_camera[0][0]
    #     Ty = T_camera[1][0]
    #     Tz = T_camera[2][0]
    #     length = len(lines)
    #     for i in range(length):
    #         nu = lines[i][0]
    #         nv = lines[i][1]
    #         a = (-nv*Tz*(nu*R33-R13)+Ty*(nu*R33-R13)+nu*Tz*(nv*R33-R23)-Tx*(nv*R33-R23))/ \
    #             ((nv*R31-R21)*(nu*R33-R13)-(nu*R31-R11)*(nv*R33-R23))
    #         b = (-nv*Tz*(nu*R31-R11)+Ty*(nu*R31-R11)+nu*Tz*(nv*R31-R21)-Tx*(nv*R31-R21))/ \
    #             ((nv*R33-R23)*(nu*R31-R11)-(nu*R33-R13)*(nv*R31-R21))
            
    #         nu = lines[i][2]
    #         nv = lines[i][3]
    #         c = (-nv*Tz*(nu*R33-R13)+Ty*(nu*R33-R13)+nu*Tz*(nv*R33-R23)-Tx*(nv*R33-R23))/ \
    #             ((nv*R31-R21)*(nu*R33-R13)-(nu*R31-R11)*(nv*R33-R23))
    #         d = (-nv*Tz*(nu*R31-R11)+Ty*(nu*R31-R11)+nu*Tz*(nv*R31-R21)-Tx*(nv*R31-R21))/ \
    #             ((nv*R33-R23)*(nu*R31-R11)-(nu*R33-R13)*(nv*R31-R21))
    #         tv_line = np.array([a, b, c, d])
    #         tv_lines.append(tv_line)
    #     return np.array(tv_lines)
            

    def __uv_lines2tv_lines_fixed(self, uv_lines, T_camera):
        uv_lines = uv_lines.reshape((len(uv_lines),2,2))
        EYE_Y   = T_camera[1][0]
        BIRD    = self.__BIRD
        CONTEXT = self.__CONTEXT
        
        line_dummy = np.array([[0, 0], [0, 0]])
        lines = []
        valids = []
        for uv_line in uv_lines:
            line = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            valid = not line is None

            lines.append(line if valid else line_dummy)
            valids.append(valid)

        return np.array(lines).reshape((len(lines), 4)), valids
    
    ###################################################kkkkkkkkkkkkkk
    ###################################################


    def kalman_filter(self, x_hat_in, LSD_lines_f, LSD_lines_r, feedback, passed_time):
        x_hat = np.array([[x_hat_in['x']], [x_hat_in['z']], [x_hat_in['th']]])
        self.__x_hat = x_hat
        ### INPUT ###
        # LSD_lines(f/r)     : LSDからの線分情報(front/rear)       (*, 4) [x1, y1, x2, y2]
        # feedback           : タイヤの角速度 [right, left]        (1, 2)
        # passed_time        : 前時刻からの経過時間

        ### OUTPUT ###
        # x_hat : 事後推定値 (3, 1) [[x(mm)], [z(mm)], [theta(rad)]]

        self.__step = self.__step + 1

        #self.__x_hat = np.array([[self.__x_hat[0,0]],
        #                         [self.__x_hat[1,0]],
        #                         [self.__x_hat[2,0]]])
        DT_s = passed_time

        # feedback(角速度)から 制御行列計算
        # feedback(angular velocities) -> wheel velocities -> car's velocity and angular velocity
        control_mat = self.__calc_control_mat_from_odo(feedback)

        # 一時刻前との走行距離の差分
        delta_d = DT_s * control_mat[0,0]

        # ---------- [Step1]Prediction : feedback から 位置予測 ----------
        # x_hat_m : 事前状態推定値
        x_hat_m = self.__predict_position_from_feedback(control_mat, DT_s) ### (A)


        # Q   : 予測誤差を表す行列
        # jF  : ヤコビ行列  rounded(f)/rounded(u)
        # P_m : 事前誤差共分散行列
        Q   = self.__get_prediction_error_mat(control_mat, delta_d, DT_s)
        jF  = self.__jacobF(control_mat, DT_s)
        P_m = (jF @ self.__P @ jF.T) + Q  ### (B)
        # ---------- [Step1]Prediction ここまで ----------


        # ---------- [Step2]Update/Filtering ----------
        ##### front camera #####
        # feedback での予測位置で得られる線分情報
        pred_line_f = self.__get_lines_from_position(x_hat_m)

        # 実際に観測した線分情報
        obs_line_f = LSD_lines_f


        ##### rear camera #####
        # rear camera の位置姿勢
        x_hat_m_r = self.__convert_rear_position(x_hat_m)

        # feedback での予測位置で得られる線分情報
        pred_line_r = self.__get_lines_from_position(x_hat_m_r)

        # 実際に観測した線分情報
        obs_line_r = LSD_lines_r


        # 線分がひとつも検出されなければ修正を行わない(feedbackのみ利用)
        # x_hat : 事後推定値  [[x],[z],[yaw]]
        if len(pred_line_f) == 0 or len(obs_line_f) == 0 or len(pred_line_r) == 0 or len(obs_line_r) == 0:
            self.__x_hat = x_hat_m
            self.__P = P_m
            print('-----did not [detect] any lines-----')
            return self.__x_hat

        else:
            # Tv2m : vehicle座標系からmap座標系への並進行列(front)
            # Rv2m : vehicle座標系からmap座標系への回転行列(front)
            # ( _r 付きは rear)
            Tv2m   = self.__get_Tv2m(x_hat_m)
            Rv2m   = self.__get_Rv2m(x_hat_m)
            Tv2m_r = self.__get_Tv2m(x_hat_m_r)
            Rv2m_r = self.__get_Rv2m(x_hat_m_r)

            # 得られた線分情報をさまざまな座標系に変換
            '''
            # obs / pred
            ### obs  : 実際に観測した線分
            ### pred : feedbackによる予測地点での線分

            # i / c / v / m
            ### i : image   座標系 左上原点   u軸右向き v軸下向き
            ### c : camera  座標系 中心原点   u軸左向き v軸上向き
            ### v : vehicle 座標系 後輪間中心原点  x軸左向き z軸前向き
            ### m : map     座標系

            # b : 鳥瞰変換後の線分
            '''
            # def _(x):
            #     return x + 1
            # EYE_Y = self.__T_camera1[1][0]
            # BIRD  = self.__BIRD
            # CONTEXT = self.__CONTEXT
            
            # obs_ib_lines_f = np.array([uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT) for uv_line in pred_c_lines])

            # valids = map(lambda x: not x is None, obs_ib_lines_f)
            # obs_ib_lines_f = np.array(map(lambda x: x if not x is None else line_dummy, obs_ib_lines_f))

            # lines = []
            # for uv_line in obs_c_lines_f:
            #     line = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            #     lines.append(line)
            # obs_ib_lines_f = np.array(lines)
            
            # for line in obs_ib_lines_f:
            #     if line is None:
            #         donothing
            #     dosomething

            # dummy_line = np.array([[0, 0], [0, 0]])
            # lines = []
            # valids = []
            # for line in obs_c_lines_f:
            #     line = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
            #     valid = not line is None
            #     lines.append(line if valid else line_dummy)
            #     valids.append(valid)
            # obs_ib_lines_f = np.array(lines)


            ##### front #####
            obs_c_lines_f  = self.__LSD_uv2camera_uv( obs_line_f)                              #つかう  (*, 4)
            pred_c_lines_f = self.__LSD_uv2camera_uv(pred_line_f)                              #        (*, 4)

            #obs_ib_lines_f , obs_valid_f  = self.__uv_lines2tv_lines_fixed( obs_c_lines_f, self.__T_camera1)
            obs_ib_lines_f , obs_valid_f  = self.__uv_lines2tv_lines_fixed( obs_line_f, self.__T_camera1)


            #pred_ib_lines_f, pred_valid_f = self.__uv_lines2tv_lines_fixed(pred_c_lines_f, self.__T_camera1)
            pred_ib_lines_f, pred_valid_f = self.__uv_lines2tv_lines_fixed(pred_line_f, self.__T_camera1)
            
            obs_vb_lines_f  = self.__tv_uv2vehicle_xz(obs_ib_lines_f ,  obs_valid_f)                      #つかう  (*, 4)
            pred_vb_lines_f = self.__tv_uv2vehicle_xz(pred_ib_lines_f, pred_valid_f)                      #        (*, 4)

            # obs_mb_lines_f  = self.__vehicle_xz2map_xz(obs_vb_lines_f , Tv2m, x_hat_m, 0)      #つかう  (*, 5)
            # pred_mb_lines_f = self.__vehicle_xz2map_xz(pred_vb_lines_f, Tv2m, x_hat_m, 0)      #つかう  (*, 4)
            obs_mb_lines_f  = self.__vehicle_xz2map_xz(obs_vb_lines_f , Tv2m, x_hat_m,  obs_valid_f)      #つかう  (*, 4)
            pred_mb_lines_f = self.__vehicle_xz2map_xz(pred_vb_lines_f, Tv2m, x_hat_m, pred_valid_f)      #つかう  (*, 4)


            #self.__draw(obs_line_f)
            #self.__draw(obs_c_lines_f)
            #self.__draw(obs_ib_lines_f)
            #self.__draw(obs_c_lines_f)
            #self.__draw_match2(obs_ib_lines_f, pred_ib_lines_f)
            #print(obs_ib_lines_f)
            

            ###### rear #####
            obs_c_lines_r   = self.__LSD_uv2camera_uv( obs_line_r)                              #つかう  (*, 4)
            pred_c_lines_r  = self.__LSD_uv2camera_uv(pred_line_r)                              #        (*, 4)
            
            # obs_ib_lines_r , obs_valid_r  = self.__uv_lines2tv_lines_fixed( obs_c_lines_r, self.__T_camera2)
            # pred_ib_lines_r, pred_valid_r = self.__uv_lines2tv_lines_fixed(pred_c_lines_r, self.__T_camera2)
            obs_ib_lines_r , obs_valid_r  = self.__uv_lines2tv_lines_fixed( obs_line_r, self.__T_camera2)
            pred_ib_lines_r, pred_valid_r = self.__uv_lines2tv_lines_fixed(pred_line_r, self.__T_camera2)

            
            obs_vb_lines_r  = self.__tv_uv2vehicle_xz(obs_ib_lines_r ,  obs_valid_r)                      #つかう  (*, 4)
            pred_vb_lines_r = self.__tv_uv2vehicle_xz(pred_ib_lines_r, pred_valid_r)                      #        (*, 4)

            obs_mb_lines_r  = self.__vehicle_xz2map_xz(obs_vb_lines_r , Tv2m_r, x_hat_m_r,  obs_valid_r)  #つかう  (*, 4)
            pred_mb_lines_r = self.__vehicle_xz2map_xz(pred_vb_lines_r, Tv2m_r, x_hat_m_r, pred_valid_r)  #つかう  (*, 4)

            
            '''#++++++++++ (II)  [端点の対応付け]   map座標系で対応付け ++++++++++'''
            ### 対応する線分が同じindexとなるよう並び替えされる
            # matched_pred    <-  pred_mb_lines   (*, 4)
            # matched_obs     <-  obs_mb_lines    (*, 5)
            # matched_cam     <-  obs_c_lines     (*, 4)
            # matched_vehicle <-  obs_vb_lines    (*, 5)

            matched_pred_f, matched_obs_f, matched_cam_f, matched_vehicle_f = \
                    self.__match_lines(
                        pred_mb_lines_f,
                        obs_mb_lines_f,
                        obs_c_lines_f,
                        obs_vb_lines_f,
                        pred_valid_f,
                        obs_valid_f
                    )
            matched_pred_r, matched_obs_r, matched_cam_r, matched_vehicle_r = self.__match_lines(pred_mb_lines_r, obs_mb_lines_r, obs_c_lines_r, obs_vb_lines_r, pred_valid_r, obs_valid_r)

            
            #self.__draw_match(obs_mb_lines_f, pred_mb_lines_f)
            # self.__draw(obs_mb_lines_f)
            # self.__draw(pred_mb_lines_f)
            #self.__draw_match(matched_pred_f, matched_obs_f)
            #self.__draw_match2(obs_mb_lines_f, pred_mb_lines_f)

            

            #aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
            # # topviewじゃない画像でマッチング
            # matched_pred_NOTtv_f, matched_obs_NOTtv_f = self.__match_lines_NOTtv(pred_line_f, obs_line_f)
            # matched_pred_NOTtv_r, matched_obs_NOTtv_r = self.__match_lines_NOTtv(pred_line_r, obs_line_r)


            # # filter外し
            # matched_pred_tv_f = self.__get_ib_lines_egw_sim_no_filter(matched_pred_NOTtv_f, x_hat_m)
            # matched_obs_tv_f  = self.__get_ib_lines_egw_sim_no_filter(matched_obs_NOTtv_f , x_hat_m)
            # # matched_pred_map_f    = uv2wm(matched_pred_tv_f)
            # # matched_obs_map_f     = uv2wm(matched_obs_tv_f)
            # # matched_obs_vehicle_f = wm2cm(matched_obs_map_f)
            # matched_pred_vehicle_f = self.__tv_uv2vehicle_xz(matched_pred_tv_f, 0)
            # matched_obs_vehicle_f  = self.__tv_uv2vehicle_xz(matched_obs_tv_f , 0)
            # matched_pred_map_f     = self.__vehicle_xz2map_xz(matched_pred_vehicle_f, Tv2m, x_hat_m, 0)
            # matched_obs_map_f      = self.__vehicle_xz2map_xz(matched_obs_vehicle_f , Tv2m, x_hat_m, 0)

            # print(len(self.__get_ib_lines_egw_sim_no_filter(matched_pred_NOTtv_f, x_hat_m)))
            # print(len(self.__get_ib_lines_egw_sim(matched_pred_NOTtv_f, x_hat_m)))
            
            # print(len(matched_pred_NOTtv_f), len(matched_obs_NOTtv_f))
            # print(len(matched_pred_tv_f), len(matched_obs_tv_f))
                        
            # matched_pred_tv_r = self.__get_ib_lines_egw_sim_no_filter(matched_pred_NOTtv_r, x_hat_m)
            # matched_obs_tv_r  = self.__get_ib_lines_egw_sim_no_filter(matched_obs_NOTtv_r , x_hat_m)
            # # matched_pred_map_r    = uv2wm(matched_pred_tv_r)
            # # matched_obs_map_r     = uv2wm(matched_obs_tv_r)
            # # matched_obs_vehicle_r = wm2cm(matched_obs_map_r)
            # matched_pred_vehicle_r = self.__tv_uv2vehicle_xz(matched_pred_tv_r, 0)
            # matched_obs_vehicle_r  = self.__tv_uv2vehicle_xz(matched_obs_tv_r , 0)
            # matched_pred_map_r     = self.__vehicle_xz2map_xz(matched_pred_vehicle_r, Tv2m, x_hat_m, 0)
            # matched_obs_map_r      = self.__vehicle_xz2map_xz(matched_obs_vehicle_r , Tv2m, x_hat_m, 0)


            # matched_pred_f = matched_pred_map_f
            # matched_obs_f  = matched_obs_map_f
            # matched_cam_f  = self.__LSD_uv2camera_uv(matched_pred_NOTtv_f)
            # matched_vehicle_f = matched_obs_vehicle_f
            # matched_pred_r = matched_pred_map_r
            # matched_obs_r  = matched_obs_map_r
            # matched_cam_r  = self.__LSD_uv2camera_uv(matched_pred_NOTtv_r)
            # matched_vehicle_r = self.__LSD_uv2camera_uv(matched_pred_NOTtv_r)

             
            # 対応する線分がひとつもなければ修正を行わない
            if len(matched_pred_f) == 0 or len(matched_pred_r) == 0:
                self.__x_hat = x_hat_m
                self.__P = P_m
                print('                        +++++did not [match] any lines+++++')

            else:
                #"全ての線分に対して"
                ### 射影誤差   Delta
                ### 観測誤差   R_obs
                ### ヤコビ行列 H     求める

                # front camera について
                Delta_f = self.__matched_lines2obs_error(matched_obs_f, matched_pred_f, matched_vehicle_f, Rv2m, Tv2m)
                R_obs_up_f, R_obs_mid_f, R_obs_down_f = self.__matched_lines2Robs(matched_obs_f, matched_pred_f, matched_cam_f)
                H_f = self.__matched_lines2H(matched_obs_f, matched_pred_f, matched_vehicle_f, Rv2m, Tv2m, x_hat_m)

                # rear camera について
                Delta_r = self.__matched_lines2obs_error(matched_obs_r, matched_pred_r, matched_vehicle_r, Rv2m_r, Tv2m_r)
                R_obs_up_r, R_obs_mid_r, R_obs_down_r = self.__matched_lines2Robs(matched_obs_r, matched_pred_r, matched_cam_r)
                H_r = self.__matched_lines2H(matched_obs_r, matched_pred_r, matched_vehicle_r, Rv2m_r, Tv2m_r, x_hat_m_r)

                # front, rear のdata統合
                Delta = np.vstack((Delta_f, Delta_r))
                R_obs_up   = np.hstack((R_obs_up_f, R_obs_up_r))
                R_obs_mid  = np.hstack((R_obs_mid_f, R_obs_mid_r))
                R_obs_down = np.hstack((R_obs_down_f, R_obs_down_r))
                R_obs = self.__combine_R(R_obs_up, R_obs_mid, R_obs_down)
                H = np.vstack((H_f, H_r))

                
                # R_obs = np.diag(np.ones(len(R_obs)))*5 
                # #print(R_obs)
                # Delta = np.ones((len(Delta),1))*5
                #print(Delta)
                # H = np.ones((len(H),3))
                # #print(H)

                
                # カルマンゲイン計算
                G = self.__calc_kalman_gain(P_m, R_obs, H)  #(C)

                # x_hat : 事後推定値   観測した線分情報でfeedbackから予測した位置の修正を行った後の推定位置姿勢
                self.__x_hat = self.__correct_position(x_hat_m, G, Delta)   #(D)

                # P : 事後誤差共分散行列
                I = np.identity(self.__x_hat.shape[0])
                self.__P = (I - G @ H) @ P_m   #(E)

            return self.__x_hat

                # ---------- [Step2]Update/Filtering ここまで ----------
    ###################################################

# simulation用 ########################################################################
def wheel_velocities2control_mat(v_r, v_l, DR):
    ''' 左右の車輪速度から制御行列を求める
    引数：
        v_r  : 右後輪車速 (float, [pixel/sec])
        v_l  : 左後輪車速 (float, [pixel/sec])
    返値：
        control_mat  : 制御行列  (2, 1)
    '''
    v     = (v_r + v_l) / 2               # 車両速度
    omega = (v_r - v_l) / (2 * DR) # 車両角速度

    control_mat = np.array([[  v  ],
                            [omega]])
    return control_mat

def calc_control_mat_from_odo(feedback, DR):
    Tire_radius = 15.25
    angv_r = feedback[0]
    angv_l = feedback[1]
    v_r = angv_r * Tire_radius
    v_l = angv_l * Tire_radius
    
    control_mat = wheel_velocities2control_mat(v_r, v_l, DR)
    return control_mat


def predict_position_from_feedback(x_hat, u, DT_s):
    '''状態x(k)算出
    状態方程式：x(k) = f(x(k-1),u(k-1))
    引数：
    　  # x_hat ：前時刻の事後推定値　状態x(k-1)
    　  u     ：制御行列
    返値：
    　x_hat_m ：現時刻の事前推定値　状態x(k)
    '''
    yaw   = x_hat[2, 0]
    v     = u[0,0]  # 車両速度
    omega = u[1,0]  # 車両角速度

    x_hat_m = x_hat + np.array([[v*DT_s*np.sinc(omega*DT_s/2)*np.sin(yaw + omega*DT_s/2)],
                                       [v*DT_s*np.sinc(omega*DT_s/2)*np.cos(yaw + omega*DT_s/2)],
                                       [omega*DT_s]])
    if x_hat_m[2] > 2*np.pi:
        x_hat_m = x_hat_m + np.array([[0],
                                      [0],
                                      [-2*np.pi]])
    if x_hat_m[2] < 0:
        x_hat_m = x_hat_m + np.array([[0],
                                      [0],
                                      [2*np.pi]])
    return x_hat_m


def get_lines_from_position(x_hat_m, WM_LINES, CONTEXT):
    eye = np.array([float(x_hat_m[0]), 100, float(x_hat_m[1])]) #注意 : "ミリ"メートル
    theta = np.array([0, (np.rad2deg(x_hat_m[2])), 0]) / 180 * np.pi

    if abs(theta[1]-np.pi/2) < 1e-10 or abs(theta[1]+np.pi/2) < 1e-10 or abs(theta[1]-(3/2)*np.pi) < 1e-10 or abs(theta[1]+(3/2)*np.pi) < 1e-10:
        #print('\n----------------------------------------------------------\n')
        theta = np.array([0, (np.rad2deg(x_hat_m[2]) -0.5), 0]) / 180 * np.pi

    r = theta2r(theta)
    lines = wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT)
    return lines.reshape((len(lines),4))

# def four2five(lines):
#     length = len(lines)
#     LINES = np.array([[0,0,0,0,0]])
#     for i in range(length):
#         LINES = np.vstack((LINES, np.array([lines[i,0], lines[i,1], lines[i,2], lines[i,3], 1])))
#     return LINES[1:]

# def five2four(lines):
#     length = len(lines)
#     LINES = np.array([[0,0,0,0]])
#     for i in range(length):
#         LINES = np.vstack((LINES, np.array([lines[i,0], lines[i,1], lines[i,2], lines[i,3]])))
#     return LINES[1:]

# def get_ib_lines_egw_sim(lines, x_hat_m, CONTEXT, BIRD):
#     eye = np.array([float(x_hat_m[0]), 100, float(x_hat_m[1])])
#     theta = np.array([0, (np.rad2deg(x_hat_m[2])), 0]) / 180 * np.pi
#     r = theta2r(theta)

#     lines = lines.reshape((len(lines),2,2))
#     lines = bird_view(lines, eye, r, BIRD, CONTEXT)

#     lines = lines.reshape((len(lines),4))
#     #print(lines)
#     lines = four2five(lines)
#     return lines



# def uv_lines2tv_lines_fixed(uv_lines, T_camera, BIRD, CONTEXT):
#     uv_lines = uv_lines.reshape((len(uv_lines),2,2))
#     EYE_Y   = T_camera[1][0]

#     dummy_line = np.array([[0, 0], [0, 0]])
#     lines = []
#     valids = []
#     for uv_line in uv_lines:
#         line = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
#         valid = not line is None
#         lines.append(line if valid else line_dummy)
#         valids.append(valid)

#     return np.array(lines).reshape((len(lines), 4)), valids



# simulation用 ここまで ########################################################################


