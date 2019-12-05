default: all

all:
	vivado -mode tcl -source generate_bitstream.tcl

config:
	vivado -mode tcl -source config_bitstream.tcl

clean:
	rm -rf *.jou *.log *.str
