library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity timer_controller is
    Port (CLOCK_50   : in    STD_LOGIC;
          boot       : in    STD_LOGIC;
			 inta       : in    STD_LOGIC;
			 intr       : out   STD_LOGIC);
end timer_controller;


ARCHITECTURE Structure OF timer_controller IS

component clock IS
	 GENERIC(N     : integer);
	 PORT(CLOCK_50 : IN  std_logic;
		   contador : in  std_logic_vector (N-1 downto 0);
		   clk      : out std_logic);
END component;

type state_type is (IDL, BLOQ);

signal state          : state_type := IDL;
signal clock_20hz_clk : std_logic;
signal clock_20hz_cnt : std_logic_vector(23 downto 0) := x"2625a0";
signal tick : std_logic;

BEGIN

	clock_20hz : clock generic map (clock_20hz_cnt'length)
					 port map (CLOCK_50 => CLOCK_50, contador => clock_20hz_cnt, clk => clock_20hz_clk);

	int_handdler : process (CLOCK_50, boot)
	begin
		if boot = '1' then
			intr <= '0';
			state <= IDL;
		elsif rising_edge(CLOCK_50) then	
			  case state is 
			    when BLOQ =>
					if inta = '1' then
						intr  <= '0';
						state <= IDL;
					end if;
			    when IDL =>
				   if tick = '1' then 
				     intr  <= '1';
				     state <= BLOQ;
					end if;
            end case;
		end if;
	end process;
	
	process (clock_20hz_clk, boot, state)
	begin
	 if boot = '1' or state = BLOQ then
	   tick <= '0';
	 elsif rising_edge(clock_20hz_clk) then
	   tick <= '1';
	 end if;
	
	end process;
						 
END Structure;
