#!/usr/bin/python3

import numpy as np
from math import sin, cos, tan, pi, sqrt, asin, acos, atan2

################################################################################
# wm_*: a point located on the map              in the world  coordinate
#       np.array([x, 0, z])
# wf_*: a point located on the forcused surface in the world  coordinate
#       np.array([x, y, z])
# cm_*: a point located on the map              in the camera coordinate
#       np.array([x, y, z])
# cf_*: a point located on the forcused surface in the camera coordinate
#       np.array([x, y, F])
################################################################################
# *_line: a pair of points
################################################################################

################################################################################
# line:   np.shape == (2, D) (2 points on D-dimentions space)
# ret: n: np.shape == (D,)   (unit vector of line)
def line2n(line):
    point0 = line[0]
    point1 = line[1]
    d = point1 - point0
    n = d / np.linalg.norm(d)
    return n

################################################################################
# theta:    np.array([theta_x, theta_y, theta_z]) [rad]
# ret: r:   np.shape == (3, 3) (rotation matrix)
# Note: only works with theta_z == 0
def theta2r(theta):
    r_x = np.array([[           1  ,            0  ,            0  ],
                    [           0  ,  cos(theta[0]), -sin(theta[0])],
                    [           0  ,  sin(theta[0]),  cos(theta[0])]])
    r_y = np.array([[ cos(theta[1]),            0  ,  sin(theta[1])],
                    [           0  ,            1  ,            0  ],
                    [-sin(theta[1]),            0  ,  cos(theta[1])]])
    #r_z = np.array([[ cos(theta[2]), -sin(theta[2]),            0  ],
    #                [ sin(theta[2]),  cos(theta[2]),            0  ],
    #                [           0  ,            0  ,            1  ]])
    #r = np.linalg.multi_dot((r_y, r_x))
    r = r_y @ r_x
    return r

# r:            np.shape == (3, 3)
# ret: theta:   np.array([theta_x, theta_y, 0]) [rad]
# Note: only works with theta_z == 0
def r2theta(r):
    theta_x = acos(r[1][1]) * np.sign(-r[1][2])
    theta_y = acos(r[0][0]) * np.sign(-r[2][0])
    theta_z = 0
    return np.array((theta_x, theta_y, theta_z)) % (2 * pi)

################################################################################
# w:        np.array([x, y, z])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# ret: c:   np.array([x, y, z])
def w2c(w, eye, r):
    c = np.dot(np.linalg.inv(r), (w - eye))
    return c

# c:        np.array([x, y, z])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# ret: w:   np.array([x, y, z])
def c2w(c, eye, r):
    w = (r @ c) + eye
    return w

################################################################################
# cf:       np.array([x, F, z])
# CONTEXT:
# ret: uv:  np.array([u, v])
def cf2uv(cf, CONTEXT):
    x = cf[0]
    y = cf[1]
    u = CONTEXT['WIDTH']  / 2 - x * CONTEXT['SCALE']
    v = CONTEXT['HEIGHT'] / 2 - y * CONTEXT['SCALE']
    uv = np.array([u, v])
    return uv

# uv:       np.array([u, v])
# CONTEXT:
# ret: cf:  np.array([x, F, z])
def uv2cf(uv, CONTEXT):
    u = uv[0]
    v = uv[1]
    x = (CONTEXT['WIDTH']  / 2 - u) / CONTEXT['SCALE']
    y = (CONTEXT['HEIGHT'] / 2 - v) / CONTEXT['SCALE']
    cf = np.array([x, y, CONTEXT['F']])
    return cf

################################################################################
# wm:       np.array([x, 0, z])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:
# ret: uv:  np.array([u, v])
def wm2uv(wm, eye, r, CONTEXT):
    #print('wm: ', wm.astype(int))
    cm = w2c(wm, eye, r)
    #print('cm: ', cm.astype(int))
    cf = cm2cf(cm, CONTEXT)
    #print('cf: ', cf.astype(int))
    uv = cf2uv(cf, CONTEXT)
    #print('uv: ', uv.astype(int))
    return uv

# uv:       np.array([u, v])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:
# ret: wm:  np.array([x, 0, z])
def uv2wm(uv, eye, r, CONTEXT):
    cf = uv2cf(uv, CONTEXT)
    wf = c2w(cf, eye, r)
    wm = wf2wm(wf, eye, r)
    return wm

