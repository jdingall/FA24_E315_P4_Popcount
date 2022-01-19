set MYFILE [file normalize [info script]]
set MYDIR  [file dirname ${MYFILE}]
set BASEDIR ${MYDIR}/../
set SRCDIR ${MYDIR}/../verilog/vsrc/
set TESTDIR ${MYDIR}/../verilog/vtests/ 

create_project -force vivado_project.xpr ${BASEDIR}/vivado_project -part xc7z020clg400-1

# add source files
add_files [glob ${SRCDIR}/*.v]
add_files [glob ${SRCDIR}/*.sv]
add_files [glob ${SRCDIR}/*/*.bd]
make_wrapper -files [get_files *.bd] -top
add_files [glob ${SRCDIR}/*/hdl/*_wrapper.v]

# add testbenches
create_fileset -simset axi4lite_behav 
add_files -fileset axi4lite_behav [glob ${TESTDIR}/axi4lite_behav/*.sv]
add_files -fileset axi4lite_behav [glob ${TESTDIR}/axi4lite_behav/*/*.bd]
make_wrapper -files [get_files *.bd] -top
add_files [glob ${TESTDIR}/axi4lite_behav/*/hdl/*_wrapper.v]
set_property top axi4lite_behav_tb [get_filesets axi4lite_behav]

create_fileset -simset axi4lite_synth 
add_files -fileset axi4lite_synth [glob ${TESTDIR}/axi4lite_synth/*.sv]
set_property top axi4lite_synth_tb [get_filesets axi4lite_synth]

# set *.sv to SystemVerilog
set_property file_type SystemVerilog [get_files *.sv]

# set active simulation
current_fileset -simset [ get_filesets axi4lite_behav ]

#set the top for synthesis
set_property top bd_fpga_wrapper [current_fileset]

