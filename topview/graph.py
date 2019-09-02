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
img = cv2.imread("ref_map.png",0)

lsd = cv2.createLineSegmentDetector(0)
lines = lsd.detect(img)[0]
lines = np.array(lines).reshape(len(lines), 4)
print(lines)
lines = np.array([
    lines[0:,0], lines[0:,2],
    np.zeros(len(lines)), np.zeros(len(lines)),
    lines[0:,1], lines[0:,3]]).T.reshape(len(lines), 3, 2)
print(lines)
print(lines.shape)

for line in lines:
    ax.plot(*line, "-", c='red', linewidth=0.5)


# axis #########################################################################
ax.set_aspect(img.shape[0] / img.shape[1])

# set x, y, z range
lims = (img.shape[1], 300, img.shape[0])
ax.set_xlim3d(0, lims[0])
ax.set_ylim3d(0, lims[1])
ax.set_zlim3d(0, lims[2])

# plot axis
ax.plot([0, lims[0]], [0,       0], [0,       0] , "-", c='000000')
ax.plot([0,       0], [0, lims[1]], [0,       0] , "-", c='000000')
ax.plot([0,       0], [0,       0], [0, lims[2]] , "-", c='000000')

# label x, y, z, O
ax.text(lims[0] * 1.08,              0,              0, "x", color='black')
ax.text(             0, lims[1] * 1.08,              0, "y", color='black')
ax.text(             0,              0, lims[2] * 1.08, "z", color='black')
ax.text(             0,              0,              0, "O", color='black')

# plot tick
diff = 50
for axis in range(3):
    for i in range(0, lims[axis] + 1, diff):
        begin = [0, 0, 0]
        begin[axis - 0] = i
        begin[axis - 2] = lims[axis - 2]
        begin[axis - 1] = 0
        end = list(begin)
        end[axis - 2] = 0
        ax.plot(*list(zip(begin, end)), "--", c='black', linewidth=0.5)

        begin[axis - 2] = 0
        begin[axis - 1] = lims[axis - 1]
        end = list(begin)
        end[axis - 1] = 0
        ax.plot(*list(zip(begin, end)), "--", c='black', linewidth=0.5)

        labelpos = [0, 0, 0]
        labelpos[axis - 0] = i
        labelpos[axis - 2] = 0 #int(diff / 10)
        labelpos[axis - 1] = 0
        ax.text(*labelpos, str(i), color='black')

# parameter ####################################################################
T = np.array([400, 75, 600])

f = 75

theta_x = pi / 180 * 35
theta_y = pi / 180 * 135
theta_z = 0

width = 320
height = 240
scale = 0.25

ax.plot(*zip(T), "o")

# R ############################################################################

R_x = np.array([[           1,            0,              0],
                [           0,  cos(theta_x), -sin(theta_x)],
                [           0,  sin(theta_x),  cos(theta_x)]])

R_y = np.array([[cos(theta_y),             0, -sin(theta_y)],
                [           0,             1,             0],
                [sin(theta_y),             0,  cos(theta_y)]])

R_z = np.array([[cos(theta_z), -sin(theta_z),             0],
                [sin(theta_z),  cos(theta_z),             0],
                [           0,             0,             1]])

R = np.dot(R_y, R_x)

# qoints_f #####################################################################
points_f = []

w = int(width / 2 * scale)
h = int(height / 2 * scale)
for u, v in (-w, -h), (-w, h), (w, h), (w, -h): #range(-w, w, 10):
    C = np.array([u, v, f])
    W_f = np.dot(R, C) + T
    points_f.append(W_f)

points_f.append(points_f[0])

ax.plot(*list(zip(*points_f)), "-", c='000000')

for point in points_f:
    ax.plot(*zip(T, point) , "--", c='000000')

# u, v -> x, z #################################################################
diff = int(width * scale * 5 / 100 + 1)
for u in range(-w, w, diff):
    for v in range(-h, h, diff):
        C = np.array([u, v, f])
        W_f = np.dot(R, C) + T
        n = W_f - T
        x = -T[1] / n[1] * n[0] + T[0]
        y = 0
        z = -T[1] / n[1] * n[2] + T[2]
        if 0 < x < lims[0] and 0 < z < lims[2]:
            ax.plot([x], [y], [z], "o", c='000000', ms=2)

#ax.view_init(90 + 20, -90 + 30);plt.show();exit()

# points_w #####################################################################
# (x - x0) / a = (y - y0) / b = (z - z0) / c
# n = np.array([a, b, c])
# T = np.array([x0, y0, z0])
# y = 0
# x = -y0 / b * a + x0
# z = -y0 / b * c + z0
# x0 = T[0]
# y0 = T[1]
# z0 = T[2]
# a = n[0]
# b = n[1]
# c = n[2]
ns = points_f - T
xs = -T[1] / ns[:,1] * ns[:,0] + T[0]
ys = np.zeros(len(points_f))
zs = -T[1] / ns[:,1] * ns[:,2] + T[2]
points_w = np.array(list(zip(xs, ys, zs)))
for point in points_w:
    ax.plot(*zip(T, point) , "--", c='000000')
ax.plot(xs, ys, zs, "--", c='000000')

# view #########################################################################
ax.view_init(90 + 30, -90);plt.show();exit()

# animation  ###################################################################
for i in range(0, 30):
    ax.view_init(90 - i, -90)
    plt.draw()
    plt.pause(0.001)

plt.show()