################################################################################
# cm:       np.array([x, y, z])
# CONTEXT:
# ret: cf:  np.array([x, y, F])
def cm2cf(cm, CONTEXT):
    x = CONTEXT['F'] / cm[2] * cm[0]
    y = CONTEXT['F'] / cm[2] * cm[1]
    cf = np.array([x, y, CONTEXT['F']])
    return cf

# cf:       np.array([x, y, F])
# CONTEXT:
# ret: cm:  np.array([x, y, z])
def cf2cm(cf, eye, r):
    wf = c2w(cf, eye, r)
    wm = wf2wm(wf, eye, r)
    cm = w2c(wm, eye, r)
    return cm

################################################################################
# wm:       np.array([x, 0, z])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# ret: wf:  np.array([x, y, z])
def wm2wf(wm, eye, r, CONTEXT):
    cm = w2c(wm, eye, r)
    cf = cm2cf(cm, CONTEXT['F'])
    wf = c2w(cf, eye, r)
    return wf

# wf:       np.array([x, y, z])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# ret: wm:  np.array([x, 0, z])
def wf2wm(wf, eye, r):
    n = wf - eye
    try:
        x = -eye[1] / n[1] * n[0] + eye[0]
    except FloatingPointError:
        x = 2 ** 32
    try:
        z = -eye[1] / n[1] * n[2] + eye[2]
    except FloatingPointError:
        z = 2 ** 32
    wm = np.array([x, 0, z])
    return wm

################################################################################
# wm_line:  np.array([(x, 0, z), (x, 0, z)])
# wm_edge0: np.array([(x, 0, z), (x, 0, z)])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:
# ret:      uv_line:  np.array([(u, v), (u, v)]) or None
def wm_line2uv_line(wm_line, wm_edge0, eye, r, CONTEXT):
    uv_line = [] # (2, 2)
    for wm in wm_line: # (2,)
        cm = w2c(wm, eye, r)
        try:
            if cm[2] < CONTEXT['F']: # behind of camera
                edge = np.array((
                    (wm_edge0[0][0], wm_edge0[0][2]),
                    (wm_edge0[1][0], wm_edge0[1][2]),
                ))
                line = np.array((
                    ( wm_line[0][0],  wm_line[0][2]),
                    ( wm_line[1][0],  wm_line[1][2]),
                ))
                if abs(np.dot(line2n(edge), line2n(line))) > 0.9:
                    return None # edge and line are parallel
                # z = ax + b
                try:
                    edge_a = (edge[1][1] - edge[0][1]) / (edge[1][0] - edge[0][0])
                except FloatingPointError:
                    edge_a = 2 ** 32
                try:
                    line_a = (line[1][1] - line[0][1]) / (line[1][0] - line[0][0])
                except FloatingPointError:
                    line_a = 2 ** 32
                edge_b = edge[0][1] - edge_a * edge[0][0]
                line_b = line[0][1] - line_a * line[0][0]
                try:
                    x = (line_b - edge_b) / (edge_a - line_a)
                except FloatingPointError:
                    return None # edge and line are parallel
                z = edge_a * x + edge_b
                wm = np.array((x, 0, z))
            uv = wm2uv(wm, eye, r, CONTEXT) # (2,)
            uv_line.append(uv)
        except ValueError:
            print('wm:', wm)
            print('cm:', cm)
            print('CONTEXT:', CONTEXT)
            raise ValueError
            exit()
    uv_line = np.array(uv_line)

    if np.linalg.norm(uv_line[0] - uv_line[1]) < CONTEXT['WIDTH'] * 0.0001:
        return None # both points are behind of camera

    return uv_line

# uv_line:      np.array([(u, v), (u, v)])
# eye:          np.array([x, y, z])
# r:            np.shape == (3, 3)
# CONTEXT:
# ret: wm_line: np.array([(x, 0, z), (x, 0, z)])
def uv_line2wm_line(uv_line, eye, r, CONTEXT):
    wm_line = []
    for uv in uv_line:
        wm = uv2wm(uv, eye, r, CONTEXT)
        wm_line.append(wm)
    return np.array(wm_line)

