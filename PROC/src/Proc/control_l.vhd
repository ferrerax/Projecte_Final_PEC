LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

library work;
use work.sisa16_coop_funct_pkg.all;
use work.cte_tipos_UC_pkg.all;
use work.cte_tipos_UF_pkg.all;

ENTITY control_l IS
 PORT (ir              : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
       z               : IN  STD_LOGIC;
		 int             : IN  STD_LOGIC;
		 int_excp        : IN  STD_LOGIC;
		 mode_sys        : IN  STD_LOGIC;
       tknbr           : OUT STD_LOGIC_VECTOR(1  DOWNTO 0);
       op              : OUT STD_LOGIC_VECTOR(tam_codigo_alu_op-1 DOWNTO 0);
       Rb_N            : OUT STD_LOGIC;
    	 wrd             : OUT STD_LOGIC;
    	 addr_a          : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
    	 addr_b          : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
    	 addr_d          : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
    	 immed           : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    	 wr_m            : OUT STD_LOGIC;
    	 in_d            : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
    	 immed_x2        : OUT STD_LOGIC;
		 addr_io         : OUT STD_LOGIC_VECTOR(7 downto 0);
		 rd_in           : OUT STD_LOGIC;
	    wr_out          : OUT STD_LOGIC;
		 a_sys           : OUT STD_LOGIC;
		 d_sys           : OUT STD_LOGIC;
		 op_sys          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    	 word_byte       : OUT STD_LOGIC;
		 excp_illegal_ir : OUT STD_LOGIC;
		 excp_ir_protect : OUT STD_LOGIC;
		 excp_calls      : OUT STD_LOGIC;
		 is_acc_m        : OUT STD_LOGIC;
		 is_getiid       : OUT STD_LOGIC);
END control_l;


ARCHITECTURE Structure OF control_l IS
	signal coop : codigooper;
	
	signal f1 :   campofunct1;
	signal f3 :   campofunct3;
	signal f5 :   campofunct5;
	
	signal immed_6 :   std_logic_vector(5 downto 0);
	signal immed_8 :   std_logic_vector(7 downto 0);
	
	signal br_si_t  : std_logic;
	signal jmp_si_t : std_logic;
	
	signal excp_ir_protect_t : std_logic;
	
