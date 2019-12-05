#!/usr/bin/python3
import numpy as np
import cv2

import mlsd as lsd
from line import *

def main():
	argv = sys.argv
	if len(argv) == 2:
		img_in = cv2.imread(argv[1])
	else:
		img_in = cv2.imread('img/sample.jpg')

	img_gry = lsd.rgb_to_ycbcr(img_in)[:,:,0]
	res = lsd.apply_simple_lsd(img_gry, GUI)
	print(res)
	exit()
	#uv_line = np.array([
	#										self.__so.get_lsd_line_start_h(0, i),
	#										self.__so.get_lsd_line_start_v(0, i),
	#										self.__so.get_lsd_line_end_h(0, i),
	#										self.__so.get_lsd_line_end_v(0, i)
	#									]).reshape(2,2)
	#tv = fixed.uv_line2tv_fixed(uv_line, EYE_Y, BIRD, CONTEXT)

	keepleft = KeepLeft()

	s = time.time()
	dang = keepleft.keep_left(res, img_in)
	print('left line detection: ', time.time()-s, '[s]')

if __name__ == '__main__':
	main()
