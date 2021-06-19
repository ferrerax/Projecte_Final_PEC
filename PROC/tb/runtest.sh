#$1

ETAPA_NAME=PROC


CYCLES=-all
ROOT=$(git rev-parse --show-cdup)
ETAPA_DIR=${ROOT}$ETAPA_NAME
SIM_DIR=$ETAPA_DIR/tb
FILEDIR=$ETAPA_NAME/src
TESTFILES=(test_sisa.vhd
      package_timing.vhd \
      package_utility.vhd \
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


if [  -z $1 ] || [  -z $2 ] || [  -z $3 ] || [  -z $4 ];  then
  if [ ! -f $SIM_DIR/contingut.memoria.syscode.hexa16.rom ] || \
     [ ! -f $SIM_DIR/contingut.memoria.sysdata.hexa16.rom ] || \
     [ ! -f $SIM_DIR/contingut.memoria.usrcode.hexa16.rom ] || \
     [ ! -f $SIM_DIR/contingut.memoria.usrdata.hexa16.rom ] ;  then
    echo No existeix el fitxer contingut.memoria.hexa16.rom, cal passar el path del programa a simular com a primer argument.
    echo Exemple:
    echo ./runtest.sh ../../eines-sisa/contingut.memoria.hexa16.saltos_absolutos.rom 
    exit
  fi
else
  if [ -f "$1" ]; then
    rm $SIM_DIR/contingut.memoria.syscode.hexa16.rom
    ln -s $1 $SIM_DIR/contingut.memoria.syscode.hexa16.rom 
  else
    echo Error: $1 not found.
    exit
  fi
  if [ -f "$2" ]; then
    rm $SIM_DIR/contingut.memoria.sysdata.hexa16.rom
    ln -s $2 $SIM_DIR/contingut.memoria.sysdata.hexa16.rom 
  else
    echo Error: $2 not found.
    exit
  fi
  if [ -f "$3" ]; then
    rm $SIM_DIR/contingut.memoria.usrcode.hexa16.rom
    ln -s $3 $SIM_DIR/contingut.memoria.usrcode.hexa16.rom 
  else
    echo Error: $3 not found.
    exit
  fi
  if [ -f "$4" ]; then
    rm $SIM_DIR/contingut.memoria.usrdata.hexa16.rom
    ln -s $4 $SIM_DIR/contingut.memoria.usrdata.hexa16.rom 
  else
    echo Error: $4 not found.
    exit
  fi

fi



vcom -work work ${TESTFILES[@]} $PKG_FILES $ENT_FILES
vsim work.test_sisa -fsmdebug  -do "view wave" -do "do wave.do" -do "run $CYCLES"

