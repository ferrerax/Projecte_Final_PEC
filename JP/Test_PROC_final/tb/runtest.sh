#$1

ETAPA_NAME=RTL/PROC


CYCLES=-all
ROOT=$(git rev-parse --show-cdup)
ETAPA_DIR=${ROOT}$ETAPA_NAME
SIM_DIR=${ROOT}JP/Test_PROC_final/tb
FILEDIR=$ETAPA_NAME/src
TESTFILES=(test_sisa.vhd
      package_timing.vhd \
      package_utility.vhd \
      stub_SD.vhd \
      async_64Kx16.vhd)

# project_open $FILEDIR/
# foreach_in_collection asgn_id [get_all_assignments -name VHDL_FILE -type global] { puts  [get_assignment_info -value $asgn_id] }
if [ ! -f $ETAPA_DIR/sisa.qpf ]; then
  echo Error: Project file not found;
  exit
fi

echo "project_open $ETAPA_DIR/sisa.qpf" > getfiles.tcl
echo "foreach_in_collection asgn_id [get_all_assignments -name VHDL_FILE -type global] { puts  $ETAPA_DIR/[get_assignment_info -value \$asgn_id] }" >> getfiles.tcl

FILES=$(quartus_sh -t getfiles.tcl | grep -v -P 'Info.*:' > files )
PKG_FILES=$(cat files | grep _pkg.vhd)
ENT_FILES=$(cat files | grep -v  _pkg.vhd)
rm files


vcom -work work ${TESTFILES[@]} $PKG_FILES $ENT_FILES
vsim work.test_sisa -fsmdebug  -do "view wave" -do "do wave.do" -do "run $CYCLES"

