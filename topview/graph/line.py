#!/usr/bin/python3

import numpy as np
from math import sin, cos, tan, pi, sqrt, asin, acos, atan2

################################################################################
# wm_*: a point located on the map              in the world  coordinate
# wf_*: a point located on the forcused surface in the world  coordinate
# cm_*: a point located on the map              in the camera coordinate
# cf_*: a point located on the forcused surface in the camera coordinate
################################################################################
# *_line: a pair of points
################################################################################

################################################################################
# line:   np.shape == (2, N) (2 points on N-dimentions space)
# ret: n: np.shape == (N,)   (unit vector of line)
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
# [ cos(theta[1]), sin(theta[1]) * sin(theta[0]), sin(theta[1]) * cos(theta[0])]
# [           0  ,                 cos(theta[0]),                -sin(theta[0])]
# [-sin(theta[1]), cos(theta[1]) * sin(theta[0]), cos(theta[1]) * cos(theta[0])]
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
    r = np.linalg.multi_dot((r_y, r_x))
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
# w:    np.array([x, y, z])
# c:    np.array([x, y, z])
# eye:  np.array([x, y, z])
# r:    np.shape == (3, 3)

def w2c(w, eye, r):
    c = np.dot(np.linalg.inv(r), (w - eye))
    return c

def c2w(c, eye, r):
    w = np.dot(r, c) + eye
    return w

################################################################################
# uv:       (float, float)
# cf:       np.array([float, F, float])
# CONTEXT:

def cf2uv(cf, CONTEXT):
    x = cf[0]
    y = cf[1]
    u = CONTEXT['WIDTH']  / 2 - x * CONTEXT['SCALE']
    v = CONTEXT['HEIGHT'] / 2 - y * CONTEXT['SCALE']
    uv = np.array([u, v])
    return uv

def uv2cf(uv, CONTEXT):
    u = uv[0]
    v = uv[1]
    x = (CONTEXT['WIDTH']  / 2 - u) / CONTEXT['SCALE']
    y = (CONTEXT['HEIGHT'] / 2 - v) / CONTEXT['SCALE']
    cf = np.array([x, y, CONTEXT['F']])
    return cf

################################################################################
# wm:       np.array([x, 0, z])
# uv:       (float, float)
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:

def wm2uv(wm, eye, r, CONTEXT):
    #print('wm: ', wm.astype(int))
    cm = w2c(wm, eye, r)
    #print('cm: ', cm.astype(int))
    cf = cm2cf(cm, CONTEXT)
    #print('cf: ', cf.astype(int))
    uv = cf2uv(cf, CONTEXT)
    #print('uv: ', uv.astype(int))
    return uv

def uv2wm(uv, eye, r, CONTEXT):
    cf = uv2cf(uv, CONTEXT)
    wf = c2w(cf, eye, r)
    wm = wf2wm(wf, eye, r)
    return wm
    # uv, cf, wf, wm

################################################################################
# cm:       np.array([x, y, z])
# cf:       np.array([x, y, F])
# CONTEXT:

def cm2cf(cm, CONTEXT):
    x = CONTEXT['F'] / cm[2] * cm[0]
    y = CONTEXT['F'] / cm[2] * cm[1]
    cf = np.array([x, y, CONTEXT['F']])
    return cf

def cf2cm(cf, eye, r):
    wf = c2w(cf, eye, r)
    wm = wf2wm(wf, eye, r)
    cm = w2c(wm, eye, r)
    return cm

################################################################################
# wm:   np.array([x, 0, z])
# wf:   np.array([x, y, z])
# eye:  np.array([x, y, z])
# r:    np.shape == (3, 3)

def wm2wf(wm, eye, r, CONTEXT):
    cm = w2c(wm, eye, r)
    cf = cm2cf(cm, CONTEXT['F'])
    wf = c2w(cf, eye, r)
    return wf

def wf2wm(wf, eye, r):
    n = wf - eye
    try:
        x = -eye[1] / n[1] * n[0] + eye[0]
    except FloatingPointError:
        x = 10**10
    try:
        z = -eye[1] / n[1] * n[2] + eye[2]
    except FloatingPointError:
        z = 10**10
    wm = np.array([x, 0, z])
    return wm

################################################################################
# wm_line:  np.array([(x, 0, z), (x, 0, z)])
# uv_line:  np.array([(u, v), (u, v)]) or None (behind of camera and parallel)
# wm_edge0: np.array([(x, 0, z), (x, 0, z)])
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:

