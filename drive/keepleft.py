import numpy as np
import math

"""
image axis
 O------------> U [0,640]
 |
 |
 |
 |
 |
 |
 V
[0,480]

vehicle axis
                Z
              0 ^
                |
                |
                |
                |
   90           |
 X <------------O
"""

class KeepLeft():
	# initilize {
	def __init__(self, 
		# Flags {
		# }

		# Thresholds {
		WIDTH     = 640,          # IMAGE WIDTH                 [px]
		HEIGHT    = 480,          # IMAGE HEIGHT                [px]
		URNG_SPTH = 0,            # START PIXEL OF VALID URANGE [px]
		URNG_EPTH = 640,          # END   PIXEL OF VALID URANGE [px] (0-640px)
		VRNG_SPTH = 0,            # START PIXEL OF VALID VRANGE [px]
		VRNG_EPTH = 480,          # END   PIXEL OF VALID VRANGE [px] (0-480px)
		LLEN_PTH  = 10000000,     # LENGTH      OF VALID LINE   [px]
		# }

		# Tolerance {
		ANG_LTL = np.pi * 60/180, # LOOSE TOLERANCE OF EQAUL ANGLE  [radian]
		ANG_TTL = np.pi * 5/180,  # TIGHT TOLERANCE OF EQAUL ANGLE  [radian]
		PLD_PTL = (500 ** 2) * 3, # TOLERANCE OF PAIR LINE DISTANCE [px] (500)
		# }
		):

		# initialinze fixed param
		self.__fixed_param = {
			'WIDTH':     WIDTH,
			'HEIGHT':    HEIGHT,
			'URNG_SPTH': URNG_SPTH,
			'URNG_EPTH': URNG_EPTH,
			'VRNG_SPTH': VRNG_SPTH,
			'VRNG_EPTH': VRNG_EPTH,
			'LLEN_PTH':  LLEN_PTH,
			'ANG_LTL':   ANG_LTL,
			'ANG_TTL':   ANG_TTL,
			'PLD_PTL':   PLD_PTL,
		}
		pass
	# } initilize

	# keep left {
	# in:  topview lines (numpy (N, 5))
	# out: diff angle [rad] between straight line and left line
	def keep_left(self, tv_lines):
		if len(tv_lines) == 0: # if tv_lines is empty matrix
			return 0
		
		print(np.shape(tv_lines), end='')
		ilines, olines = self.tvlines2iolines(tv_lines)
		print(np.shape(ilines), np.shape(olines), end='')
		pairs          = self.detect_pair(ilines, olines)
		print(np.shape(pairs), end='')
		left_line      = self.detect_leftline(pairs)
		print(np.shape(left_line))
		diff_ang       = self.decide_dang(left_line)

		return diff_ang
	# } keep left

	# topview lines to in/out lines {
	# in:  topview lines (numpy (N, 5))
	# out: inlines, outlines (numpy (I, 3, 2), (O, 3, 2))
	# output matrix [[su, sv], [eu, ev], [length, angle], ...]
	def tvlines2iolines(self, tv_lines):
		WIDTH     = self.__fixed_param['WIDTH']
		HEIGHT    = self.__fixed_param['HEIGHT']
		URNG_SPTH = self.__fixed_param['URNG_SPTH']
		URNG_EPTH = self.__fixed_param['URNG_EPTH']
		VRNG_SPTH = self.__fixed_param['VRNG_SPTH']
		VRNG_EPTH = self.__fixed_param['VRNG_EPTH']
		LLEN_PTH  = self.__fixed_param['LLEN_PTH']
		ANG_TTL   = self.__fixed_param['ANG_TTL']

		ilines = []
		olines = []
		for tv in tv_lines:
			u1, u2 = WIDTH-tv[0], WIDTH-tv[2]
			if URNG_SPTH < u1 < URNG_EPTH and URNG_SPTH < u2 < URNG_EPTH: # urange threshold
				continue
			v1, v2 = HEIGHT-tv[1], HEIGHT-tv[3]
			if VRNG_SPTH < v1 < VRNG_EPTH and VRNG_SPTH < v2 < VRNG_EPTH: # vrange threshold
				continue
		
			length = (u1-u2)**2 + (v1-v2)**2
			if (length < LLEN_PTH): # line length threshold [px]
				continue
		
			angle = math.atan2(v2-v1, u2-u1)

			# classify angle as up(b|w)->out or dn(w|b)->in
			# angle threshold
			if ANG_TTL < angle < np.pi-ANG_TTL:
				olines.append([[u1, v1], [u2, v2], [length, angle]])
			elif -np.pi+ANG_TTL < angle < -ANG_TTL:
				ilines.append([[u1, v1], [u2, v2], [length, angle]])
		
		return np.array(ilines), np.array(olines)
	# } tvlines2iolines

	# detect pairs of in/out line {
	# in  :
	# out :
	def detect_pair(self, ilines, olines):
		if len(ilines) == 0 or len(olines) == 0:
			return np.array([])

		ANG_LTL = self.__fixed_param['ANG_LTL']
		PLD_PTL = self.__fixed_param['PLD_PTL']

		pair_lines = []
		for i in ilines:
			dv = []
			for j, o in enumerate(olines):
				if np.pi-ANG_LTL < o[2,1]-i[2,1] < np.pi+ANG_LTL:
					oci = np.cross(o[0] - i[0], i[1] - i[0])
					ico = np.cross(i[0] - o[0], o[1] - o[0])
					if oci > 0 and ico > 0:
						distance = np.sum(
							(i[0] - o[1]) ** 2 +
							(i[1] - o[0]) ** 2 +
							((i[1]+i[0] - o[1]-o[0])/2) ** 2)
						volume = oci + ico
						if distance < PLD_PTL:
							dv.append([j, distance, volume])
		
			if(len(dv) != 0):
				dv = np.array(dv)
				p = olines[int(dv[
					np.argmin(np.argsort(np.argsort(dv[:,1]))*0.777 + 
					np.argsort(np.argsort(dv[:,2]))*0.222
					),0])]
				pair_lines.append(np.array([i, p]))
		
		return np.array(pair_lines)

	# detect leftline {
	def detect_leftline(self, pair_lines):
		if len(pair_lines) == 0:
			return np.array([])

		len_max = np.argmax(pair_lines[:,0,2,0])
		return pair_lines[len_max, 0]
	# } detect_leftline

	# calculate diff angle [rad] between straight and left angle
	def decide_dang(self, left_line):
		if len(left_line) == 0:
			return 0

		diff_ang = np.pi / 2 - left_line[2,1]
		return diff_ang
