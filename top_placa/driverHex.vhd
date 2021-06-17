LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE IEEE.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;

ENTITY driverHex IS
	PORT (
		num : IN std_logic_vector(15 DOWNTO 0);
		display_en : IN std_logic_vector(3 downto 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		HEX3 : OUT std_logic_vector(6 DOWNTO 0)
	);
END driverHex;
ARCHITECTURE Structure OF driverHex IS 
type num_map is ARRAY(0 to 15) of
    std_logic_vector(6 downto 0);
constant numword : num_map := ("1000000", -- "0"
										 "1111001", -- "1"
										 "0100100", -- "2"
										 "0110000", -- "3"
										 "0011001", -- "4"
										 "0010010", -- "5"
										 "0000010", -- "6"
										 "1111000", -- "7"
										 "0000000", -- "8"
										 "0010000", -- "9"
										 "0001000", -- "A"
										 "0000011", -- "b"
										 "1000110", -- "C"
										 "0100001", -- "d"
										 "0000110", -- "E"
										 "0001110"  -- "F"										 
										 ); 
constant off : std_logic_vector(6 downto 0) := "1111111";									
BEGIN

HEX0 <= numword(to_integer(unsigned(num(3 DOWNTO 0))))   when display_en(0) = '1' else off;
HEX1 <= numword(to_integer(unsigned(num(7 DOWNTO 4))))   when display_en(1) = '1' else off;
HEX2 <= numword(to_integer(unsigned(num(11 DOWNTO 8))))  when display_en(2) = '1' else off;
HEX3 <= numword(to_integer(unsigned(num(15 DOWNTO 12)))) when display_en(3) = '1' else off;

END Structure;