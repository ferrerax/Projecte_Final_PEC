LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
LIBRARY work;
USE work.cte_tipos_UF_pkg.all;

ENTITY alu IS
    PORT (x             : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y             : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op            : IN  STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
          w             : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 z             : OUT STD_LOGIC;
			 excp_div_zero : OUT STD_LOGIC);
END alu;


ARCHITECTURE Structure OF alu IS
signal w_t   : std_logic_vector(15 downto 0);
signal resta : std_logic_vector(15 downto 0);
signal div   : std_logic_vector(15 downto 0);
signal divu  : std_logic_vector(15 downto 0);

signal mul, mulu: std_logic_vector(31 downto 0);

signal eq, cmpltu: std_logic;
signal sha : signed(15 downto 0);
signal shl : unsigned(15 downto 0);
signal shift_y: integer;

BEGIN
	w <= w_t;
	z <= '1' when y = x"0" else '0';
	excp_div_zero <= '1' when y = x"0" and (op = ALU_DIV or op = ALU_DIVU) else '0';
	
	resta <= x - y;
	
	eq <= '1' when x = y else '0';
	
	cmpltu <= '1' when unsigned(x) < unsigned(y) else '0';
	
	shift_y <= to_integer(signed(y(4 downto 0)));
	
	sha <= shift_right(signed(x),   -shift_y)  when y(4) = '1' else
			 shift_left(signed(x),     shift_y);
	shl <= shift_right(unsigned(x), -shift_y)  when y(4) = '1' else
			 shift_left(unsigned(x),   shift_y);
			 
			 
	mul  <= std_logic_vector(signed(x)   *  signed(y));
	mulu <= std_logic_vector(unsigned(x) *  unsigned(y));
	
	div  <= std_logic_vector(signed(x)   /  signed(y));
	divu <= std_logic_vector(unsigned(x) /  unsigned(y));

	
	with op select w_t <=
		y 										         when ALU_Y,
		x                                      when ALU_X,
		y(7 downto 0) & x(7 downto 0)          when ALU_MOVHI,
		x + y                           			when ALU_ADD,
		"000000000000000" &  resta(15)         when ALU_CMPLT,
		"000000000000000" & (resta(15) or eq)  when ALU_CMPLE,
		"000000000000000" &  eq                when ALU_CMPLEQ,
		"000000000000000" &  cmpltu            when ALU_CMPLTU,
		"000000000000000" & (cmpltu    or eq)  when ALU_CMPLEU,
		x and y											when ALU_AND,
		x or y											when ALU_OR,
		x xor y											when ALU_XOR,
		not x											   when ALU_NOT,
		resta                                  when ALU_SUB,
		std_logic_vector(sha)						when ALU_SHA,
		std_logic_vector(shl)						when ALU_SHL,
		mul(15 downto 0)                       when ALU_MUL,
		mul(31 downto 16)                      when ALU_MULH,
		mulu(31 downto 16)                     when ALU_MULHU,
		div                                    when ALU_DIV,
		divu                                   when ALU_DIVU,		
		(others => '0') when others;
		
END Structure;