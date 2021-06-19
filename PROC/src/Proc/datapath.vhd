LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

LIBRARY work;
USE work.cte_tipos_UF_pkg.all;
USE work.cte_tipos_UC_pkg.all;

ENTITY datapath IS
	PORT (
		clk:       IN  STD_LOGIC;
		boot:      IN  STD_LOGIC;
		op:        IN  STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
		wrd:       IN  STD_LOGIC;
		addr_a:    IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		addr_b:    IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		addr_d:    IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		immed:     IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		immed_x2:  IN  STD_LOGIC;
		datard_m:  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ins_dad:   IN  STD_LOGIC;
		pc_in:     IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		in_d:      IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
		Rb_N:      IN  STD_LOGIC;
		tknbr:     IN  STD_LOGIC_VECTOR(1  DOWNTO 0);
		rd_io:     IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		a_sys:     IN STD_LOGIC;
		d_sys:     IN STD_LOGIC;
		op_sys:    IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		excp_codigo : IN STD_LOGIC_VECTOR(3  DOWNTO 0);
		int_en:    OUT STD_LOGIC;
		mode_sys : OUT STD_LOGIC;
		pc_out:    OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		z:         OUT STD_LOGIC;
		addr_m:    OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_io:     OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		data_wr:   OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		excp_div_zero : OUT STD_LOGIC); 
END datapath;
ARCHITECTURE Structure OF datapath IS

    -- Aqui iria la declaracion de las entidades que vamos a usar
    -- Usaremos la palabra reservada COMPONENT ...
    -- Tambien crearemos los cables/buses (signals) necesarios para unir las entidades
	COMPONENT regfile IS
		PORT (clk    : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 addr_b : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	COMPONENT sregfile IS
		PORT (clk    : IN  STD_LOGIC;
			 boot   : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
			 op_d   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 excp_codigo : IN STD_LOGIC_VECTOR(3  DOWNTO 0);
			 excp_dir : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 int_en : OUT STD_LOGIC;
			 mode_sys : OUT STD_LOGIC;
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	COMPONENT alu IS
		PORT (x  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		      y  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		      op : IN  STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
		      w  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		      z  : OUT STD_LOGIC;
				excp_div_zero : OUT STD_LOGIC);
	END COMPONENT;

signal atox, wtod, immed_y, reg_d: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal y_i : std_logic_vector(15 downto 0);
signal b_o : std_logic_vector(15 downto 0);
signal pc_next: std_logic_vector(15 downto 0);
signal br_wrd: std_logic;
signal sbr_wrd: std_logic;
signal a : std_logic_vector(15 downto 0);
signal sa : std_logic_vector(15 downto 0);
signal excp_addr : std_logic_vector(15 downto 0);
signal wtod_old : std_logic_vector(15 downto 0);

BEGIN

	data_wr <= b_o;

	BR: regfile PORT MAP(clk     =>  clk,
	                     wrd     =>  br_wrd,
								d       =>  reg_d ,
								addr_a  =>  addr_a,
								addr_b  =>  addr_b,
								addr_d  =>  addr_d,
								a       =>  a,
								b       =>  b_o );
	
	excp_addr <= pc_in when pc_in(0) = '1' else wtod_old;
	
	SBR: sregfile PORT MAP(clk         =>  clk,
								  boot        =>  boot,
	                       wrd         =>  sbr_wrd,
								  op_d        =>  op_sys,
								  d           =>  reg_d ,
								  addr_a      =>  addr_a,
								  addr_d      =>  addr_d,
								  excp_codigo => excp_codigo,
								  int_en      => int_en,
								  mode_sys    => mode_sys,
								  excp_dir    => excp_addr,
								  a           =>  sa);

	ALUop: alu PORT MAP(x   =>  atox,
	                    y   =>  y_i,
	                    op  =>  op,
	                    w   =>  wtod,
	                    z   =>  z,
							  excp_div_zero => excp_div_zero);
							  
	atox <= sa when a_sys = '1' else a;
	br_wrd  <= wrd and (not d_sys);
	sbr_wrd <= wrd and      d_sys;
	 
	y_i <= b_o when Rb_N = '0' else immed_y;
	
	with immed_x2 select immed_y <= 
	   immed(14 downto 0) & '0' when  '1',
		immed                    when  others;
		
	with in_d select reg_d <=
		datard_m        when  REGFILE_D_MEM,
		pc_in + 2       when  REGFILE_D_PC_2,
		wtod            when  REGFILE_D_ALU,
		rd_io           when  REGFILE_D_IO,
		pc_in           when  REGFILE_D_PC_NEXT,
		(others => '0') when others;
		
	with ins_dad select addr_m <= 
		wtod       when  '1',
		pc_next    when  others;

	with tknbr select pc_next <=
		pc_in + 2            when PC_INCR,
		pc_in + 2 + immed_y  when BR_SI,
		wtod                 when JMP_SI,
		pc_in                when PC_BLOQ,
		pc_in                when others; 
	
	pc_out <= pc_next;
	wr_io <= b_o;

	process(clk) begin
		if rising_edge(clk) then
			wtod_old <= wtod;
		end if;
	end process;
	
END Structure;