def wm_line2uv_line(wm_line, wm_edge0, eye, r, CONTEXT):
    uv_line = [] # (2, 2)
    for wm in wm_line: # (2,)
        cm = w2c(wm, eye, r)
        if cm[2] < CONTEXT['F']: # behind of camera
            edge = np.array((
                (wm_edge0[0][0], wm_edge0[0][2]),
                (wm_edge0[1][0], wm_edge0[1][2]),
            ))
            line = np.array((
                ( wm_line[0][0],  wm_line[0][2]),
                ( wm_line[1][0],  wm_line[1][2]),
            ))
            # y = a * x + b
            if abs(np.dot(line2n(edge), line2n(line))) > 0.9:
                return None # edge and line are parallel
            try:
                edge_a = (edge[1][1] - edge[0][1]) / (edge[1][0] - edge[0][0])
                line_a = (line[1][1] - line[0][1]) / (line[1][0] - line[0][0])
                edge_b = edge[0][1] - edge_a * edge[0][0]
                line_b = line[0][1] - line_a * line[0][0]
                x = (line_b - edge_b) / (edge_a - line_a)
                z = edge_a * x + edge_b
                wm = np.array((x, 0, z))
            except FloatingPointError:
                return None
        uv = wm2uv(wm, eye, r, CONTEXT) # (2,)
        uv_line.append(uv)
    uv_line = np.array(uv_line)

    if np.linalg.norm(uv_line[0] - uv_line[1]) < CONTEXT['WIDTH'] * 0.0001:
        return None # both points are behind of camera

    return uv_line

def uv_line2wm_line(uv_line, eye, r, CONTEXT):
    wm_line = []
    for uv in uv_line:
        wm = uv2wm(uv, eye, r, CONTEXT)
        wm_line.append(wm)
    return np.array(wm_line)

################################################################################
# wm_lines: np.array([([x, 0, z], [x, 0, z]), ...]), np.shape == (293,2,3)
# uv_lines: np.array([([u, v], [u, v]), ...]), np.shape == (293 - *, 2, 2) or
#           None if no lines are projected to F
# eye:      np.array([x, y, z])
# r:        np.shape == (3, 3)
# CONTEXT:

