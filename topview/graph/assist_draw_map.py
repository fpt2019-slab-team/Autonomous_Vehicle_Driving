#!/usr/bin/python3

import cv2
import numpy as np
from multiprocessing import Manager, Value, Process

from math import sin, cos, tan, pi, sqrt, asin, acos, atan2
from itertools import product
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from functools import reduce
from PIL import Image, ImageDraw

def theta2r(theta):
    r = np.array([
        [cos(theta), -sin(theta)],
        [sin(theta),  cos(theta)],
    ])
    return r

# lines: np.shape == (*, 2, 2)
# SIZE:  np.shape == (WIDTH, HEIGHT)
def lines2img(lines, SIZE, LINE_WIDTH=1, LEN_N=3, img=None):
    WIDTH  = SIZE[0]
    HEIGHT = SIZE[1]
    if img == None:
        img = Image.fromarray(np.zeros((HEIGHT, WIDTH)))
        img = img.convert('RGB')
    draw = ImageDraw.Draw(img)
    fill = 'red'
    for i in range(len(lines)):
        line = lines[i]
        draw.line((*line[0], *line[1]), fill=fill, width=LINE_WIDTH)
        r = theta2r(-pi / 2)
        n = np.dot(r, (line[1] - line[0]) / np.linalg.norm(line[1] - line[0]))
        m = (line[0] + line[1]) / 2
        draw.line((*m, *(m + n * LEN_N)), fill=fill, width=LINE_WIDTH)

    return img

def get_lines(SIZE):
    if True:
        LINES_LSD_XZ = np.load('map.large_18522x13230.npy') / \
                18522 * max(SIZE) # (293, 4)
        lines = LINES_LSD_XZ.reshape(len(LINES_LSD_XZ), 2, 2)
    else:
        lines = np.array([
            #[[ 100,  100], [ 200,  200]],
            [[ 200,  200], [ 100,  100]],
        ])
    return lines

def main():
    IS_OVERRIDE = True
    LINE_WIDTH = 5
    LEN_N = 100

    MAP_SIZE = np.array([3500, 4900])
    WIDTH  = MAP_SIZE[0]
    HEIGHT = MAP_SIZE[1]

    lines = get_lines(MAP_SIZE)

    if IS_OVERRIDE:
        img = Image.open('./map.large_4900x3500.png').convert('RGB')
    else:
        img = None
    img = lines2img(
        lines,
        MAP_SIZE,
        LINE_WIDTH=LINE_WIDTH,
        LEN_N=LEN_N,
        img=img,
    )

    img.save('a.png')

if __name__ == '__main__':
    main()

