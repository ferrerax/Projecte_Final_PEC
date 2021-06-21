LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

LIBRARY work;
USE work.cte_tipos_UC_pkg.all;
USE work.cte_tipos_UF_pkg.all;

ENTITY unidad_control IS
	PORT (
		boot      : IN  STD_LOGIC;
		clk       : IN  STD_LOGIC;
		datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		z         : IN  STD_LOGIC;
		pc_in     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		int_en    : IN  STD_LOGIC;
		intr      : IN  STD_LOGIC;
		excp       : IN  STD_LOGIC;
		mode_sys    : IN  STD_LOGIC;
		inta      : OUT STD_LOGIC;
		op        : OUT STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
		Rb_N      : OUT STD_LOGIC;
		tknbr     : OUT STD_LOGIC_VECTOR(1  DOWNTO 0);
		wrd       : OUT STD_LOGIC;
		addr_a    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		addr_b    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		addr_d    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		pc_out    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		ins_dad   : OUT STD_LOGIC;
		in_d      : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		immed_x2  : OUT STD_LOGIC;
		wr_m      : OUT STD_LOGIC;
		addr_io   : OUT STD_LOGIC_VECTOR(7 downto 0);
		rd_in     : OUT STD_LOGIC;
	   wr_out    : OUT STD_LOGIC;
		a_sys     : OUT STD_LOGIC;
		d_sys     : OUT STD_LOGIC;
		op_sys    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		is_acc_m  : OUT STD_LOGIC;
		word_byte : OUT STD_LOGIC;
		excp_illegal_ir : OUT STD_LOGIC;
		excp_ir_protect : OUT STD_LOGIC;
		excp_calls      : OUT STD_LOGIC);
END unidad_control;

