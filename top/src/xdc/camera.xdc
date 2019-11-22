## This .xdc file is for camera Team


# #########################         cam_0 (Front camera)       #####################################

# ------------------------------- cam_0 sync -----------------------------------------
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports siod_f]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports vs_f]
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports href_f]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports pclk_f]

# ------------------------------- cam_0 DATA -----------------------------------------
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {data_f[7]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {data_f[6]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {data_f[5]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {data_f[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {data_f[3]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {data_f[2]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {data_f[1]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {data_f[0]}]
# ------------------------------------------------------------------------------------

# ########################          cam_1 (Rear camera)       #####################################

# ------------------------------- cam_1 sync -----------------------------------------
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports pclk_r]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports href_r]
set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports vs_r]
set_property -dict {PACKAGE_PIN Y7 IOSTANDARD LVCMOS33} [get_ports siod_r]


# ------------------------------- cam_1 DATA -----------------------------------------
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {data_r[0]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {data_r[1]}]
set_property -dict {PACKAGE_PIN V6 IOSTANDARD LVCMOS33} [get_ports {data_r[2]}]
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {data_r[3]}]
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {data_r[4]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {data_r[5]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {data_r[6]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {data_r[7]}]
# -------------------------------------------------------------------------------------
# -------------------------------- cam global ----------------------------------------
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33} [get_ports sioc]
set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS33} [get_ports xclk]
set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVCMOS33} [get_ports cam_reset]
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports pwdn]