################################################################################
# wm_lines:         np.shape == (N, 2, 3)
# eye:              np.array([x, y, z])
# r:                np.shape == (3, 3)
# CONTEXT:
# ret: uv_lines:    np.shape == (N - *, 2, 2) or None
def wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT):
    UV_VS = get_UV_VS(CONTEXT)
    wm_vs = np.array([uv2wm(uv, eye, r, CONTEXT) for uv in UV_VS])
    wm_edge0 = np.array((wm_vs[0], wm_vs[1]))

    # wm_line2uv_line
    uv_lines = [] # (293 - *, 2, 2)
    for wm_line in WM_LINES: # (2, 3)
        uv_line = wm_line2uv_line(wm_line, wm_edge0, eye, r, CONTEXT)
        if not uv_line is None:
            uv_lines.append(uv_line)
    uv_lines = np.array(uv_lines)

    # filter_uv_line
    uv_lines_filtered = []
    for uv_line in uv_lines:
        uv_line_filtered = filter_uv_line(uv_line, CONTEXT)
        if not uv_line_filtered is None:
            uv_lines_filtered.append(uv_line_filtered)
    uv_lines_filtered = np.array(uv_lines_filtered)

    return uv_lines_filtered

# uv_lines: np.shape == (N - *, 2, 2) or None
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:
# wm_lines: np.shape == (N, 2, 3)
def uv_lines2wm_lines(uv_lines, eye, r, CONTEXT):
    wm_lines = []
    for uv_line in uv_lines:
        wm_line = uv_line2wm_line(uv_line, eye, r, CONTEXT)
        wm_lines.append(wm_line)
    wm_lines = np.array(wm_lines)
    return wm_lines

################################################################################
# eye:           np.array([x, y, z])
# r:             np.shape == (3, 3)
# CONTEXT:
# IMG_MAP:       np.shape == (IMG_W, IMG_H) (grayscale, use cv2.imread())
# ret: img_view: np.shape == (WIDTH, HEIGHT)
def get_img_view(eye, r, CONTEXT, IMG_MAP):
    img_view = np.zeros((CONTEXT['HEIGHT'], CONTEXT['WIDTH']))

    uvs = product(range(0, CONTEXT['HEIGHT']), range(0, CONTEXT['WIDTH']))
    for v, u in uvs:
        uv = (u, v)
        wm_p = uv2wm(uv, eye, r, CONTEXT).astype(int)

        x, z = wm_p[0], wm_p[2]
        if 0 <= z < IMG_MAP.shape[0] and 0 <= x < IMG_MAP.shape[1]:
            img_view[v][u] = IMG_MAP[z][x]

    return img_view

################################################################################
# uv:       np.array([u, v])
# CONTEXT:
# ret:      bool
#def is_inside(uv, CONTEXT):
#    u, v = uv
#    return 0 <= u <= CONTEXT['WIDTH'] - 1 and 0 <= v <= CONTEXT['HEIGHT'] - 1

# line: np.shape == (2, 2)
# ret:  (a, b)
# Note: y = a * x + b
def line2ab(line):
    n = line2n(line)
    try:
        a = n[1] / n[0]
    except FloatingPointError:
        a = 2 ** 32
    y = line[0][1]
    x = line[0][0]
    b = y - a * x
    return np.array([a, b])

# p:    np.array([x, y])
# line: np.shape == (2, 2)
# ret:  np.array([x, y]) or None
# Note: compatible for any 2D coordinate
def left_horizontal_line_test(p, line):
    px = p[0]
    py = p[1]
    ymin = min(line[0][1], line[1][1])
    ymax = max(line[0][1], line[1][1])
    if not ymin <= py <= ymax:
        return None
    # y = a * x + b
    a, b = line2ab(line)
    if abs(a) < 0.001: # line is horizontal
        return None
    x = (py - b) / a
    return np.array([x, py]) if (x < px) else None


# p:        np.array([x, y])
# edges:    np.shape == (4, 2, 2)
# ret:      bool
# Note:     compatible to any 2D coordinate
def is_inside(p, edges):
    count = 0
    for edge in edges:
        count += 1 if left_horizontal_line_test(p, edge) is None else 0
    return count % 2 == 1

