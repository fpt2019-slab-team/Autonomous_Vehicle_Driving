vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic" "+incdir+/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" "+incdir+/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../proj.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

