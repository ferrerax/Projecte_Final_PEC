library ieee;
use ieee.std_logic_1164.all;

package sisa16_coop_funct_pkg is 

constant tamcoop:   integer := 4;
constant tamfunct1: integer := 1;
constant tamfunct3: integer := 3;
constant tamfunct5: integer := 5;

subtype codigooper  is std_logic_vector(tamcoop-1 downto 0);
subtype campofunct1 is std_logic;
subtype campofunct3 is std_logic_vector(tamfunct3-1 downto 0);
subtype campofunct5 is std_logic_vector(tamfunct5-1 downto 0);

-- SISA16 Base
-- Codigos de operacion (CO)

constant COOP_AL:       codigooper := "0000";
constant COOP_CMP:      codigooper := "0001";
constant COOP_ADDI:     codigooper := "0010";
constant COOP_LD:       codigooper := "0011";
constant COOP_ST:       codigooper := "0100";
constant COOP_MOV:      codigooper := "0101";
constant COOP_BR:       codigooper := "0110";
constant COOP_IO:       codigooper := "0111";
constant COOP_EA:       codigooper := "1000";
constant COOP_JMP:      codigooper := "1010";
constant COOP_LDB:      codigooper := "1101";
constant COOP_STB:      codigooper := "1110";
constant COOP_INT:      codigooper := "1111";


constant F1_MOVHI:  campofunct1 := '1';
constant F1_MOVI:   campofunct1 := '0';

constant F1_IN: campofunct1 := '0';
constant F1_OUT: campofunct1 := '1';

-- F3_BR
constant F1_BZ    : campofunct1 := '0';
constant F1_BNZ   : campofunct1 := '1';

-- F3_JMP
constant F3_JZ    : campofunct3  := "000";
constant F3_JNZ   : campofunct3  := "001";
constant F3_JMP   : campofunct3  := "011";
constant F3_JAL   : campofunct3  := "100";

-- F3_CMP
constant F3_CMPLT : campofunct3  := "000";
constant F3_CMPLE : campofunct3  := "001";
--                                  "010"
constant F3_CMPLEQ : campofunct3 := "011";
constant F3_CMPLTU : campofunct3 := "100";
constant F3_CMPLEU : campofunct3 := "101";

-- F3_AL
constant F3_AND : campofunct3 := "000";
constant F3_OR  : campofunct3 := "001";
constant F3_XOR : campofunct3 := "010";
constant F3_NOT : campofunct3 := "011";
constant F3_ADD : campofunct3 := "100";
constant F3_SUB : campofunct3 := "101";
constant F3_SHA : campofunct3 := "110";
constant F3_SHL : campofunct3 := "111";

-- F3_EA
constant F3_MUL   : campofunct3 := "000";
constant F3_MULH  : campofunct3 := "001";
constant F3_MULHU : campofunct3 := "010";
constant F3_DIV   : campofunct3 := "100";
constant F3_DIVU  : campofunct3 := "101";

-- F5_INT
constant F5_EI     : campofunct5 := "00000";
constant F5_DI     : campofunct5 := "00001";
constant F5_CALLS  : campofunct5 := "00111";
constant F5_RETI   : campofunct5 := "00100";
constant F5_GETIID : campofunct5 := "01000";
constant F5_RDS    : campofunct5 := "01100";
constant F5_WRS    : campofunct5 := "10000";
constant F5_HALT   : campofunct5 := "11111";

constant EXCP_ID_ILLEGAL_IR  : std_logic_vector(3 downto 0) := x"0";
constant EXCP_ID_MEM_ALIGN   : std_logic_vector(3 downto 0) := x"1";
constant EXCP_ID_DIV_ZERO    : std_logic_vector(3 downto 0) := x"4";
constant EXCP_ID_MEM_PROTECT : std_logic_vector(3 downto 0) := x"B";
constant EXCP_ID_IR_PROTECT  : std_logic_vector(3 downto 0) := x"D";
constant EXCP_ID_CALLS       : std_logic_vector(3 downto 0) := x"E";


END PACKAGE sisa16_coop_funct_pkg;