################################################################################
# https://www.hiramine.com/programming/graphics/2d_segmentintersection.html
# line_0:            np.shape == (2, 2)
# line_1:            np.shape == (2, 2)
# ret: intersection: np.shape == (2,) if intersection exists else None
def get_intersection(line_0, line_1):
    pa = line_0[0]
    pb = line_0[1]
    pc = line_1[0]
    pd = line_1[1]

    d = (pb[0] - pa[0]) * (pd[1] - pc[1]) - (pb[1] - pa[1]) * (pd[0] - pc[0])

    if d == 0: # parallel
        return None

    dac = pc - pa;

    r = ((pd[1] - pc[1]) * dac[0] - (pd[0] - pc[0]) * dac[1]) / d
    s = ((pb[1] - pa[1]) * dac[0] - (pb[0] - pa[0]) * dac[1]) / d

    intersection = pa + r * ( pb - pa )

    if 0 <= r <= 1 and 0 <= s <= 1:
        return intersection
    else:
        return None

################################################################################
# array:         iterable
# ret: indicies: [0, 2, ...] (evaluate array elements as bool)
def get_true_indicies(array):
    indicies = []
    for i in range(len(array)):
        if hasattr(array[i], '__iter__'):
            if len(array[i]) != 0:
                indicies.append(i)
        elif bool(array[i]):
            indicies.append(i)

    return indicies

################################################################################
# CONTEXT:
# ret: UV_VS: np.shape == (4, 2) 4 verticies of uv surface
def get_UV_VS(CONTEXT, margin=0):
    UV_VS = np.array((
        (                   0 + margin, CONTEXT['HEIGHT'] - 1 - margin),
        (CONTEXT['WIDTH'] - 1 - margin, CONTEXT['HEIGHT'] - 1 - margin),
        (CONTEXT['WIDTH'] - 1 - margin,                     0 + margin),
        (                   0 + margin,                     0 + margin),
    ))
    return UV_VS

# uv
# ((0, 0) <= (u, v) <= (479, 639))
# O--------> u
# |       |
# |       |
# |       |
# |       |
# |       |
# |_______| ==> u, v = (479, 639) = (WIDTH - 1, HEIGHT - 1)
# V
# v

################################################################################
# lines:        np.shape == (N, 2, 2)
# ret: lines:   np.shape == (N - *, 2, 2)
def delete_nan(lines):
    return lines[~np.isnan(lines).any(axis=(2,1))]

