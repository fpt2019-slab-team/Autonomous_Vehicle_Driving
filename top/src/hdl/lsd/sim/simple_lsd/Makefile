XILINX_LIB_PATH=${XILINX}/verilog/src

SHM_FILE = sim_simple_lsd.v

V_FILE = \
../../simple_lsd.v \
../../gaussian.v \
../../common/coord_adjuster.v \
../../common/delay.v \
../../common/fifo_dc.v \
../../common/ram_sc.v \
../../common/ram_dc.v \
../../common/rgb2ycbcr.v \
../../common/stream_patch.v \
../../common/tree_adder.v \
../../common/arctan_calc.v

OPT = +access+r +nowarn+NONPRT +libext+.v \

.PHONY: all clean sim

all: sim

sim: 
	xmverilog ${OPT} ${SHM_FILE}  ${V_FILE}

clean:
	rm -rf result.shm *.log xmverilog.* INCA_libs verilog.dump .simvision
	find . -name '*~' | xargs rm -rf
	find . -name '*\#' | xargs rm -rf
	find . -name '*xmverilog.log' | xargs rm -rf
	find . -name '*.shm*' | xargs rm -rf
	find . -name '*INCA_libs*' | xargs rm -rf
