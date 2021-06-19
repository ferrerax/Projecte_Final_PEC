project_open ../../PROC/sisa.qpf
foreach_in_collection asgn_id [get_all_assignments -name VHDL_FILE -type global] { puts  ../../PROC/[get_assignment_info -value $asgn_id] }
