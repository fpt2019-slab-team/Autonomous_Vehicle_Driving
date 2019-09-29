TARGETS = sim_top.sv top.sv img_mem.sv bram.v cam.sv
# TARGETS = sim_lena.sv lena.sv
# TARGETS = sim_cam.sv cam.sv

all:
	xmverilog +access+r $(TARGETS)

clean:
	rm -f *~ \#*

distclean: clean
	rm -rf *.shm xcelium.d xmverilog*

simvision:
	simvision top.shm &

.PHONY: all clean
