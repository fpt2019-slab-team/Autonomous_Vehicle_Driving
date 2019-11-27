SIM    ?= sim_testset.sv
SRCDIR ?= ../src/hdl/motor
TARGET ?= $(SRCDIR)/testset.sv $(SRCDIR)/pbsbf4_Top.v $(SRCDIR)/pbsbf4_renew.v $(SRCDIR)/pbsbf4.v \
					$(SRCDIR)/clock_gen.v $(SRCDIR)/apamod.sv $(SRCDIR)/fbmod_v1.1.v $(SRCDIR)/hoge.sv $(SRCDIR)/pwm14.sv 
OPT    ?= -y ${XILINX_VIVADO}/data/verilog/src/unisims +libext+.v \
					-y ${XILINX_VIVADO}/verilog/src/unimacro +libext+.v \
					${XILINX_VIVADO}/data/verilog/src/glbl.v

default: all

all: $(SIM) $(TARGET)
	xmverilog +access+rw $(OPT) $(SIM) $(TARGET)

clean:
	rm -rf xmverilog* *.shm xcelium.d
