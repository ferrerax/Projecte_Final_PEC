library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
--use work.de0_nano_const_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use XESS.CommonPckg.all;


---- vhdl_lib
--use work.vhdl_lib_pkg.count_bin;
--use work.vhdl_lib_pkg.count_int;
--use work.vhdl_lib_pkg.debounce;
--use work.vhdl_lib_pkg.ff_rs;
--use work.vhdl_lib_pkg.one_shot;
--use work.vhdl_lib_pkg.prescaler;
--use work.vhdl_lib_pkg.pwm_unit;
--use work.vhdl_lib_pkg.reset_unit;
--use work.vhdl_lib_pkg.rotary;
--use work.vhdl_lib_pkg.sweep_unit;
--use work.vhdl_lib_pkg.tick_extend;
--use work.vhdl_lib_pkg.toggle_unit;

-- sd
--use work.sd_const_pkg.all;
--use work.sd_pkg.simple_sd;

entity sd_test is
	port(
	CLOCK_50			: in  std_logic;
	--	===========================================
	-- Connections to SD-Card Shield
	--	===========================================
	SD_CLK	: out		std_ulogic;
	SD_CMD	: inout std_logic;
	SD_DAT	: inout std_logic;
	SD_DAT3  : out std_logic;
	------------------
	-- sd_wp		: in std_ulogic;
	-- sd_cd		: in std_ulogic;
	------------------
	LEDG		: out std_ulogic_vector(7 downto 0);
	LEDR		: out std_ulogic_vector(3 downto 0);
	-- KEY		: in std_ulogic_vector(3 downto 0);
	--	===========================================
	--	===========================================
	-- std IO for debugging purpose
	KEY			: in  std_ulogic_vector(3 downto 0);
	SW  			: in  std_ulogic_vector(3 downto 0);
	HEX0			: out std_logic_vector(6 downto 0);
	HEX1			: out std_logic_vector(6 downto 0);
	HEX2			: out std_logic_vector(6 downto 0);
	HEX3			: out std_logic_vector(6 downto 0)
);
end sd_test;

ARCHITECTURE Structure OF sd_test IS 

	signal byte : std_LOGIC_VECTOR(7 downto 0);
  signal byte_llarg : std_LOGIC_VECTOR(15 downto 0);	
	signal l_SD_DAT3 : std_logic;
	signal l_SD_DAT  : std_logic;
	signal l_SD_CMD  : std_logic;
	signal l_SD_CLK  : std_logic;
	
	signal sw_test : std_logic;
		
		
	-- signal sd_data : std_LOGIC_VECTOR(3 downto 0);

--	COMPONENT sd_v3 is
--		port(
--		clk			: in  std_ulogic;
--		--	===========================================
--		-- Connections to SD-Card Shield
--		--	===========================================
--		sd_clk	: out		std_ulogic;
--		sd_cmd	: inout std_logic;
--		sd_dat	: inout std_logic_vector(3 downto 0);	
--		------------------
--		sd_wp		: in std_ulogic;
--		sd_cd		: in std_ulogic;
--		------------------
--		ledg		: out std_ulogic_vector(7 downto 0);
--		ledr		: out std_ulogic_vector(3 downto 0);
--		pb			: in std_ulogic_vector(3 downto 0);
--		--	===========================================
--		--	===========================================
--		-- std IO for debugging purpose
--		key			: in  std_ulogic_vector(1 downto 0);
--		sw			: in  std_ulogic_vector(3 downto 0);
--		led			: out std_ulogic_vector(7 downto 0)
--		);
--	end COMPONENT;

COMPONENT sd_controller is
port (
	cs : out std_logic;
	mosi : inout std_logic;
	miso : inout std_logic;
	sclk : out std_logic;

	rd : in std_logic;
	wr : in std_logic;
	dm_in : in std_logic;	-- data mode, 0 = write continuously, 1 = write single block
	reset : in std_logic;
	din : in std_logic_vector(7 downto 0);
	dout : out std_logic_vector(7 downto 0);
	clk : in std_logic	-- twice the SPI clk
);

end COMPONENT;
  
	COMPONENT driver7Segmentos IS
		PORT (
			codiNum : IN STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
			HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			enables : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"
		);
	END COMPONENT;
	
BEGIN

byte_llarg <= x"00"&byte;
	visors0 : driver7Segmentos
		PORT MAP (
			codiNum => byte_llarg,
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3
		);
		
		SD_DAT3 <= l_SD_DAT3;
		SD_DAT  <= l_SD_DAT;
		SD_CMD  <= l_SD_CMD;
		SD_CLK  <= l_SD_CLK;
		
		LEDG(0) <= l_SD_DAT3;
		LEDG(1) <= l_SD_DAT;
		LEDG(2) <= l_SD_CMD;
		LEDG(3) <= l_SD_CLK;
		
		
		sd : sd_controller
		port map(
			cs => l_SD_DAT3,
			mosi => l_SD_DAT,
			miso => l_SD_CMD,
			sclk => l_SD_CLK,

			rd => '1',
			wr => '0',
			dm_in => '1',	-- data mode, 0 = write continuously, 1 = write single block
			reset => sw_test,
			din => "00000000",
			dout => byte,
			clk => CLOCK_50	-- twice the SPI clk
		);
		
		sw_test <= SW(0);
		
--	sd_test : sd_v3
--		port map(
--		clk => CLOCK_50,
--		--	===========================================
--		-- Connections to SD-Card Shield
--		--	===========================================
--		sd_clk	=> SD_CLK,
--		sd_cmd	=> SD_CMD,
--		sd_dat	=> sd_data,	
--		------------------
--		sd_wp		=> '0',
--	   sd_cd		=> '0',
--		------------------
--		ledg		=> LEDG,
--		ledr		=> LEDR,
--		pb			=> KEY,
--		--	===========================================
--		--	===========================================
--		-- std IO for debugging purpose
--		key		=> "00",
--		sw			=> SW,
--		led		=> addr
--		);

END Structure;