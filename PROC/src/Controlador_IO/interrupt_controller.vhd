library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity interrupt_controller is
    Port (clk         : in   STD_LOGIC;
          boot        : in   STD_LOGIC;
			 inta        : in   STD_LOGIC;
			 key_intr    : in   STD_LOGIC;
			 ps2_intr    : in   STD_LOGIC;
			 switch_intr : in   STD_LOGIC;
			 timer_intr  : in   STD_LOGIC;
			 
			 intr        : out  STD_LOGIC;
			 key_inta    : out  STD_LOGIC;
			 ps2_inta    : out  STD_LOGIC;
			 switch_inta : out  STD_LOGIC;
			 timer_inta  : out  STD_LOGIC;
			 iid         : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end interrupt_controller;


ARCHITECTURE Structure OF interrupt_controller IS

BEGIN

 intr <= key_intr or ps2_intr or switch_intr or timer_intr;
 process (clk, boot) 
 begin
  if boot = '1' then
   -- intr        <= '0';
    key_inta    <= '0';
    ps2_inta    <= '0';
    switch_inta <= '0';
    timer_inta  <= '0';
	 
  elsif rising_edge(clk) then
    if inta = '1' then
      if timer_intr = '1' then
        iid <= x"00";
        timer_inta <= '1';
      elsif key_intr = '1' then
        iid <= x"01";
        key_inta <= '1';
      elsif switch_intr = '1' then
        iid <= x"02";
        switch_inta <= '1';
      elsif ps2_intr = '1' then 
        iid <= x"03";
        ps2_inta <= '1';
      end if;
    else
      timer_inta  <= '0';
      key_inta    <= '0';
      switch_inta <= '0';
      ps2_inta    <= '0';
    end if;
  end if;
 end process;

END Structure;