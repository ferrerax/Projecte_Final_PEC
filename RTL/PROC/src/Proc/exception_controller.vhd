library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

library work;
use work.sisa16_coop_funct_pkg.all;

entity exception_controller is
    Port (clk             : in STD_LOGIC;
          boot            : in STD_LOGIC;
			 excp_div_cero   : in STD_LOGIC;
			 excp_mem_align  : in STD_LOGIC;
			 excp_illegal_ir : in STD_LOGIC;
			 excp_ir_protect : in STD_LOGIC;
			 excp_mem_protect: in STD_LOGIC;
			 excp_calls      : in STD_LOGIC;
		
			 codigo  : out  STD_LOGIC_VECTOR(3 downto 0);
			 excp    : out  STD_LOGIC);
end exception_controller;


ARCHITECTURE Structure OF exception_controller IS

BEGIN

 excp <= excp_div_cero    or 
         excp_mem_align   or 
         excp_calls       or 
         excp_ir_protect  or 
         excp_mem_protect or 
			  excp_illegal_ir;
			
 process (clk, boot) 
 begin
  if boot = '1' then
    codigo    <= x"0";
  elsif rising_edge(clk) then
      if excp_illegal_ir   = '1' then
        codigo <= EXCP_ID_ILLEGAL_IR;
      elsif excp_mem_align = '1' then
        codigo <= EXCP_ID_MEM_ALIGN;
      elsif excp_div_cero  = '1' then
        codigo <= EXCP_ID_DIV_ZERO;
      elsif excp_mem_protect  = '1' then
        codigo <= EXCP_ID_MEM_PROTECT;
      elsif excp_ir_protect = '1' then
        codigo <= EXCP_ID_IR_PROTECT;
		elsif excp_calls  = '1' then
        codigo <= EXCP_ID_CALLS;
      end if;
  end if;
 end process;

END Structure;
