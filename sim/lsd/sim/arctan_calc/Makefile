XILINX_LIB_PATH=${XILINX}/verilog/src

SHM_FILE = sim_arctan_calc.v

V_FILE = \
../../common/arctan_calc.v \
../../common/delay.v \

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
