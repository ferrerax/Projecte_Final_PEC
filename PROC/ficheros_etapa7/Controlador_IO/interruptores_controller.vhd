library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity interruptores_controller is
    Port (clk        : in    STD_LOGIC;
          boot       : in    STD_LOGIC;
			 inta       : in    STD_LOGIC;
			 switches   : in    STD_LOGIC_VECTOR(7 DOWNTO 0);
			 intr       : out   STD_LOGIC;
			 rd_switch  : out   STD_LOGIC_VECTOR(7 DOWNTO 0));
end interruptores_controller;


ARCHITECTURE Structure OF interruptores_controller IS

type state_type is (IDL, BLOQ);
signal state      : state_type := IDL;
signal switches_d : std_logic_vector(7 downto 0);
signal switches_q : std_logic_vector(7 downto 0);

BEGIN

	switches_d   <= switches;
	rd_switch    <= switches_q;
	
	
	next_state: process (clk, boot)
	begin
		
		if boot = '1' then
			intr <= '0';
			state <= IDL;
		elsif rising_edge(clk) then	
			case state is 
				when BLOQ =>
					if inta = '1' then 
						if (switches_d = switches_q) then
							intr <= '0';
							state <= IDL;
						else
							switches_q <= switches_d;
						end if;
					end if;
				when IDL =>
					if not (switches_d = switches_q) then
						intr <= '1';
						switches_q <= switches_d;
						state <= BLOQ;
					end if;
			end case;
		end if;
	
	end process; 
END Structure;
