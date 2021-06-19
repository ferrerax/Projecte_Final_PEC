#$1


CYCLES=-all
ROOT=$(git rev-parse --show-cdup)
ETAPA_DIR=${ROOT}$ETAPA_NAME
SIM_DIR=$ETAPA_DIR/tb
FILEDIR=$ETAPA_NAME/ficheros_etapa7
TESTFILES=(../sd_spi.vhd ../sd_driver.vhd tb_sd_driver.vhd)

# project_open $FILEDIR/
# foreach_in_collection asgn_id [get_all_assignments -name VHDL_FILE -type global] { puts  [get_assignment_info -value $asgn_id] }


vcom -work work ${TESTFILES[@]}
vsim work.tb_sd_driver -fsmdebug  -do "view wave" -do "do wave.do" -do "run $CYCLES"

