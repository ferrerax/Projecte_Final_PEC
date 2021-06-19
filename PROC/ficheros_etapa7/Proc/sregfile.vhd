LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;        --Esta libreria sera necesaria si usais conversiones TO_INTEGER
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER

library work;
use work.sisa16_coop_funct_pkg.all;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_UC_pkg.all;

ENTITY sregfile IS
    PORT (clk      : IN  STD_LOGIC;
			 boot     : IN  STD_LOGIC;
          wrd      : IN  STD_LOGIC;
          op_d     : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
          d        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
          addr_d   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
			 excp_codigo  : IN  STD_LOGIC_VECTOR(3  DOWNTO 0);
			 excp_dir : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 int_en   : OUT STD_LOGIC;
			 mode_sys : OUT STD_LOGIC;
          a        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END sregfile;


ARCHITECTURE Structure OF sregfile IS
    -- Aqui iria la definicion de los registros
	type bancRegistres is array (0 to 7) of std_logic_vector(15 downto 0);
	signal BR: bancRegistres := (others=>x"0000");

	
BEGIN

    -- Aqui iria la definicion del comportamiento del banco de registros
    -- Os puede ser util usar la funcion "conv_integer" o "to_integer"
    -- Una buena (y limpia) implementacion no deberia ocupar m�s de 7 o 8 lineas
  a <= BR(conv_integer(addr_a));
  int_en <= BR(7)(1);
  mode_sys <= BR(7)(0);
  p_write : process(clk,wrd)
  begin
	 if boot = '1' then
		BR(7)(1 downto 0) <= "01";
    elsif rising_edge(clk) then
		if wrd = PE then
	      case op_d is
         when OP_SYS_NORMAL =>
            BR(conv_integer(addr_d)) <= d;
         when OP_SYS_EI   => BR(7)(1) <= '1';   -- EI
         when OP_SYS_DI   => BR(7)(1) <= '0';   -- DI
         when OP_SYS_RETI => BR(7)    <= BR(0); -- RETI
         when OP_SYS_INT  =>
          BR(0)    <= BR(7);
          BR(1)    <= d;
          BR(2)    <= x"000F";
          BR(7)(1 downto 0) <= "01";
         when OP_SYS_EXCP =>
          BR(0)    <= BR(7);
          BR(1)    <= d;
          BR(2)    <= x"000" & excp_codigo;
          if excp_codigo = EXCP_ID_MEM_ALIGN then
            BR(3) <= excp_dir;
          end if;
          BR(7)(1 downto 0) <= "01";
         when others => 
		    end case; 
		end if;
    end if;
  end process;


END Structure;
