library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity pulsadores_controller is
    Port (clk        : in    STD_LOGIC;
          boot       : in    STD_LOGIC;
			 inta       : in    STD_LOGIC;
			 keys       : in    STD_LOGIC_VECTOR(3 DOWNTO 0);
			 intr       : out   STD_LOGIC;
			 read_key   : out   STD_LOGIC_VECTOR(3 DOWNTO 0));
end pulsadores_controller;


ARCHITECTURE Structure OF pulsadores_controller IS

type state_type is (IDL, BLOQ);

signal state  : state_type := IDL;
signal keys_d : std_logic_vector(3 downto 0);
signal keys_q : std_logic_vector(3 downto 0);

BEGIN

	keys_d   <= keys;
	read_key <= keys_q;
	
	
	next_state: process (clk, boot)
	begin
		
		if boot = '1' then
			intr <= '0';
			state <= IDL;
		elsif rising_edge(clk) then	
			case state is 
				when BLOQ =>
					if inta = '1' then 
						if (keys_d = keys_q) then
							intr <= '0';
							state <= IDL;
						else
							keys_q <= keys_d;
						end if;
					end if;
				when IDL =>
					if not (keys_d = keys_q) then
						intr <= '1';
						keys_q <= keys_d;
						state <= BLOQ;
					end if;
			end case;
		end if;
	
end process;

END Structure;			 