# uv_lines:      np.shape == (293 - *, 2, 2)
# CONTEXT:
# ret: uv_lines: np.shape == (293 - * - *, 2, 2)
#def filter_uv_lines(uv_lines, CONTEXT):
#    UV_VS = get_UV_VS(CONTEXT)
#
#    if len(uv_lines) == 0:
#        return np.array([])
#
#    is_insides = [] # (293 - *, 2)
#    for uv_line in uv_lines:
#        is_insides.append([
#            is_inside(uv_line[0], CONTEXT),
#            is_inside(uv_line[1], CONTEXT),
#        ])
#
#    uv_edges = np.array((
#        (UV_VS[0], UV_VS[1]),
#        (UV_VS[1], UV_VS[2]),
#        (UV_VS[2], UV_VS[3]),
#        (UV_VS[3], UV_VS[0]),
#    ))
#
#    intersections = [] # (293 - *, 4, 2)
#    for uv_line in uv_lines:
#        intersections.append([
#            get_intersection(uv_line, uv_edges[0]),
#            get_intersection(uv_line, uv_edges[1]),
#            get_intersection(uv_line, uv_edges[2]),
#            get_intersection(uv_line, uv_edges[3]),
#        ])
#
#    uv_lines_filtered = np.array(uv_lines)
#
#    # remove rows containing an nan
#    uv_lines_filtered = delete_nan(uv_lines_filtered)
#
#    # remove lines out of view
#    uv_lines_filtered_tmp = []
#    for i in range(len(uv_lines_filtered)):
#        true_indicies_is_inside = get_true_indicies(is_insides[i])
#        true_indicies_intersection = get_true_indicies(intersections[i])
#        if len(true_indicies_is_inside) == 2:
#            line = uv_lines_filtered[i]
#        elif len(true_indicies_is_inside) == 1:
#            # len(true_indicies_intersection) == 1
#            pa = uv_lines_filtered[i][true_indicies_is_inside[0]]
#            pb = intersections[i][true_indicies_intersection[0]]
#            line = (pa, pb) if true_indicies_is_inside[0] == 0 else (pb, pa)
#        elif len(true_indicies_intersection) == 2: # 0 or 2
#            pa = intersections[i][true_indicies_intersection[0]]
#            pb = intersections[i][true_indicies_intersection[1]]
#            norm_pa_0 = np.linalg.norm(uv_lines_filtered[i][0] - pa)
#            norm_pa_1 = np.linalg.norm(uv_lines_filtered[i][1] - pa)
#            line = (pa, pb) if norm_pa_0 <= norm_pa_1 else (pb, pa)
#        else:
#            continue
#        uv_lines_filtered_tmp.append(line)
#    uv_lines_filtered = np.array(uv_lines_filtered_tmp) # (293 - * - *, 2, 2)
#
#    if len(uv_lines_filtered) == 0:
#        return uv_lines_filtered
#
#    # remove points out of ((0, 0), (WIDTH, HEIGHT))
#    invalid_u_indices = uv_lines_filtered[:, :, 0] > CONTEXT['WIDTH']  - 1
#    invalid_j_indices = uv_lines_filtered[:, :, 1] > CONTEXT['HEIGHT'] - 1
#    uv_lines_filtered[invalid_u_indices, 0] = CONTEXT['WIDTH']  - 1
#    uv_lines_filtered[invalid_j_indices, 1] = CONTEXT['HEIGHT'] - 1
#
#    # remove lines shorter than LENGTH
#    LENGTH = 1
#    f = np.sum((uv_lines_filtered[:,0,:] - uv_lines_filtered[:,1,:])
#            ** 2, axis=1) ** 0.5 > LENGTH
#    uv_lines_filtered = uv_lines_filtered[f]
#
#    return uv_lines_filtered

################################################################################

# eye:                 np.array([x, y, z])
# theta:               np.array([theta_x, theta_y, theta_z]) [rad]
# BIRD:                np.array([X, Y, Z])
# ret: (eye_b, eye_r): (np.array([x', y', z']), np.shape == (3, 3))
def eye_r2eye_r_b(eye, r, BIRD):
    theta   = r2theta(r)
    eye_b   = eye + theta2r(np.array([0, theta[1], 0])) @ BIRD
    r_b     = theta2r(np.array([ pi / 2, theta[1], 0]))
    return eye_b, r_b

# uv_lines:      np.shape == (N, 2, 2)
# eye:           np.array([x, y, z])
# theta:         np.array([theta_x, theta_y, theta_z]) [rad]
# BIRD:          np.array([X, Y, Z])
# CONTEXT:
# ret: uv_lines: np.shape == (N - *, 2, 2)
#def bird_view(uv_lines, eye, r, BIRD, CONTEXT):
#    theta            = r2theta(r)
#    r_virtual        = theta2r(np.array([theta[0], 0, theta[2]]))
#    wm_lines_virtual = uv_lines2wm_lines(uv_lines, eye, r_virtual, CONTEXT)
#    eye_b            = eye + BIRD
#    r_b              = theta2r(np.array([pi / 2, 0, 0]))
#    uv_lines         = wm_lines2uv_lines(wm_lines_virtual, eye_b, r_b, CONTEXT)
#    uv_lines         = filter_uv_lines(uv_lines, CONTEXT)
#    return uv_lines

# (theta_x = 0, theta_y = *, theta_z = 0)
# uv_lines:      np.shape == (N, 2, 2)
# eye:           np.array([x, y, z])
# BIRD:          np.array([X, Y, Z])
# CONTEXT:
# ret: uv_lines: np.shape == (N - *, 2, 2)
#def bird_view_fixed(uv_lines, eye, BIRD, CONTEXT):
#    theta = np.array([0, 0, 0])
#    r = theta2r(theta)
#    return bird_view(uv_lines, eye, r, BIRD, CONTEXT)

