open_hw
connect_hw_server
open_hw_target
current_hw_device [get_hw_devices xc7z020_1]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7z020_1] 0]

## if you don't use debug core
set_property PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7z020_1]

## else if you use debug core
# set_property PROBES.FILE {/home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/project_1.runs/impl_1/alltop.ltx} [get_hw_devices xc7z020_1]
# set_property FULL_PROBES.FILE {/home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/project_1.runs/impl_1/alltop.ltx} [get_hw_devices xc7z020_1]

set_property PROGRAM.FILE {/home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/project_1.runs/impl_1/alltop.bit} [get_hw_devices xc7z020_1]
program_hw_devices [get_hw_devices xc7z020_1]
refresh_hw_device [lindex [get_hw_devices xc7z020_1] 0]
exit
