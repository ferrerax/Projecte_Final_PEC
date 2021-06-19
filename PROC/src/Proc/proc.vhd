LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.cte_tipos_UF_pkg.all;

ENTITY proc IS
	PORT (
		clk       : IN  STD_LOGIC;
		boot      : IN  STD_LOGIC;
		rd_io     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		intr      : IN  STD_LOGIC;
		inta      : OUT STD_LOGIC;
		addr_m    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		data_wr   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_m      : OUT STD_LOGIC;
		word_byte : OUT STD_LOGIC;
		addr_io   : OUT STD_LOGIC_VECTOR(7 downto 0); 
		rd_in     : OUT STD_LOGIC; 
		int_en    : OUT STD_LOGIC;
		wr_io     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_out    : OUT STD_LOGIC
	);
END proc;


ARCHITECTURE Structure OF proc IS

    -- Aqui iria la declaracion de las entidades que vamos a usar
    -- Usaremos la palabra reservada COMPONENT ...
    -- Tambien crearemos los cables/buses (signals) necesarios para unir las entidades
	 COMPONENT datapath IS
		PORT (clk      : IN  STD_LOGIC;
				boot     : IN  STD_LOGIC;
			   op       : IN  STD_LOGIC_VECTOR(tam_codigo_alu_op-1 downto 0);
			   Rb_N     : IN  STD_LOGIC;
			   wrd      : IN  STD_LOGIC;
			   addr_a   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
			   addr_b   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
			   addr_d   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
			   immed    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			   immed_x2 : IN  STD_LOGIC;
			   datard_m : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			   ins_dad  : IN  STD_LOGIC;
			   pc_in    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			   in_d     : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
			   tknbr    : IN  STD_LOGIC_VECTOR(1  DOWNTO 0);
				rd_io    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
				a_sys    : IN  STD_LOGIC;
			   d_sys    : IN  STD_LOGIC;
				op_sys   : IN  STD_LOGIC_VECTOR(2  DOWNTO 0);
				excp_codigo : IN STD_LOGIC_VECTOR(3  DOWNTO 0);
				int_en   : OUT STD_LOGIC;
				mode_sys : OUT STD_LOGIC;
			   pc_out   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			   addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				wr_io    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			   data_wr  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			   z        : OUT STD_LOGIC;
				excp_div_zero : OUT STD_LOGIC); 
	END COMPONENT;
	
	COMPONENT unidad_control IS
	PORT (
		boot       : IN  STD_LOGIC;
		clk        : IN  STD_LOGIC;
		datard_m   : IN  STD_LOGIC_VECTOR(15   DOWNTO 0);
		z          : IN  STD_LOGIC;
		pc_in      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		int_en     : IN  STD_LOGIC;
		intr       : IN  STD_LOGIC;
		excp       : IN  STD_LOGIC;
		mode_sys    : IN  STD_LOGIC;
		inta       : OUT STD_LOGIC;
		pc_out     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		immed      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		op         : OUT STD_LOGIC_VECTOR(tam_codigo_alu_op-1 DOWNTO 0);
		addr_b     : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		Rb_N       : OUT STD_LOGIC;
		tknbr      : OUT STD_LOGIC_VECTOR(1  DOWNTO 0);
		wrd        : OUT STD_LOGIC;
		wr_m       : OUT STD_LOGIC;
		rd_in      : OUT STD_LOGIC;
		d_sys      : OUT STD_LOGIC;
		ins_dad    : OUT STD_LOGIC;
		in_d       : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		immed_x2   : OUT STD_LOGIC;
		addr_a     : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		addr_d     : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		wr_out     : OUT STD_LOGIC;
		addr_io    : OUT STD_LOGIC_VECTOR(7   DOWNTO 0);
		op_sys     : OUT STD_LOGIC_VECTOR(2   DOWNTO 0);
		a_sys      : OUT STD_LOGIC;
		is_acc_m  : OUT STD_LOGIC;
		excp_illegal_ir : OUT STD_LOGIC;
		word_byte  : OUT STD_LOGIC;
		excp_ir_protect : OUT STD_LOGIC;
		excp_calls      : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT exception_controller IS
   PORT (clk             : in STD_LOGIC;
         boot            : in STD_LOGIC;
		   excp_div_cero   : in STD_LOGIC;
		   excp_mem_align  : in STD_LOGIC;
		   excp_illegal_ir : in STD_LOGIC;
			excp_ir_protect : in STD_LOGIC;
			excp_mem_protect: in STD_LOGIC;
			excp_calls      : in STD_LOGIC;
		   codigo  : out  STD_LOGIC_VECTOR(3 downto 0);
			excp    : out  STD_LOGIC);
	END COMPONENT;


	signal w2w          : STD_LOGIC;
	signal insd2insd    : STD_LOGIC;
	signal ix2ix        : STD_LOGIC;
	signal ind2ind      : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal rb2rb        : STD_LOGIC;
	signal z2z          : STD_LOGIC;
	signal as2as        : STD_LOGIC;
	signal ds2ds        : STD_LOGIC;
	signal o2o          : STD_LOGIC_VECTOR(tam_codigo_alu_op-1 DOWNTO 0);
	signal a2a          : STD_LOGIC_VECTOR(2  DOWNTO 0);
	signal b2b          : STD_LOGIC_VECTOR(2  DOWNTO 0);
	signal d2d          : STD_LOGIC_VECTOR(2  DOWNTO 0);
	signal i2i          : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal e0_pc_out    : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal e0_addr_m    : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal e0_int_en    : STD_LOGIC;
	signal e0_mode_sys    : STD_LOGIC;
	signal e0_excp_div_zero : STD_LOGIC;
	
	
	signal c0_op_sys    : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal c0_pc_out    : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal c0_tknbr_out : STD_LOGIC_VECTOR(1  DOWNTO 0);
	signal c0_int       : STD_LOGIC;
	signal c0_excp_illegal_ir : STD_LOGIC;
	signal c0_excp_ir_protect : STD_LOGIC;
	signal c0_excp_calls : STD_LOGIC;
	signal c0_word_byte : STD_LOGIC;
	signal c0_is_acc_m  : STD_LOGIC;	
	
	signal excp_codigo : STD_LOGIC_VECTOR(3 downto 0);
	signal excp_mem_align: STD_LOGIC;
	signal excp_mem_protect: STD_LOGIC;
	signal excp : STD_LOGIC;
	

BEGIN

    -- Aqui iria la declaracion del "mapeo" (PORT MAP) de los nombres de las entradas/salidas de los componentes
    -- En los esquemas de la documentacion a la instancia del DATAPATH le hemos llamado e0 y a la de la unidad de control le hemos llamado c0
	 int_en <= e0_int_en;
	 
	 c0 : unidad_control PORT MAP(boot      => boot,
	                              clk       => clk,
	                              datard_m  => datard_m,
	                              op        => o2o,
	                              Rb_N      => rb2rb,
	                              z         => z2z,
	                              wrd       => w2w,
	                              tknbr     => c0_tknbr_out,
	                              addr_a    => a2a,
	                              addr_b    => b2b,
	                              addr_d    => d2d,
	                              immed     => i2i,
	                              immed_x2  => ix2ix,
	                              pc_in     => e0_pc_out,
											int_en    => e0_int_en,
                                 intr      => intr,
											excp      => excp,
											mode_sys   => e0_mode_sys,
									      inta      => inta,
	                              pc_out    => c0_pc_out,
	                              ins_dad   => insd2insd,
	                              in_d      => ind2ind,
	                              wr_m      => wr_m,
											addr_io   => addr_io,
			                        rd_in     => rd_in,
			                        wr_out    => wr_out,
							          	a_sys     => as2as,
									      d_sys     => ds2ds,
											op_sys    => c0_op_sys,
											is_acc_m  => c0_is_acc_m,
	                              word_byte => c0_word_byte,
											excp_illegal_ir => c0_excp_illegal_ir,
											excp_ir_protect => c0_excp_ir_protect,
											excp_calls => c0_excp_calls);
											
	 e0 : datapath PORT MAP(clk       => clk,
									boot      => boot,
	                        op        => o2o,
	                        Rb_N      => rb2rb,
	                        z         => z2z,
	                        wrd       => w2w,
	                        addr_a    => a2a,
	                        addr_b    => b2b,
	                        addr_d    => d2d,
	                        immed     => i2i,
	                        immed_x2  => ix2ix,
	                        datard_m  => datard_m,
	                        ins_dad   => insd2insd,
	                        pc_in     => c0_pc_out,
	                        pc_out    => e0_pc_out,
									rd_io     => rd_io,
									wr_io     => wr_io,
									a_sys     => as2as,
									d_sys     => ds2ds,
									op_sys    => c0_op_sys,
									excp_codigo => excp_codigo,
									int_en    => e0_int_en,
									mode_sys  => e0_mode_sys,
	                        in_d      => ind2ind,
	                        tknbr     => c0_tknbr_out,
	                        addr_m    => e0_addr_m,
	                        data_wr   => data_wr,
									excp_div_zero => e0_excp_div_zero);
												 
		addr_m <= e0_addr_m;
		word_byte <= c0_word_byte;
		
		--excp_mem_align <= (e0_addr_m(0) and (not c0_word_byte)); 			
      excp_mem_align <= c0_pc_out(0) or (e0_addr_m(0) and (not c0_word_byte) and c0_is_acc_m); 
      excp_mem_protect <= 
			not e0_mode_sys when c0_pc_out  >= x"8000" or            
		                       (c0_is_acc_m	= '1'	and ((e0_addr_m >= x"8000" and e0_addr_m < x"A000") or
																	   e0_addr_m >=  x"B2C0")) else '0';
																	  
		excp_ctrl: exception_controller port map (clk              => clk,
                                                boot             => boot,
		                                          excp_div_cero    => e0_excp_div_zero,
		                                          excp_mem_align   => excp_mem_align,
		                                          excp_illegal_ir  => c0_excp_illegal_ir,
																excp_mem_protect => excp_mem_protect,
																excp_ir_protect  => c0_excp_ir_protect,
																excp_calls       => c0_excp_calls,
		                                          codigo           => excp_codigo,
			                                       excp             => excp);

END Structure;
