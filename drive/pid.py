import time

class PID:
	def __init__(self, Kp, Ki, Kd, B):
		self.__kp = Kp
		self.__ki = Ki
		self.__kd = Kd
		self.__b  = B

		self.__tpre = time.time()
		self.__epre = 0
		self.__esum = 0

	def pid(self, R, yt):
		dt = time.time() - self.__tpre

		e = R - yt

		if -1.0e+300 < self.__esum + e < 1.0e+300:
			self.__esum += e

		p = self.__kp * e
		i = self.__ki * self.__esum
		d = self.__kd * (e - self.__epre) / dt

		u = p + i + d + self.__b

		self.__tpre = time.time()
		self.__epre = e
		return u
