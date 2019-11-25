onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pspl_comm_opt

do {wave.do}

view wave
view structure
view signals

do {pspl_comm.udo}

run -all

quit -force