def wm_lines2uv_lines(WM_LINES, eye, r, CONTEXT):
    UV_VS = get_UV_VS(CONTEXT)

    wm_vs = [] # 4 verticies of projected region on map
    for uv in UV_VS:
        wm_v = uv2wm(uv, eye, r, CONTEXT)
        wm_vs.append(wm_v)
    wm_vs = np.array(wm_vs)

    wm_edge0 = np.array((wm_vs[0], wm_vs[1]))

    uv_lines = [] # (293 - *, 2, 2) (*: behind of camera and parallel)
    for wm_line in WM_LINES: # (2, 3)
        uv_line = wm_line2uv_line(
                wm_line, wm_edge0, eye, r, CONTEXT)
        if not uv_line is None:
            uv_lines.append(uv_line)
    uv_lines = np.array(uv_lines)

    uv_lines = filter_uv_lines(uv_lines, CONTEXT)

    return uv_lines

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
# IMG_MAP:       np.shape == (*, *) (must be grayscale, use cv2.imread())
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
# uv:       (float, float)
# CONTEXT:
# ret:      bool
def is_inside(uv, CONTEXT):
    u, v = uv
    return 0 <= u <= CONTEXT['WIDTH'] - 1 and 0 <= v <= CONTEXT['HEIGHT'] - 1

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
# array:        iterable
# ret: indicies: [bool, ...] (evaluate array elements as bool)
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
def get_UV_VS(CONTEXT):
    UV_VS = np.array((
        (                   0, CONTEXT['HEIGHT'] - 1),
        (CONTEXT['WIDTH'] - 1, CONTEXT['HEIGHT'] - 1),
        (CONTEXT['WIDTH'] - 1,                     0),
        (                   0,                     0),
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
def filter_uv_lines(uv_lines, CONTEXT):
    UV_VS = get_UV_VS(CONTEXT)

    if len(uv_lines) == 0:
        return np.array([])

    is_insides = [] # (293 - *, 2)
    for uv_line in uv_lines:
        is_insides.append([
            is_inside(uv_line[0], CONTEXT),
            is_inside(uv_line[1], CONTEXT),
        ])

    uv_edges = np.array((
        (UV_VS[0], UV_VS[1]),
        (UV_VS[1], UV_VS[2]),
        (UV_VS[2], UV_VS[3]),
        (UV_VS[3], UV_VS[0]),
    ))

    intersections = [] # (293 - *, 4, 2)
    for uv_line in uv_lines:
        intersections.append([
            get_intersection(uv_line, uv_edges[0]),
            get_intersection(uv_line, uv_edges[1]),
            get_intersection(uv_line, uv_edges[2]),
            get_intersection(uv_line, uv_edges[3]),
        ])

    uv_lines_filtered = np.array(uv_lines)

    # remove rows containing an nan
    uv_lines_filtered = delete_nan(uv_lines_filtered)

    # remove lines out of view
    uv_lines_filtered_tmp = []
    for i in range(len(uv_lines_filtered)):
        true_indicies_is_inside = get_true_indicies(is_insides[i])
        true_indicies_intersection = get_true_indicies(intersections[i])
        if len(true_indicies_is_inside) == 2:
            line = uv_lines_filtered[i]
        elif len(true_indicies_is_inside) == 1:
            # len(true_indicies_intersection) == 1
            pa = uv_lines_filtered[i][true_indicies_is_inside[0]]
            pb = intersections[i][true_indicies_intersection[0]]
            line = (pa, pb) if true_indicies_is_inside[0] == 0 else (pb, pa)
        elif len(true_indicies_intersection) == 2: # 0 or 2
            pa = intersections[i][true_indicies_intersection[0]]
            pb = intersections[i][true_indicies_intersection[1]]
            norm_pa_0 = np.linalg.norm(uv_lines_filtered[i][0] - pa)
            norm_pa_1 = np.linalg.norm(uv_lines_filtered[i][1] - pa)
            line = (pa, pb) if norm_pa_0 <= norm_pa_1 else (pb, pa)
        else:
            continue
        uv_lines_filtered_tmp.append(line)
    uv_lines_filtered = np.array(uv_lines_filtered_tmp) # (293 - * - *, 2, 2)

    if len(uv_lines_filtered) == 0:
        return uv_lines_filtered

    # remove points out of ((0, 0), (WIDTH, HEIGHT))
    invalid_u_indices = uv_lines_filtered[:, :, 0] > CONTEXT['WIDTH']  - 1
    invalid_j_indices = uv_lines_filtered[:, :, 1] > CONTEXT['HEIGHT'] - 1
    uv_lines_filtered[invalid_u_indices, 0] = CONTEXT['WIDTH']  - 1
    uv_lines_filtered[invalid_j_indices, 1] = CONTEXT['HEIGHT'] - 1

    # remove lines shorter than LENGTH
    LENGTH = 1
    f = np.sum((uv_lines_filtered[:,0,:] - uv_lines_filtered[:,1,:])
            ** 2, axis=1) ** 0.5 > LENGTH
    uv_lines_filtered = uv_lines_filtered[f]

    return uv_lines_filtered

################################################################################

# eye:                 np.array([x, y, z])
# theta:               np.array([theta_x, theta_y, theta_z]) [rad]
# BIRD:                np.array([X, Y, Z])
# ret: (eye_b, eye_r): (np.array([x', y', z']), np.shape == (3, 3))
def eye_r2eye_r_b(eye, r, BIRD):
    theta = r2theta(r)
    r_deye  = theta2r(np.array([0, theta[1], 0]))
    deye    = np.dot(r_deye, BIRD)
    eye_b   = eye + deye
    theta_b = np.array([pi / 2, theta[1], 0])
    r_b     = theta2r(theta_b)
    return eye_b, r_b

# uv_lines:      np.shape == (N, 2, 2)
# eye:           np.array([x, y, z])
# theta:         np.array([theta_x, theta_y, theta_z]) [rad]
# BIRD:          np.array([X, Y, Z])
# CONTEXT:
# ret: uv_lines: np.shape == (N - *, 2, 2)
def bird_view(uv_lines, eye, r, BIRD, CONTEXT):
    theta            = r2theta(r)
    r_virtual        = theta2r(np.array([theta[0], 0, theta[2]]))
    wm_lines_virtual = uv_lines2wm_lines(uv_lines, eye, r_virtual, CONTEXT)
    eye_b            = eye + BIRD
    r_b              = theta2r(np.array([pi / 2, 0, 0]))
    uv_lines         = wm_lines2uv_lines(wm_lines_virtual, eye_b, r_b, CONTEXT)
    uv_lines         = filter_uv_lines(uv_lines, CONTEXT)
    return uv_lines

# (theta_x = 0, theta_y = *, theta_z = 0)
# uv_lines:      np.shape == (N, 2, 2)
# eye:           np.array([x, y, z])
# BIRD:          np.array([X, Y, Z])
# CONTEXT:
# ret: uv_lines: np.shape == (N - *, 2, 2)
def bird_view_fixed(uv_lines, eye, BIRD, CONTEXT):
    theta = np.array([0, 0, 0])
    r = theta2r(theta)
    return bird_view(uv_lines, eye, r, BIRD, CONTEXT)

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

# uv_line:      np.shape == (2, 2)
# CONTEXT:
# ret: uv_line: np.shape == (2, 2)
def filter_uv_line(uv_line, CONTEXT):
    UV_VS = get_UV_VS(CONTEXT)

    UV_EDGES = np.array((
        (UV_VS[0], UV_VS[1]),
        (UV_VS[1], UV_VS[2]),
        (UV_VS[2], UV_VS[3]),
        (UV_VS[3], UV_VS[0]),
    ))

    is_insides = [
        is_inside(uv_line[0], CONTEXT),
        is_inside(uv_line[1], CONTEXT),
    ]

    intersections = [
        get_intersection(uv_line, UV_EDGES[0]),
        get_intersection(uv_line, UV_EDGES[1]),
        get_intersection(uv_line, UV_EDGES[2]),
        get_intersection(uv_line, UV_EDGES[3]),
    ] # (4, 2)

    uv_line_filtered = np.array(uv_line)

    # remove rows containing an nan
    #uv_lines_filtered = delete_nan(uv_lines_filtered)

    true_indicies_is_insides = get_true_indicies(is_insides)
    true_indicies_intersections = get_true_indicies(intersections)
    if len(true_indicies_is_insides) == 2:
        line = uv_line_filtered
    elif len(true_indicies_is_insides) == 1:
        pa = uv_line_filtered[true_indicies_is_insides[0]]
        #              len(true_indicies_intersections) == 1
        pb = intersections[true_indicies_intersections[0]]
        line = (pa, pb) if true_indicies_is_insides[0] == 0 else (pb, pa)
    elif len(true_indicies_intersections) == 2: # 0 or 2
        pa = intersections[true_indicies_intersections[0]]
        pb = intersections[true_indicies_intersections[1]]
        distance_pa_0 = np.linalg.norm(uv_line_filtered[0] - pa)
        distance_pa_1 = np.linalg.norm(uv_line_filtered[1] - pa)
        # if distance_pa_0 <= distance_pa_1, then uv_line_filtered[0] is pa
        line = (pa, pb) if distance_pa_0 <= distance_pa_1 else (pb, pa)
    else:
        return None
    uv_line_filtered = np.array(line)

    # move points out of ((0, 0), (WIDTH, HEIGHT)) to the edge
    invalid_u_indices = uv_line_filtered[:, 0] > CONTEXT['WIDTH' ] - 1
    invalid_j_indices = uv_line_filtered[:, 1] > CONTEXT['HEIGHT'] - 1
    uv_line_filtered[invalid_u_indices, 0] = CONTEXT['WIDTH' ] - 1
    uv_line_filtered[invalid_j_indices, 1] = CONTEXT['HEIGHT'] - 1
    #return uv_line_filtered

    # reject short line
    if np.linalg.norm(uv_line_filtered[1] - uv_line_filtered[0]) < 1:
        return None

    return uv_line_filtered

# uv_line:      np.shape == (2, 2)
# CONTEXT:
# ret: uv_line: np.shape == (2, 2) or None
def filter_uv_line_pretv_fixed(uv_line, CONTEXT):
    HEIGHT = CONTEXT['HEIGHT']
    THRE   = HEIGHT / 2 + HEIGHT / 100 * 5
    return None if np.any(uv_line[:,1] < THRE) else uv_line
    u0, v0 = uv_line[0]
    u1, v1 = uv_line[1]
    if   v0 < THRE and v1 < THRE:
        return None
    elif v0 > THRE and v1 > THRE:
        return uv_line
    # calculate intersection of 'uv_line' and 'v = THRE'
    # v = a * u + b
    lower, upper = (0, 1) if v0 > v1 else (1, 0)
    du = u1 - u0
    dv = v1 - v0
    try:
        a = dv / du
    except FloatingPointError:
        # uv_line is neary vertical
        uv_line_filtered = np.array([uv_line[lower], (uv_line[upper][0], THRE)])
        return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]
    b = v0 - a * u0
    try:
        upper_u = (THRE - b) / a
    except FloatingPointError:
        # uv_line is neary horizontal
        uv_line_filtered = np.array([uv_line[lower], (uv_line[upper][0], THRE)])
        return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]
    uv_line_filtered = np.array([uv_line[lower], (upper_u, THRE)])
    return uv_line_filtered if lower == 0 else uv_line_filtered[::-1]

def filter_uv_lines_pretv_fixed(uv_lines, CONTEXT):
    uv_lines_filtered = []
    for uv_line in uv_lines:
        uv_line_filtered = filter_uv_line_pretv_fixed(uv_line, CONTEXT)
        if not uv_line is None:
            uv_lines_filtered.append(uv_line_filtered)
    uv_lines_filtered = np.array(uv_lines_filtered)
    return uv_lines_filtered

# fixed } ######################################################################

