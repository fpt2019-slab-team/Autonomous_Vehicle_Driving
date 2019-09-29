-makelib ies_lib/xilinx_vip -sv \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../proj.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
  "../../../../proj.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

