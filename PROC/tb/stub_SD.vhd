--------------------------------------------------------------------------------
-- Company: 
-- Engineer:      Lawrence Wilkinson
--
-- Create Date:   23:40:51 03/14/2013
-- Design Name:   SD_SPI
-- Module Name:   testbench_sd_spi.vhd
-- Project Name:  ibm2030
-- Target Device:  
-- Tool versions:  
-- Description:   Testbench for SD Card controller via SPI
-- 
-- VHDL Test Bench Created by ISE for module: sd_spi
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- 
-- 
-- 
-- 
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE STD.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY stub_SD IS
	PORT (CLOCK_50 : IN std_logic;
			SD_CLK  : IN std_logic; -- sclk 
			SD_CMD  : IN std_logic; -- mosi
			SD_DAT  : OUT  std_logic; -- miso
			SD_DAT3 : IN std_logic -- ss_n
       );
END stub_SD;
 
ARCHITECTURE behavior OF stub_SD IS 
 
   --Inputs
   signal miso : std_logic := '0';
   signal rd : std_logic := '0';
   signal rd_multiple : std_logic := '0';
   signal wr : std_logic := '0';
   signal wr_multiple : std_logic := '0';
   signal dout_taken : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cs : std_logic;
   signal mosi : std_logic;
   signal sclk : std_logic;
   signal sd_state : std_logic_vector(1 downto 0);
   signal sd_fsm : std_logic_vector(7 downto 0);
	signal sd_error : std_logic;
	signal sd_error_code : std_logic_vector(2 downto 0);
	signal sd_busy : std_logic;
   signal din_taken : std_logic;
   signal dout : std_logic_vector(7 downto 0);
   signal dout_avail : std_logic;

   -- Clock period definitions
--   constant sclk_period : time := 1000 ns;
   constant clk_period : time := 20 ns;
	
	signal clocks : integer := 0;
 
constant CPOL : std_logic := '0';
signal clk_pol : std_logic;

constant byteArraySize : integer := 50000;

signal rx_byte : std_logic_vector(7 downto 0);
signal rx_bit_counter : integer := 0;
signal rx_byte_counter : integer := 0;

signal tx_byte : std_logic_vector(7 downto 0);
signal tx_bit_counter : integer := 0;
signal tx_byte_counter : integer := 0;


type byte2_array is array(0 to byteArraySize) of std_logic_vector(15 downto 0);

shared variable input_output_bytes  : byte2_array := (
	-- The following list of words defines what the card expects to receive and
	-- what it should generate in response.
	--
	-- The SPI link transmits and receives a byte simultaneously, so the following tables
	-- give the byte expected to be sent to the card by the interface and the byte which
	-- is simultaneously transmitted back to the interface.
	--
	-- A word is x"RRTT" RR=Expected received byte, TT=Simultaneously transmitted byte
	-- A "FF" as the expected received byte means "Don't care"
	--
	-- The test sequence is as follows, driven by stim_proc below:
	-- CMD0  Reset
	-- CMD8  Set interface
	-- CMD55/ACMD41 Send operating conditions
	-- CMD55/ACMD41 Send operating conditions
	-- CMD58 Read OCR
	-- CMD59 Set CRC
	-- CMD17 Read
	-- CMD17 Read
	-- CMD18 Read multiple
	-- CMD18 Read multiple stopped
	-- CMD55/ACMD23 Set Write Block Erase Count
	-- CMD24 Write
	-- CMD55/ACMD23 Set Write Block Erase Count
	-- CMD25 Write multiple
	-- CMD55/ACMD23 Set Write Block Erase Count
	-- CMD25 Write multiple with error
	
	-- CMD0 FF400000000095
	x"FFFF", -- 0
	x"40FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"95FF",
	x"FFFF", -- Wait
	x"FF01", -- R1 b7=0
	
	-- CMD8 FF48000001AA87
	x"FFFF", -- 9
	x"48FF",
	x"00FF",
	x"00FF",
	x"01FF",
	x"AAFF",
	x"87FF",
	x"FFFF", -- Wait
	x"FF01", -- R7
	x"FF00",
	x"FF00",
	x"FF01",
	x"FFAA",
	
	-- CMD55 FF770000000001
	x"FFFF", -- 22
	x"77FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"65FF",
	x"FFFF", -- Wait
	x"FF01", -- R1 IDLE=1
	
	-- CMD41 FF690000004001
	x"FFFF", -- 31
	x"69FF",
	x"40FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"77FF",
	x"FFFF", -- Wait
	x"FF01", -- R1 IDLE=1

	-- CMD55 FF770000000001
	x"FFFF", -- 40
	x"77FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"65FF",
	x"FFFF", -- Wait
	x"FF01", -- R1 IDLE=1
	
	-- CMD41 FF690000004001
	x"FFFF", -- 49
	x"69FF",
	x"40FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"77FF",
	x"FFFF", -- Wait
	x"FF00", -- R1 IDLE=0

	-- CMD58 FF7A0000000001
	x"FFFF", -- 58
	x"7AFF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"FDFF",
	x"FFFF", -- Wait
	x"FF00", -- R3 IDLE=0
	x"FF40", -- OCR b30=1 => SDHC
	x"FF00",
	x"FF00",
	x"FF00",
	
	-- CMD59 FF7B0000000101 (Enable CRC)
	x"FFFF", -- 71
	x"7BFF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"01FF",
	x"83FF",
	x"FFFF", -- Wait
	x"FF00", -- R1 IDLE=0
	x"FFFF", -- IDLE
	
	-- CMD17 FF510000000055
	x"FFFF", -- 80
	x"51FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"00FF",
	x"55FF",
	x"FFFF", -- Wait
	x"FF00", -- R1 IDLE=0
	x"FFFF", -- Token
	x"FFFF", -- Token
	x"FFFE", -- Token
x"ff7f",x"ff45",x"ff4c",x"ff46",x"ff01",x"ff01",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff01",x"ff00",x"ffce",x"ff89",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff68",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff00",x"ff00",x"ff34",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff28",x"ff00",
x"ff07",x"ff00",x"ff04",x"ff00",x"ff01",x"ff52",x"ff06",x"ff73",x"ffff",x"ffff",x"ff00",x"ff2e",x"ff73",x"ff79",x"ff6d",x"ff74",
x"ff61",x"ff62",x"ff00",x"ff2e",x"ff73",x"ff74",x"ff72",x"ff74",x"ff61",x"ff62",x"ff00",x"ff2e",x"ff73",x"ff68",x"ff73",x"ff74",
x"ff72",x"ff74",x"ff61",x"ff62",x"ff00",x"ff2e",x"ff74",x"ff65",x"ff78",x"ff74",x"ff00",x"ff2e",x"ff64",x"ff61",x"ff74",
x"ff61",x"ff00",x"ff2e",x"ff62",x"ff73",x"ff73",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff1b",x"ff00",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff06",x"ff00",x"ff00",x"ff00",x"ff00",x"ffc0",x"ff00",
x"ff00",x"ff34",x"ff00",x"ff00",x"ff00",x"ff06",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff21",x"ff00",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",
x"ff00",x"ff03",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff3a",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff27",x"ff00",x"ff00",x"ff00",x"ff08",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff3a",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff11",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff3a",x"ff00",x"ff00",x"ff00",x"ff2c",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff02",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff80",x"ff01",x"ff00",x"ff00",x"ff40",x"ff00",x"ff00",x"ff00",x"ff06",x"ff00",x"ff00",x"ff00",x"ff04",x"ff00",x"ff00",
x"ff00",x"ff04",x"ff00",x"ff00",x"ff00",x"ff10",x"ff00",x"ff00",x"ff00",x"ff09",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ffc0",x"ff01",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff01",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff01",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff02",
x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff00",x"ff03",x"ff00",x"ff03",
x"ff00",x"ff00",

	others=>x"FFFF");

