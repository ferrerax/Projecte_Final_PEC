LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE IEEE.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;

ENTITY sd_driver IS
	PORT (CLOCK_50 : IN std_logic;
			SD_CLK  : OUT std_logic; -- sclk 
			SD_CMD  : OUT std_logic; -- mosi
			SD_DAT  : IN  std_logic; -- miso
			SD_DAT3 : OUT std_logic; -- ss_n
			
			--Ports del controlador.
			addr  : IN std_logic_vector(15 downto 0);
			rd    : IN std_logic;
			data  : OUT std_logic_vector(15 downto 0) := (others => '0');
			valid : OUT std_logic;
			reset : IN std_logic
			
	);
END sd_driver;

ARCHITECTURE Structure OF sd_driver IS 

COMPONENT sd_controller is
generic (
	clockRate : integer := 50000000;		-- Incoming clock is 50MHz (can change this to 2000 to test Write Timeout)
	slowClockDivider : integer := 64;	-- Basic clock is 25MHz, slow clock for startup is 25/64 = 390kHz
	R1_TIMEOUT : integer := 10;			-- Number of bytes to wait before giving up on receiving R1 response
	WRITE_TIMEOUT : integer range 0 to 999 := 500		-- Number of ms to wait before giving up on write completing
	);
port (
	cs : out std_logic;				-- To SD card
	mosi : out std_logic;			-- To SD card
	miso : in std_logic;			-- From SD card
	sclk : out std_logic;			-- To SD card
	card_present : in std_logic;	-- From socket - can be fixed to '1' if no switch is present
	card_write_prot : in std_logic;	-- From socket - can be fixed to '0' if no switch is present, or '1' to make a Read-Only interface

	rd : in std_logic;				-- Trigger single block read
	rd_multiple : in std_logic;		-- Trigger multiple block read
	dout : out std_logic_vector(7 downto 0);	-- Data from SD card
	dout_avail : out std_logic;		-- Set when dout is valid
	dout_taken : in std_logic;		-- Acknowledgement for dout
	
	wr : in std_logic;				-- Trigger single block write
	wr_multiple : in std_logic;		-- Trigger multiple block write
	din : in std_logic_vector(7 downto 0);	-- Data to SD card
	din_valid : in std_logic;		-- Set when din is valid
	din_taken : out std_logic;		-- Ackowledgement for din
			sd_type : out std_logic_vector(1 downto 0);
			sd_fsm : out std_logic_vector(7 downto 0);
			sd_error : out std_logic; -- '1' if an error occurs, reset on next RD or WR
			sd_error_code : out std_logic_vector(2 downto 0);
			erase_count : in std_logic_vector(7 downto 0);
	
	addr : in std_logic_vector(31 downto 0);	-- Block address

	sd_busy : out std_logic;		-- '0' if a RD or WR can be accepted
	
	
	reset : in std_logic;	-- System reset
	clk : in std_logic		-- twice the SPI clk (max 50MHz)
);
END COMPONENT;

COMPONENT sd_interface IS
    PORT ( addr  : IN std_logic_vector(15 downto 0);
			  rd    : IN std_logic;
			  busy : IN std_logic;
			  dout  : IN std_logic_vector(7 downto 0);
			  dout_avail : IN std_logic;
			  dout_taken : OUT std_logic;
			  data  : OUT std_logic_vector(15 downto 0) := (others => '0');
			  valid : OUT std_logic
);
END COMPONENT;

COMPONENT driverHex IS
	PORT (
		num : IN std_logic_vector(15 DOWNTO 0);
		display_en : IN std_logic_vector(3 downto 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		HEX3 : OUT std_logic_vector(6 DOWNTO 0)
	);
END COMPONENT;

--signal reset : std_logic;

--signal rd       : std_logic;
signal rd_debug : std_logic;
signal big_addr : std_logic_vector(31 downto 0);
--signal addr  : std_logic_vector(31 downto 0);
--signal data  : std_logic_vector(15 downto 0);
--signal valid : std_logic;

signal sd_busy    : std_logic;
signal dout       : std_logic_vector(7 downto 0);
signal dout_avail : std_logic;
signal dout_taken : std_logic;
signal cs         : std_logic;

signal sd_error : std_logic ;
signal sd_error_code : std_logic_vector(2 downto 0);
BEGIN

	SD_DAT3 <= not cs;
  big_addr <= x"0000" & addr;
	-- Instantiate the Unit Under Test (UUT)
   uut: sd_controller PORT MAP (
          cs => cs,
          mosi => SD_CMD,
          miso => SD_DAT,
          sclk => SD_CLK,
			 card_present => '1',
			 card_write_prot => '0',
       --    sd_type => sd_type,
       --    sd_fsm => sd_fsm,
			 sd_error => sd_error,
			 sd_error_code => sd_error_code,
			 sd_busy => sd_busy,
          rd => rd,
          rd_multiple => '0',
          wr => '0',
          wr_multiple => '0',
          addr => big_addr,
			    erase_count => "00000010",
          reset => reset,
          din => "00000000",
          din_valid => '0',
          --din_taken => '0',
          dout => dout,
          dout_avail => dout_avail,
          dout_taken => dout_taken,
          clk => CLOCK_50
        );
		sd_drv: sd_interface PORT MAP (addr  => addr(15 downto 0),
																rd => rd,
																busy => sd_busy,
																dout => dout,
																dout_avail => dout_avail,
																dout_taken => dout_taken,
																data  => data,
																valid => valid);
																
		--LEDG <= sd_error_code;

END Structure;