################################################################################
# WIDTH:    int
# HEIGHT:   int
# uv_lines: np.shape == (*, 2, 2)
# ret: img: Image
def uv_lines2img(uv_lines, CONTEXT, LINE_WIDTH):
    from PIL import Image, ImageDraw
    img = Image.fromarray(np.zeros((CONTEXT['HEIGHT'], CONTEXT['WIDTH'])))
    draw = ImageDraw.Draw(img)
    for i in range(len(uv_lines)):
        uv_line = uv_lines[i]
        draw.line((*uv_line[0], *uv_line[1]), fill=255, width=LINE_WIDTH)
    return img

# fixed { ######################################################################
# eye   = np.array([0,  EYE_Y,      0])
# theta = np.array([0,      0,      0])
# BIRD  = np.array([0, BIRD_Y, BIRD_Z])

# uv_line:  np.shape == (2, 2)
# EYE_Y:    eye[1] (scalar)
# BIRD:     np.array([0, BIRD_Y, BIRD_Z])
# CONTEXT:
# ret: tv:  np.shape == (2, 2) (same as uv_lines) or None
def uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT):
    EYE = np.array([0, EYE_Y, 0])
    R   = np.eye(3)
    R_BIRD = theta2r(np.array([pi / 2, 0, 0]))
    UV_VS = get_UV_VS(CONTEXT)
    WM_V0 = uv2wm(UV_VS[0], BIRD, R_BIRD, CONTEXT)
    WM_V1 = uv2wm(UV_VS[1], BIRD, R_BIRD, CONTEXT)
    WM_EDGE0 = np.array([WM_V0, WM_V1])
    wm_line = uv_line2wm_line_fixed(uv_line, EYE_Y, CONTEXT)
    tv = wm_line2uv_line(wm_line, WM_EDGE0, BIRD, R_BIRD, CONTEXT)
    return tv

# uv_lines: np.shape == (N, 2, 2)
# EYE_Y:    eye[1] (scalar)
# BIRD:     np.array([0, BIRD_Y, BIRD_Z])
# CONTEXT:
# ret: tvs: np.shape == (N - *, 2, 2) (same as uv_lines)
def uv_lines2tvs_fixed(uv_lines, EYE_Y, BIRD, CONTEXT):
    tvs = []
    for uv_line in uv_lines:
        tv = uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)
        if not tv is None:
            tv = filter_uv_line(tv, CONTEXT)
        if not tv is None:
            tvs.append(tv)
    tvs = np.array(tvs)
    return tvs

# uv_line:          np.shape == (2, 2)
# EYE_Y:            eye[1] (scalar)
# CONTEXT:
# ret: wm_lines:    np.shape == (2, 3) or None
def uv_line2wm_line_fixed(uv_line, EYE_Y, CONTEXT):
    EYE = np.array([0, EYE_Y, 0])
    R   = np.eye(3)
    wm_line = np.array([
        uv2wm(uv_line[0], EYE, R, CONTEXT),
        uv2wm(uv_line[1], EYE, R, CONTEXT),
    ])
    return wm_line

# uv_lines:         np.shape == (N, 2, 2)
# EYE_Y:            eye[1] (scalar)
# CONTEXT:
# ret: wm_lines:    np.shape == (N - *, 2, 3)
def uv_lines2wm_lines_fixed(uv_lines, EYE_Y, CONTEXT):
    wm_lines = []
    for uv_line in uv_lines:
        wm_line = uv_line2wm_line_fixed(uv_line, EYE_Y, CONTEXT)
        if not wm_line is None:
            wm_lines.append(wm_line)
    wm_lines = np.array(wm_lines)
    return wm_lines

# vs:         np.shape == (4, N)
# ret: edges: np.shape == (4, 2, N)
# Note: N-dimensions vs to edges
def vs2edges(vs):
    edges = np.array((
        (vs[0], vs[1]),
        (vs[1], vs[2]),
        (vs[2], vs[3]),
        (vs[3], vs[0]),
    ))
    return edges

