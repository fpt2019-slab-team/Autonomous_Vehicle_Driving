#!/usr/bin/python3

from math import pi

def drive(img_f, img_r, additional={}):
    status = additional['car'].get_status()
    car_eye = status['eye']
    car_theta = status['theta'] / pi * 180

    if not additional['is_driving']:
        odmetry = (0, 0)
    elif \
        90 < car_theta[1] <= 180 and car_eye[2] <  90 or \
         0 < car_theta[1] <=  90 and car_eye[0] <  90 or \
       270 < car_theta[1] <= 360 and car_eye[2] > 505 or \
       180 < car_theta[1] <= 270 and car_eye[0] > 335 or \
       False:
        odmetry = (0.25, -128)
    else:
        odmetry = (1.0,    0)

    return odmetry