function slv_to_string(slv: std_logic_vector) return string is
    use Std.TextIO.all;
    variable bv: bit_vector(slv'range) := to_bitvector(slv);
    variable cv: line;
  begin
    write(cv, bv);
    return cv.all;
  end;

BEGIN
 
  cs <= not SD_DAT3;
  SD_DAT  <= miso;
  mosi <= SD_CMD;
  clk <= CLOCK_50;
  sclk <= SD_CLK;
 
clk_pol <= sclk xor CPOL;

-- This process receives data sent to the card and compares it with the receive portion of the list
sd_card_rx: process (clk_pol,cs)
begin
if cs='1' then
	rx_bit_counter <= 0;
elsif rising_edge(clk_pol) then -- CPOL = 0, CPHA = 0
	rx_byte <= rx_byte(6 downto 0) & mosi;
	if rx_bit_counter=7 then
		rx_bit_counter <= 0;
		rx_byte_counter <= rx_byte_counter + 1;
		assert (rx_byte(6 downto 0) & mosi)=input_output_bytes(rx_byte_counter)(15 downto 8) or input_output_bytes(rx_byte_counter)(15 downto 8)="11111111"
					report "Receive at byte " & integer'image(rx_byte_counter) & ": Expected " & slv_to_string(input_output_bytes(rx_byte_counter)(15 downto 8)) & " received " &  slv_to_string(rx_byte(6 downto 0) & mosi);
	else
		rx_bit_counter <= rx_bit_counter + 1;
	end if;
end if;
end process;

-- This process generates data from the card based on the transmit portion of the list
sd_card_tx: process (clk_pol,cs,tx_byte)
begin
if cs='1' then
	tx_bit_counter <= 0;
  if tx_byte_counter > 81 then
	  tx_byte_counter <= 81;
  end if;
	tx_byte <= input_output_bytes(tx_byte_counter)(7 downto 0);
	miso <= '1';
else
	miso <= tx_byte(7); -- CPHA = 0
	if falling_edge(clk_pol) then -- CPOL = 0, CPHA = 0
		tx_byte <= tx_byte(6 downto 0) & '1';
		if tx_bit_counter=7 then
			tx_bit_counter <= 0;
			tx_byte_counter <= tx_byte_counter + 1;
			tx_byte <= input_output_bytes(tx_byte_counter + 1)(7 downto 0);
		else
			tx_bit_counter <= tx_bit_counter + 1;
		end if;
	end if;
end if;
end process;

END;