# uv_line:      np.shape == (2, 2)
# CONTEXT:
# ret: uv_line: np.shape == (2, 2) or None
def filter_uv_line(uv_line, context_or_uv_vs):
    if type(context_or_uv_vs) is type({}):
        uv_vs = get_UV_VS(context_or_uv_vs, 1)
    else:
        uv_vs = context_or_uv_vs

    uv_edges = vs2edges(uv_vs)
    return shrink_line(uv_line, uv_edges)

    #uv_edges = np.array((
    #    (uv_vs[0], uv_vs[1]),
    #    (uv_vs[1], uv_vs[2]),
    #    (uv_vs[2], uv_vs[3]),
    #    (uv_vs[3], uv_vs[0]),
    #))

    #is_insides = [
    #    is_inside(uv_line[0], CONTEXT),
    #    is_inside(uv_line[1], CONTEXT),
    #]
    #is_insides = [
    #    is_inside(uv_line[0], uv_edges),
    #    is_inside(uv_line[1], uv_edges),
    #]
    #
    #intersections = [
    #    get_intersection(uv_line, uv_edges[0]),
    #    get_intersection(uv_line, uv_edges[1]),
    #    get_intersection(uv_line, uv_edges[2]),
    #    get_intersection(uv_line, uv_edges[3]),
    #] # (4, 2)

    #uv_line_filtered = np.array(uv_line)

    ## remove rows containing an nan
    ##uv_lines_filtered = delete_nan(uv_lines_filtered)

    #true_indicies_is_insides = get_true_indicies(is_insides)
    #true_indicies_intersections = get_true_indicies(intersections)
    #if len(true_indicies_is_insides) == 2:
    #    line = uv_line_filtered
    #elif len(true_indicies_is_insides) == 1:
    #    pa = uv_line_filtered[true_indicies_is_insides[0]]
    #    #              len(true_indicies_intersections) == 1
    #    pb = intersections[true_indicies_intersections[0]]
    #    line = (pa, pb) if true_indicies_is_insides[0] == 0 else (pb, pa)
    #elif len(true_indicies_intersections) == 2: # 0 or 2
    #    pa = intersections[true_indicies_intersections[0]]
    #    pb = intersections[true_indicies_intersections[1]]
    #    distance_pa_0 = np.linalg.norm(uv_line_filtered[0] - pa)
    #    distance_pa_1 = np.linalg.norm(uv_line_filtered[1] - pa)
    #    # if distance_pa_0 <= distance_pa_1, then uv_line_filtered[0] is pa
    #    line = (pa, pb) if distance_pa_0 <= distance_pa_1 else (pb, pa)
    #else:
    #    return None
    #uv_line_filtered = np.array(line)

    ## move points out of ((0, 0), (WIDTH, HEIGHT)) to the edge
    #invalid_u_indices = uv_line_filtered[:, 0] > CONTEXT['WIDTH' ] - 1
    #invalid_j_indices = uv_line_filtered[:, 1] > CONTEXT['HEIGHT'] - 1
    #uv_line_filtered[invalid_u_indices, 0] = CONTEXT['WIDTH' ] - 1
    #uv_line_filtered[invalid_j_indices, 1] = CONTEXT['HEIGHT'] - 1
    ##return uv_line_filtered

    ## reject short line
    #if np.linalg.norm(uv_line_filtered[1] - uv_line_filtered[0]) < 1:
    #    return None

    #return uv_line_filtered

def shrink_line(line, edges):
    is_insides    = [is_inside(p, edges) for p in line ]
    intersections = [get_intersection(line, edge) for edge in edges]

    if is_insides[0] and is_insides[1]:
        pass
    elif (not is_insides[0]) and (not is_insides[1]):
        indicies = get_true_indicies(intersections)
        if not len(indicies) == 2:
            return None
        p0 = line[0]
        i0 = intersections[indicies[0]]
        i1 = intersections[indicies[1]]
        d_p0_i0 = np.linalg.norm(i0 - p0)
        d_p0_i1 = np.linalg.norm(i1 - p0)
        line = np.array([i0, i1] if d_p0_i0 < d_p0_i1 else [i1, i0])
    elif is_insides[0] or is_insides[1]:
        try:
             index_intersection = get_true_indicies(intersections)[0] # 0 - 3
             index_inside = get_true_indicies(is_insides)[0]          # 0 or 1
        except IndexError:
            return None
        p0 = line[index_inside]
        p1 = intersections[index_intersection]
        line = np.array((p0, p1) if index_inside == 0 else (p1, p0))

    # reject short line
    if np.linalg.norm(line[1] - line[0]) < 1:
        return None

    return line

