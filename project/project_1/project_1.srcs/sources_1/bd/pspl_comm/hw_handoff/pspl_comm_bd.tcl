
################################################################
# This is a generated script based on design: pspl_comm
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pspl_comm_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pspl_comm

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set FCLK_CLK0 [ create_bd_port -dir O -type clk FCLK_CLK0 ]
  set kl_accel [ create_bd_port -dir O -from 6 -to 0 kl_accel ]
  set kl_steer [ create_bd_port -dir O -from 7 -to 0 kl_steer ]
  set led [ create_bd_port -dir O -from 3 -to 0 led ]
  set lsd_grad_thres_f [ create_bd_port -dir O -from 16 -to 0 lsd_grad_thres_f ]
  set lsd_grad_thres_r [ create_bd_port -dir O -from 16 -to 0 lsd_grad_thres_r ]
  set lsd_line_addr_f [ create_bd_port -dir O -from 31 -to 0 lsd_line_addr_f ]
  set lsd_line_addr_r [ create_bd_port -dir O -from 31 -to 0 lsd_line_addr_r ]
  set lsd_line_end_h_f [ create_bd_port -dir I -from 31 -to 0 lsd_line_end_h_f ]
  set lsd_line_end_h_r [ create_bd_port -dir I -from 31 -to 0 lsd_line_end_h_r ]
  set lsd_line_end_v_f [ create_bd_port -dir I -from 31 -to 0 lsd_line_end_v_f ]
  set lsd_line_end_v_r [ create_bd_port -dir I -from 31 -to 0 lsd_line_end_v_r ]
  set lsd_line_num_f [ create_bd_port -dir I -from 31 -to 0 lsd_line_num_f ]
  set lsd_line_num_r [ create_bd_port -dir I -from 31 -to 0 lsd_line_num_r ]
  set lsd_line_start_h_f [ create_bd_port -dir I -from 31 -to 0 lsd_line_start_h_f ]
  set lsd_line_start_h_r [ create_bd_port -dir I -from 31 -to 0 lsd_line_start_h_r ]
  set lsd_line_start_v_f [ create_bd_port -dir I -from 31 -to 0 lsd_line_start_v_f ]
  set lsd_line_start_v_r [ create_bd_port -dir I -from 31 -to 0 lsd_line_start_v_r ]
  set lsd_ready_f [ create_bd_port -dir I lsd_ready_f ]
  set lsd_ready_r [ create_bd_port -dir I lsd_ready_r ]
  set lsd_write_protect_f [ create_bd_port -dir O lsd_write_protect_f ]
  set lsd_write_protect_r [ create_bd_port -dir O lsd_write_protect_r ]
  set motor_speed_l [ create_bd_port -dir I -from 15 -to 0 motor_speed_l ]
  set motor_speed_r [ create_bd_port -dir I -from 15 -to 0 motor_speed_r ]
  set sccb_busy [ create_bd_port -dir I sccb_busy ]
  set sccb_req [ create_bd_port -dir O sccb_req ]
  set sccb_send_data [ create_bd_port -dir O -from 23 -to 0 sccb_send_data ]
  set sw [ create_bd_port -dir I -from 1 -to 0 sw ]
  set topview_line_addr_f [ create_bd_port -dir O -from 31 -to 0 topview_line_addr_f ]
  set topview_line_addr_r [ create_bd_port -dir O -from 31 -to 0 topview_line_addr_r ]
  set topview_line_end_h_f [ create_bd_port -dir I -from 31 -to 0 topview_line_end_h_f ]
  set topview_line_end_h_r [ create_bd_port -dir I -from 31 -to 0 topview_line_end_h_r ]
  set topview_line_end_v_f [ create_bd_port -dir I -from 31 -to 0 topview_line_end_v_f ]
  set topview_line_end_v_r [ create_bd_port -dir I -from 31 -to 0 topview_line_end_v_r ]
  set topview_line_num_f [ create_bd_port -dir I -from 31 -to 0 topview_line_num_f ]
  set topview_line_num_r [ create_bd_port -dir I -from 31 -to 0 topview_line_num_r ]
  set topview_line_start_h_f [ create_bd_port -dir I -from 31 -to 0 topview_line_start_h_f ]
  set topview_line_start_h_r [ create_bd_port -dir I -from 31 -to 0 topview_line_start_h_r ]
  set topview_line_start_v_f [ create_bd_port -dir I -from 31 -to 0 topview_line_start_v_f ]
  set topview_line_start_v_r [ create_bd_port -dir I -from 31 -to 0 topview_line_start_v_r ]
  set topview_line_valid_f [ create_bd_port -dir I topview_line_valid_f ]
  set topview_line_valid_r [ create_bd_port -dir I topview_line_valid_r ]
  set topview_ready_f [ create_bd_port -dir I topview_ready_f ]
  set topview_ready_r [ create_bd_port -dir I topview_ready_r ]
  set topview_write_protect_f [ create_bd_port -dir O topview_write_protect_f ]
  set topview_write_protect_r [ create_bd_port -dir O topview_write_protect_r ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {100000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {4} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {48} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1600.000} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $ps7_0_axi_periph

  # Create instance: pspl_comm_0, and set properties
  set pspl_comm_0 [ create_bd_cell -type ip -vlnv pcalab:user:pspl_comm:1.0 pspl_comm_0 ]

  # Create instance: rst_ps7_0_100M, and set properties
  set rst_ps7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins ps7_0_axi_periph/M00_AXI] [get_bd_intf_pins pspl_comm_0/S00_AXI]

  # Create port connections
  connect_bd_net -net lsd_line_end_h_f_0_1 [get_bd_ports lsd_line_end_h_f] [get_bd_pins pspl_comm_0/lsd_line_end_h_f]
  connect_bd_net -net lsd_line_end_h_r_0_1 [get_bd_ports lsd_line_end_h_r] [get_bd_pins pspl_comm_0/lsd_line_end_h_r]
  connect_bd_net -net lsd_line_end_v_f_0_1 [get_bd_ports lsd_line_end_v_f] [get_bd_pins pspl_comm_0/lsd_line_end_v_f]
  connect_bd_net -net lsd_line_end_v_r_0_1 [get_bd_ports lsd_line_end_v_r] [get_bd_pins pspl_comm_0/lsd_line_end_v_r]
  connect_bd_net -net lsd_line_num_f_0_1 [get_bd_ports lsd_line_num_f] [get_bd_pins pspl_comm_0/lsd_line_num_f]
  connect_bd_net -net lsd_line_num_r_0_1 [get_bd_ports lsd_line_num_r] [get_bd_pins pspl_comm_0/lsd_line_num_r]
  connect_bd_net -net lsd_line_start_h_f_0_1 [get_bd_ports lsd_line_start_h_f] [get_bd_pins pspl_comm_0/lsd_line_start_h_f]
  connect_bd_net -net lsd_line_start_h_r_0_1 [get_bd_ports lsd_line_start_h_r] [get_bd_pins pspl_comm_0/lsd_line_start_h_r]
  connect_bd_net -net lsd_line_start_v_f_0_1 [get_bd_ports lsd_line_start_v_f] [get_bd_pins pspl_comm_0/lsd_line_start_v_f]
  connect_bd_net -net lsd_line_start_v_r_0_1 [get_bd_ports lsd_line_start_v_r] [get_bd_pins pspl_comm_0/lsd_line_start_v_r]
  connect_bd_net -net lsd_ready_f_0_1 [get_bd_ports lsd_ready_f] [get_bd_pins pspl_comm_0/lsd_ready_f]
  connect_bd_net -net lsd_ready_r_0_1 [get_bd_ports lsd_ready_r] [get_bd_pins pspl_comm_0/lsd_ready_r]
  connect_bd_net -net motor_speed_l_0_1 [get_bd_ports motor_speed_l] [get_bd_pins pspl_comm_0/motor_speed_l]
  connect_bd_net -net motor_speed_r_0_1 [get_bd_ports motor_speed_r] [get_bd_pins pspl_comm_0/motor_speed_r]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports FCLK_CLK0] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins pspl_comm_0/s00_axi_aclk] [get_bd_pins rst_ps7_0_100M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_100M/ext_reset_in]
  connect_bd_net -net pspl_comm_0_kl_accel [get_bd_ports kl_accel] [get_bd_pins pspl_comm_0/kl_accel]
  connect_bd_net -net pspl_comm_0_kl_steer [get_bd_ports kl_steer] [get_bd_pins pspl_comm_0/kl_steer]
  connect_bd_net -net pspl_comm_0_led [get_bd_ports led] [get_bd_pins pspl_comm_0/led]
  connect_bd_net -net pspl_comm_0_lsd_grad_thres_f [get_bd_ports lsd_grad_thres_f] [get_bd_pins pspl_comm_0/lsd_grad_thres_f]
  connect_bd_net -net pspl_comm_0_lsd_grad_thres_r [get_bd_ports lsd_grad_thres_r] [get_bd_pins pspl_comm_0/lsd_grad_thres_r]
  connect_bd_net -net pspl_comm_0_lsd_line_addr_f [get_bd_ports lsd_line_addr_f] [get_bd_pins pspl_comm_0/lsd_line_addr_f]
  connect_bd_net -net pspl_comm_0_lsd_line_addr_r [get_bd_ports lsd_line_addr_r] [get_bd_pins pspl_comm_0/lsd_line_addr_r]
  connect_bd_net -net pspl_comm_0_lsd_write_protect_f [get_bd_ports lsd_write_protect_f] [get_bd_pins pspl_comm_0/lsd_write_protect_f]
  connect_bd_net -net pspl_comm_0_lsd_write_protect_r [get_bd_ports lsd_write_protect_r] [get_bd_pins pspl_comm_0/lsd_write_protect_r]
  connect_bd_net -net pspl_comm_0_sccb_req [get_bd_ports sccb_req] [get_bd_pins pspl_comm_0/sccb_req]
  connect_bd_net -net pspl_comm_0_sccb_send_data [get_bd_ports sccb_send_data] [get_bd_pins pspl_comm_0/sccb_send_data]
  connect_bd_net -net pspl_comm_0_topview_line_addr_f [get_bd_ports topview_line_addr_f] [get_bd_pins pspl_comm_0/topview_line_addr_f]
  connect_bd_net -net pspl_comm_0_topview_line_addr_r [get_bd_ports topview_line_addr_r] [get_bd_pins pspl_comm_0/topview_line_addr_r]
  connect_bd_net -net pspl_comm_0_topview_write_protect_f [get_bd_ports topview_write_protect_f] [get_bd_pins pspl_comm_0/topview_write_protect_f]
  connect_bd_net -net pspl_comm_0_topview_write_protect_r [get_bd_ports topview_write_protect_r] [get_bd_pins pspl_comm_0/topview_write_protect_r]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins pspl_comm_0/s00_axi_aresetn] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
  connect_bd_net -net sccb_busy_0_1 [get_bd_ports sccb_busy] [get_bd_pins pspl_comm_0/sccb_busy]
  connect_bd_net -net sw_0_1 [get_bd_ports sw] [get_bd_pins pspl_comm_0/sw]
  connect_bd_net -net topview_line_end_h_f_0_1 [get_bd_ports topview_line_end_h_f] [get_bd_pins pspl_comm_0/topview_line_end_h_f]
  connect_bd_net -net topview_line_end_h_r_0_1 [get_bd_ports topview_line_end_h_r] [get_bd_pins pspl_comm_0/topview_line_end_h_r]
  connect_bd_net -net topview_line_end_v_f_0_1 [get_bd_ports topview_line_end_v_f] [get_bd_pins pspl_comm_0/topview_line_end_v_f]
  connect_bd_net -net topview_line_end_v_r_0_1 [get_bd_ports topview_line_end_v_r] [get_bd_pins pspl_comm_0/topview_line_end_v_r]
  connect_bd_net -net topview_line_num_f_0_1 [get_bd_ports topview_line_num_f] [get_bd_pins pspl_comm_0/topview_line_num_f]
  connect_bd_net -net topview_line_num_r_0_1 [get_bd_ports topview_line_num_r] [get_bd_pins pspl_comm_0/topview_line_num_r]
  connect_bd_net -net topview_line_start_h_f_0_1 [get_bd_ports topview_line_start_h_f] [get_bd_pins pspl_comm_0/topview_line_start_h_f]
  connect_bd_net -net topview_line_start_h_r_0_1 [get_bd_ports topview_line_start_h_r] [get_bd_pins pspl_comm_0/topview_line_start_h_r]
  connect_bd_net -net topview_line_start_v_f_0_1 [get_bd_ports topview_line_start_v_f] [get_bd_pins pspl_comm_0/topview_line_start_v_f]
  connect_bd_net -net topview_line_start_v_r_0_1 [get_bd_ports topview_line_start_v_r] [get_bd_pins pspl_comm_0/topview_line_start_v_r]
  connect_bd_net -net topview_line_valid_f_0_1 [get_bd_ports topview_line_valid_f] [get_bd_pins pspl_comm_0/topview_line_valid_f]
  connect_bd_net -net topview_line_valid_r_0_1 [get_bd_ports topview_line_valid_r] [get_bd_pins pspl_comm_0/topview_line_valid_r]
  connect_bd_net -net topview_ready_f_0_1 [get_bd_ports topview_ready_f] [get_bd_pins pspl_comm_0/topview_ready_f]
  connect_bd_net -net topview_ready_r_0_1 [get_bd_ports topview_ready_r] [get_bd_pins pspl_comm_0/topview_ready_r]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs pspl_comm_0/S00_AXI/S00_AXI_reg] SEG_pspl_comm_0_S00_AXI_reg


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


