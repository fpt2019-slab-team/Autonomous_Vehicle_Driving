#!/usr/bin/python3

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np
from math import sin,cos,pi
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
import cv2

# init #########################################################################
fig = plt.figure()
ax = Axes3D(fig)
#ax.set_zscale('linear')
ax.set_axis_off()
#ax.autoscale(enable=False)
#ax.auto_scale_xyz(1, 1, 1)

# plot map #####################################################################
img = cv2.imread("../feature_detection/img/ref_map.png",0)

lsd = cv2.createLineSegmentDetector(0)
lines = lsd.detect(img)[0]
lines = np.array(lines).reshape(len(lines), 4)
print(len(lines))

np.save('lines', lines)
