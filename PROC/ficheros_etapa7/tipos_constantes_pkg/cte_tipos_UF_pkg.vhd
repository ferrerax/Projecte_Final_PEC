library ieee;
use ieee.std_logic_1164.all;

package cte_tipos_UF_pkg is 

constant tam_codigo_alu_op: integer := 5;

subtype codigo_alu_op is std_logic_vector(tam_codigo_alu_op-1 downto 0);

-- ALU OPCODES
-- A_L
constant ALU_AND:     codigo_alu_op := "00000";
constant ALU_OR:      codigo_alu_op := "00001";
constant ALU_XOR:     codigo_alu_op := "00010";
constant ALU_NOT:     codigo_alu_op := "00011";
constant ALU_ADD:     codigo_alu_op := "00100";
constant ALU_SUB:     codigo_alu_op := "00101";
constant ALU_SHA:     codigo_alu_op := "00110";
constant ALU_SHL:     codigo_alu_op := "00111";

-- CMP
constant ALU_CMPLT:   codigo_alu_op := "01000";
constant ALU_CMPLE:   codigo_alu_op := "01001";
constant ALU_CMPLEQ:  codigo_alu_op := "01010";
constant ALU_CMPLTU:  codigo_alu_op := "01011";
constant ALU_CMPLEU:  codigo_alu_op := "01100";

-- Z
constant ALU_Y:    codigo_alu_op := "01101";
constant ALU_X:    codigo_alu_op := "01110";

-- MUL/DIV

constant ALU_MUL:     codigo_alu_op := "01111";
constant ALU_MULH:    codigo_alu_op := "10000";
constant ALU_MULHU:   codigo_alu_op := "10001";
constant ALU_DIV:     codigo_alu_op := "10010";
constant ALU_DIVU:    codigo_alu_op := "10011";

-- MOV
constant ALU_MOVHI:   codigo_alu_op := "10100";


constant PE:  std_logic:= '1';

END PACKAGE cte_tipos_UF_pkg;