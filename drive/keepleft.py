import numpy as np
import math

"""
                Z
              0 ^
                |
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
		XRNG_SPTH = 0,            # START PIXEL OF VALID XRANGE [px]
		XRNG_EPTH = 640,          # END   PIXEL OF VALID XRANGE [px] (0-640px)
		ZRNG_SPTH = 0,            # START PIXEL OF VALID YRANGE [px]
		ZRNG_EPTH = 480,          # END   PIXEL OF VALID YRANGE [px] (0-480px)
		LLEN_PTH  = 0,            # LENGTH      OF VALID LINE   [px]
		# }

		# Tolerance {
		ANG_LTL = 60 * np.pi/180, # LOOSE TOLERANCE OF EQAUL ANGLE  [radian]
		ANG_TTL = 5  * np.pi/180,  # TIGHT TOLERANCE OF EQAUL ANGLE  [radian]
		PLD_PTL = (500 ** 2) * 3, # TOLERANCE OF PAIR LINE DISTANCE [px] (500)
		# }
		):

		# initialinze fixed param
		self.__fixed_param = {
			'WIDTH':     WIDTH,
			'HEIGHT':    HEIGHT,
			'XRNG_SPTH': XRNG_SPTH,
			'XRNG_EPTH': XRNG_EPTH,
			'ZRNG_SPTH': ZRNG_SPTH,
			'ZRNG_EPTH': ZRNG_EPTH,
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
		ilines, olines = self.tvlines2iolines(tv_lines)
		pairs          = self.detect_pair(ilines, olines)
		left_line      = self.detect_leftline(pairs)
		diff_ang       = self.decide_dang(left_line)
		return diff_ang
	# } keep left

	# topview lines to in/out lines {
	# in:  topview lines (numpy (N, 5))
	# out: inlines, outlines (numpy (I, 3, 2), (O, 3, 2))
	# output matrix [[sx, sz], [ex, ez], [length, angle], ...]
	def tvlines2iolines(self, tv_lines):
		if len(tv_lines) == 0: # if tv_lines is empty matrix
			return np.array([]), np.array([])

		WIDTH     = self.__fixed_param['WIDTH']
		HEIGHT    = self.__fixed_param['HEIGHT']
		XRNG_SPTH = self.__fixed_param['XRNG_SPTH']
		XRNG_EPTH = self.__fixed_param['XRNG_EPTH']
		ZRNG_SPTH = self.__fixed_param['ZRNG_SPTH']
		ZRNG_EPTH = self.__fixed_param['ZRNG_EPTH']
		LLEN_PTH  = self.__fixed_param['LLEN_PTH']
		ANG_TTL   = self.__fixed_param['ANG_TTL']

		ilines = []
		olines = []
		for tv in tv_lines:
			x1, x2 = WIDTH-tv[0,0], WIDTH-tv[1,0]
			if not (XRNG_SPTH <= x1 <= XRNG_EPTH and XRNG_SPTH <= x2 <= XRNG_EPTH): # xrange threshold
				continue
			z1, z2 = HEIGHT-tv[0,1], HEIGHT-tv[1,1]
			if not (ZRNG_SPTH <= z1 <= ZRNG_EPTH and ZRNG_SPTH <= z2 <= ZRNG_EPTH): # zrange threshold
				continue

			length = (x1-x2)**2 + (z1-z2)**2
			if (length < LLEN_PTH): # line length threshold [px]
				continue

			angle = math.atan2(z2-z1, x2-x1)

			# classify angle as up(b|w)->out or dn(w|b)->in
			# angle threshold
			if ANG_TTL < angle < np.pi-ANG_TTL:
				olines.append([[x1, z1], [x2, z2], [length, angle]])
			elif -np.pi+ANG_TTL < angle < -ANG_TTL:
				ilines.append([[x1, z1], [x2, z2], [length, angle]])
			else:
				pass

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

		diff_ang = -np.pi / 2 - left_line[2,1]
		return diff_ang
