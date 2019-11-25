set PROJ_NAME project_1
set PROJ_DIR /home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/

open_project project_1.xpr
update_compile_order -fileset sources_1
open_bd_design {/home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/project_1.srcs/sources_1/bd/pspl_comm/pspl_comm.bd}
reset_run synth_1
launch_runs synth_1 -jobs 48
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 48
wait_on_run impl_1
exit
