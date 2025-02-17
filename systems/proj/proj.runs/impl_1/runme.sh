#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/cad/xilinx-vivado-2018.3/SDK/2018.3/bin:/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/bin
else
  PATH=/home/cad/xilinx-vivado-2018.3/SDK/2018.3/bin:/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/cad/xilinx-vivado-2018.3/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/users/saikai/Project/Autonomous_Vehicle_Driving/systems/proj/proj.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log top.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source top.tcl -notrace


