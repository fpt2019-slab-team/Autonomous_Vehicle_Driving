# coding:utf-8
from ctypes import *
import time

# load C library
clib = cdll.LoadLibrary("./clib.so")

# setting type of args and return value in the library functions 
# uio and device mapping
clib.open_uio.argtypes = None
clib.open_uio.restype  = c_int
clib.mapping_device.argtypes = None
clib.mapping_device.restype  = c_int
clib.close_uio.argtypes = None
clib.close_uio.restype  = None
# ps pl communicatin
clib.led.argtypes = [c_uint32]
clib.led.restype  = None
clib.get_frame.argtypes = [c_char_p] 
clib.get_frame.restype  = c_int

# main
clib.open_uio()
clib.mapping_device()
filename = bytes(b'image.pgm') # transform <string> to <bytes>
start = time.time()
clib.get_frame(filename)
end = time.time()
print ("%f[s]" %(end - start))
clib.close_uio()