ARCHITECTURE Structure OF unidad_control IS

    -- Aqui iria la declaracion de las entidades que vamos a usar
    -- Usaremos la palabra reservada COMPONENT ...
    -- Tambien crearemos los cables/buses (signals) necesarios para unir las entidades
    -- Aqui iria la definicion del program counter
	 COMPONENT control_l IS
		PORT (ir        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		      z         : IN  STD_LOGIC;
				int       : IN  STD_LOGIC;
				int_excp  : IN  STD_LOGIC;
				mode_sys   : IN  STD_LOGIC;
		      op        : OUT STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
		      tknbr     : OUT STD_LOGIC_VECTOR(1  DOWNTO 0);
		      Rb_N      : OUT STD_LOGIC;
		      wrd       : OUT STD_LOGIC;
		      addr_a    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		      addr_b    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		      addr_d    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		      immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		      wr_m      : OUT STD_LOGIC;
		      in_d      : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		      immed_x2  : OUT STD_LOGIC;
				addr_io   : OUT STD_LOGIC_VECTOR(7 downto 0);
			   rd_in     : OUT STD_LOGIC;
			   wr_out    : OUT STD_LOGIC;
				a_sys     : OUT STD_LOGIC;
			   d_sys     : OUT STD_LOGIC;
				op_sys    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		      word_byte : OUT STD_LOGIC;
				is_acc_m  : OUT STD_LOGIC;
				is_getiid : OUT STD_LOGIC;
				excp_illegal_ir : OUT STD_LOGIC;
				excp_ir_protect : OUT STD_LOGIC;
				excp_calls      : OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT multi IS
	    PORT(clk       : IN  STD_LOGIC;
	         boot      : IN  STD_LOGIC;
	         tknbr_in  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	         wrd_l     : IN  STD_LOGIC;
	         wr_m_l    : IN  STD_LOGIC;
	         w_b       : IN  STD_LOGIC;
				int_en    : IN  STD_LOGIC;
				is_getiid : IN  STD_LOGIC;
				intr      : IN  STD_LOGIC;
				excp      : IN  STD_LOGIC;
				wr_out_in : IN  STD_LOGIC;
				excp_calls: IN STD_LOGIC;
				wr_out_out: OUT STD_LOGIC;
				int_excp  : OUT STD_LOGIC;
				int       : OUT STD_LOGIC;
				inta      : OUT STD_LOGIC;
	         tknbr_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	         wrd       : OUT STD_LOGIC;
	         wr_m      : OUT STD_LOGIC;
	         ldir      : OUT STD_LOGIC;
	         ins_dad   : OUT STD_LOGIC;
	         word_byte : OUT STD_LOGIC);
	END COMPONENT;
	
	signal pc_q       : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal pc_d       : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	signal ir_d       : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal ir_q       : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	signal wrd_t      : STD_LOGIC;
	signal wr_m_t     : STD_LOGIC;
	signal w_b_t      : STD_LOGIC;
	signal ldir_o     : STD_LOGIC;
	signal ldpc_o     : std_logic_vector(1 downto 0);
	
	signal deco_tknbr     : std_logic_vector(1 downto 0);
	signal deco_is_getiid : std_logic;
	signal deco_wr_out    : std_logic;
	signal deco_excp_calls: std_logic;
	
	signal m0_int      : std_logic;
	signal m0_int_excp : std_logic;
	
BEGIN

    -- Aqui iria la declaracion del "mapeo" (PORT MAP) de los nombres de las entradas/salidas de los componentes
    -- En los esquemas de la documentacion a la instancia de la logica de control le hemos llamado c0
    -- Aqui iria la definicion del comportamiento de la unidad de control y la gestion del PC
	 excp_calls <= deco_excp_calls;
	 
	 deco : control_l PORT MAP(ir         => ir_q,
	                           op         => op,
										int        => m0_int,
										int_excp   => m0_int_excp,
										mode_sys    => mode_sys,
	                           tknbr      => deco_tknbr,
	                           Rb_N       => Rb_N,
	                           z          => z,
	                           wrd        => wrd_t,
	                           addr_a     => addr_a,
	                           addr_b     => addr_b,
	                           addr_d     => addr_d,
	                           immed      => immed,
	                           wr_m       => wr_m_t,
	                           in_d       => in_d,
	                           immed_x2   => immed_x2,
										addr_io    => addr_io, 
			                     rd_in      => rd_in, 
			                     wr_out     => deco_wr_out,
										a_sys      => a_sys,
			                     d_sys      => d_sys,
										op_sys     => op_sys,
	                           word_byte  => w_b_t,
										is_acc_m   => is_acc_m,
										is_getiid  => deco_is_getiid,
										excp_illegal_ir => excp_illegal_ir,
										excp_ir_protect => excp_ir_protect,
										excp_calls => deco_excp_calls);
										
	 m0 : multi PORT MAP(clk        =>  clk,
	                     boot       =>  boot,
	                     tknbr_in   =>  deco_tknbr,
	                     wrd_l      =>  wrd_t,
	                     wr_m_l     =>  wr_m_t,
	                     w_b        =>  w_b_t,
								int_en     =>  int_en,
								intr       =>  intr,
								excp       =>  excp,
								wr_out_in  =>  deco_wr_out,
								excp_calls =>  deco_excp_calls,
								wr_out_out =>  wr_out,
								int_excp   =>  m0_int_excp,
								is_getiid  =>  deco_is_getiid,
								int        =>  m0_int,
					         inta       =>  inta,
	                     tknbr_out  =>  tknbr,
	                     wrd        =>  wrd,
	                     wr_m       =>  wr_m,
	                     ldir       =>  ldir_o,
	                     ins_dad    =>  ins_dad,
	                     word_byte  =>  word_byte);
	


	 pc_d <= 	PC_INI when boot  = '1' else pc_in;
					
	 -- pc_new <= pc_tmp when rising_edge(clk);
	 
	 pc_out <= pc_q(15 DOWNTO 1) & '0';
	 
	 ir_d     <= 	x"0000"    when boot = '1'    else
				      datard_m   when ldir_o = '1'  else  
				      ir_q;
					
	 -- ir_reg <=  ir when rising_edge(clk);
	 
	 process (clk) begin
		if rising_edge(clk) then
			pc_q <= pc_d;
			ir_q <= ir_d;
		end if;
	 end process;
	 

END Structure;