# uv_line:      np.shape == (2, 2)
# CONTEXT:
# ret: uv_line: np.shape == (2, 2) or None
def filter_uv_line_pretv_fixed(uv_line, CONTEXT):
    THRE   = HEIGHT / 2 + HEIGHT / 100 * 5
    uv_vs = get_UV_VS(CONTEXT, 1)
    uv_vs[2][1] = THRE
    uv_vs[3][1] = THRE
    uv_edges = vs2edges(uv_vs)
    return shrink_line(uv_line, uv_edges)

    #HEIGHT = CONTEXT['HEIGHT']
    #THRE   = HEIGHT / 2 + HEIGHT / 100 * 5
    ##return None if np.any(uv_line[:,1] < THRE) else uv_line
    #u0, v0 = uv_line[0]
    #u1, v1 = uv_line[1]
    #if   v0 < THRE and v1 < THRE:
    #    return None
    #elif v0 > THRE and v1 > THRE:
    #    return uv_line
    ## calculate intersection of 'uv_line' and 'v = THRE'
    ## v = a * u + b
    #lower, upper = (0, 1) if v0 > v1 else (1, 0)
    #du = u1 - u0
    #dv = v1 - v0
    #try:
    #    a = dv / du
    #except FloatingPointError:
    #    # uv_line is neary vertical
    #    uv_line_filtered = np.array([uv_line[lower], (uv_line[upper][0], THRE)])
    #    return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]
    #b = v0 - a * u0
    #try:
    #    upper_u = (THRE - b) / a
    #except FloatingPointError:
    #    # uv_line is neary horizontal
    #    uv_line_filtered = np.array([uv_line[lower], (uv_line[upper][0], THRE)])
    #    return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]
    #uv_line_filtered = np.array([uv_line[lower], (upper_u, THRE)])
    #return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]

def filter_uv_lines_pretv_fixed(uv_lines, CONTEXT):
    uv_lines_filtered = []
    for uv_line in uv_lines:
        uv_line_filtered = filter_uv_line_pretv_fixed(uv_line, CONTEXT)
        if not uv_line is None:
            uv_lines_filtered.append(uv_line_filtered)
    uv_lines_filtered = np.array(uv_lines_filtered)
    return uv_lines_filtered

def get_wm_vs_infinity(eye, r, CONTEXT, length):
    uv_vs = get_UV_VS(CONTEXT)
    uv_vs[2][1] = uv_vs[0][1] / 4 * 3
    uv_vs[3][1] = uv_vs[0][1] / 4 * 3
    wm_vs = np.array([uv2wm(uv, eye, r, CONTEXT) for uv in uv_vs])
    n03 = line2n((wm_vs[0], wm_vs[3]))
    n12 = line2n((wm_vs[1], wm_vs[2]))
    wm_vs[3] = wm_vs[0] + n03 * length
    wm_vs[2] = wm_vs[1] + n12 * length
    return wm_vs

def wm_line2uv_line_fixed(wm_line, eye, r, CONTEXT, edgenn):
    # todo
    uv_line_filtered = filter_uv_line(uv_line, CONTEXT)

def wm_lines2uv_lines_fixed(wm_lines, eye, r, CONTEXT):
    wm_vs = get_wm_vs_infinity(eye, r, CONTEXT, 1)
    edgenn = (
        np.array([wm_vs[0], wm_vs[1]]),
        line2n((wm_vs[0], wm_vs[3])),
        line2n((wm_vs[1], wm_vs[2])),
    )

    uv_lines = []
    for wm_line in wm_lines:
        uv_line = wm_line2uv_line_fixed(wm_line, eye, r, CONTEXT, edgenn)
        if not uv_line is None:
            uv_lines.append(uv_line)
    uv_lines = np.array(uv_lines)
    return uv_lines
# fixed } ######################################################################

def wm_line2cm_line(wm_line, eye, r):
    return np.array([w2c(wm, eye, r) for wm in wm_line])

def wm_lines2cm_lines(wm_lines, eye, r):
    return np.array([wm_line2cm_line(wm_line, eye, r) for wm_line in wm_lines])