BEGIN
	
	coop    <= ir(15 downto 16-tamcoop);
	f1      <= ir(8);
	f3      <= ir(2  downto 0) when coop = COOP_JMP else 
	           ir(5  downto 3);
   f5      <= ir(4  downto 0);
	immed_6 <= ir(5  downto 0);
	immed_8 <= ir(7  downto 0);
	
	excp_illegal_ir <= '0' when coop = COOP_AL    or
										 coop = COOP_CMP   or
										 coop = COOP_ADDI  or
										 coop = COOP_LD    or
										 coop = COOP_ST    or
										 coop = COOP_MOV   or
										 coop = COOP_BR    or
										 coop = COOP_IO    or
										 coop = COOP_EA    or
										 coop = COOP_JMP   or
										 coop = COOP_LDB   or
										 coop = COOP_STB   or
										 coop = COOP_INT   else '1';

	excp_ir_protect <= excp_ir_protect_t;
										 
	excp_ir_protect_t <= '1' when  coop = COOP_INT and 
							 			    f5 /= F5_HALT   and
							 	          mode_sys = '0'  else '0';
																	  	
	op <= ALU_X      when  coop = COOP_JMP
	                   or  int  = '1'
			             or (coop = COOP_INT  and (f5 = F5_RDS  
							                       or  f5 = F5_WRS
														  or  f5 = F5_RETI
														  or  f5 = F5_CALLS))else
			ALU_MOVHI  when  coop = COOP_MOV  and  f1 = F1_MOVHI  else
			ALU_Y      when  coop = COOP_MOV  and  f1 = F1_MOVI   else
			ALU_ADD    when  coop = COOP_LD   
			             or  coop = COOP_ST 
			             or  coop = COOP_LDB  
					       or  coop = COOP_STB
							 or  coop = COOP_ADDI 
							 or (coop = COOP_AL   and  f3 = F3_ADD)   else
			ALU_CMPLT  when  coop = COOP_CMP  and  f3 = F3_CMPLT  else
			ALU_CMPLE  when  coop = COOP_CMP  and  f3 = F3_CMPLE  else
			ALU_CMPLEQ when  coop = COOP_CMP  and  f3 = F3_CMPLEQ else
			ALU_CMPLTU when  coop = COOP_CMP  and  f3 = F3_CMPLTU else
			ALU_CMPLEU when  coop = COOP_CMP  and  f3 = F3_CMPLEU else
			ALU_AND    when  coop = COOP_AL   and  f3 = F3_AND    else
			ALU_OR     when  coop = COOP_AL   and  f3 = F3_OR     else
			ALU_XOR    when  coop = COOP_AL   and  f3 = F3_XOR    else
			ALU_NOT    when  coop = COOP_AL   and  f3 = F3_NOT    else
			ALU_SUB    when  coop = COOP_AL   and  f3 = F3_SUB    else
			ALU_SHA    when  coop = COOP_AL   and  f3 = F3_SHA    else
			ALU_SHL    when  coop = COOP_AL   and  f3 = F3_SHL    else
			ALU_MUL    when  coop = COOP_EA   and  f3 = F3_MUL    else
			ALU_MULH   when  coop = COOP_EA   and  f3 = F3_MULH   else
			ALU_MULHU  when  coop = COOP_EA   and  f3 = F3_MULHU  else
			ALU_DIV    when  coop = COOP_EA   and  f3 = F3_DIV    else
			ALU_DIVU   when  coop = COOP_EA   and  f3 = F3_DIVU   else
			(others => '0');
	
	Rb_N <= '0' when coop = COOP_AL
	              or coop = COOP_CMP
	              or coop = COOP_EA
	              or coop = COOP_BR 
	              or coop = COOP_JMP else '1';
					  
	wrd <= PE and (not excp_ir_protect_t) when 
						coop = COOP_MOV  or
	               coop = COOP_LD   or
	               coop = COOP_LDB  or
	               coop = COOP_AL   or
	               coop = COOP_CMP  or
	               coop = COOP_ADDI or
	               coop = COOP_EA   or
					   coop = COOP_INT  or
					  (coop = COOP_IO   and  f1  = F1_IN)      or
	              (coop = COOP_JMP  and (f3  = F3_JAL
												or  f5  = F5_CALLS))     else not PE;
			 
	addr_a <= "101"           when  int  = '1' else
	          "001"           when  coop = COOP_INT and  f5 = F5_RETI else
	          ir(11 downto 9) when  coop = COOP_MOV else
	          ir(8  downto 6) when  coop = COOP_LD
	                            or  coop = COOP_ST
	                            or  coop = COOP_LDB
	                            or  coop = COOP_STB
	                            or  coop = COOP_JMP else ir(8  downto 6);
				 
	addr_b <= ir(11 downto 9) when coop = COOP_ST
	                            or coop = COOP_STB 
	                            or coop = COOP_BR
										 or coop = COOP_IO 
	                            or coop = COOP_JMP else
            ir(2  downto 0)  when coop = COOP_AL   
                               or coop = COOP_CMP 
                               or coop = COOP_EA  else (others => '0');
				 
	addr_d <= "011"           when coop = COOP_JMP and f5 = F5_CALLS else 
				  ir(11 downto 9);
	
	addr_io <= immed_8;

	rd_in  <= '1' when coop = COOP_IO and f1 = F1_IN  else '0';
	wr_out <= PE and (not excp_ir_protect_t) when coop = COOP_IO and f1 = F1_OUT else '0';

	immed <= std_logic_vector(resize(signed(immed_8), immed'length)) when coop = COOP_MOV 
	                                                                   or coop = COOP_IO
				                                                          or coop = COOP_BR else
		      std_logic_vector(resize(signed(immed_6), immed'length)) when coop = COOP_ST 
				                                                          or coop = COOP_LD
				                                                          or coop = COOP_STB 
				                                                          or coop = COOP_LDB
				                                                          or coop = COOP_ADDI;

	wr_m <= PE and (not excp_ir_protect_t) when coop = COOP_ST  or
															coop = COOP_STB else
			  not PE;
			  
	in_d <= REGFILE_D_PC_NEXT when int = '1'        else -- MUST BE THE FIRST
           REGFILE_D_PC_2    when  coop = COOP_JMP 
										and  f5  /= F5_CALLS else 
			  REGFILE_D_MEM     when  coop = COOP_LD 
	                            or  coop = COOP_LDB else
			  REGFILE_D_IO      when  coop = COOP_IO   
			                      or (coop = COOP_INT and f5 = F5_GETIID) else
			  REGFILE_D_ALU;
			  
	immed_x2 <= '1' when coop = COOP_LD 
	                  or coop = COOP_ST 
	                  or coop = COOP_BR else '0';
	
	word_byte <= '1' when coop = COOP_LDB else
	             '1' when coop = COOP_STB else '0';
	
	br_si_t  <= '1' when (f1 = F1_BNZ and z = '0')
	                  or (f1 = F1_BZ  and z = '1')  else '0';
							
	jmp_si_t <= '1' when (f3 = F3_JNZ and z = '0') 
                     or (f3 = F3_JZ  and z = '1')
                     or  f3 = F3_JMP               
                     or  f3 = F3_JAL               else '0';
							
--	ldpc <= haltSI when ir(15 downto 0) = x"FFFF" else '1';
	tknbr <= JMP_SI   when  int  = '1'
		    	           or (coop = COOP_JMP  and jmp_si_t = '1')     
				           or (coop = COOP_INT  and f5       = F5_RETI) else
				BR_SI    when  coop = COOP_BR   and br_si_t  = '1'      else 
	         PC_BLOQ  when  coop = COOP_INT  and f5       = F5_HALT  else
				PC_INCR;
				
	a_sys  <= '1'  when  int = '1'
	                 or (coop = COOP_INT and (f5 = F5_RDS
						  							  or  f5 = F5_RETI))   else '0';
	
	d_sys  <= '1'  when (coop = COOP_INT and  (f5 = F5_WRS
													  or   f5 = F5_RETI
													  or   f5 = F5_DI
													  or   f5 = F5_EI
													  or   f5 = F5_HALT))
						  or (coop = COOP_JMP and   f5 = F5_CALLS)   else int;
	
	op_sys <= OP_SYS_EXCP   when int  = '1'      and  int_excp = '1' else
				 OP_SYS_INT    when int  = '1'                          else
				 OP_SYS_EI     when coop = COOP_INT and  f5 = F5_EI     else
	          OP_SYS_DI     when coop = COOP_INT and (f5 = F5_DI
																 or  f5 = F5_HALT)  else 
				 OP_SYS_RETI   when coop = COOP_INT and  f5 = F5_RETI   else
				 OP_SYS_NORMAL ;
				 
	is_getiid  <= '1' when coop = COOP_INT and f5 = F5_GETIID else '0';
	
	excp_calls <= '1' when coop = COOP_JMP and f5 = F5_CALLS  else '0';
	
	is_acc_m <= '1' when coop = COOP_ST  or 
	                     coop = COOP_LD  or 
								coop = COOP_LDB or
								coop = COOP_STB else
				   '0';
	
END Structure;
