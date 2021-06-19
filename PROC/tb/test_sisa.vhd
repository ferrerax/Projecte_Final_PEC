library ieee;
   use ieee.std_logic_1164.all;


entity test_sisa is
end test_sisa;

architecture comportament of test_sisa is
   component async_64Kx16 is
		generic
			(ADDR_BITS		: integer := 16;
			DATA_BITS		: integer := 16;
			depth 			: integer := 65536;
			
			TimingInfo		: BOOLEAN := TRUE;
			TimingChecks	: std_logic := '1'
			);
		Port (
			CE_b    : IN Std_Logic;	                                                -- Chip Enable CE#
			WE_b  	: IN Std_Logic;	                                                -- Write Enable WE#
			OE_b  	: IN Std_Logic;                                                 -- Output Enable OE#
			BHE_b	: IN std_logic;                                                 -- Byte Enable High BHE#
			BLE_b   : IN std_logic;                                                 -- Byte Enable Low BLE#
			A 		: IN Std_Logic_Vector(addr_bits-1 downto 0);                    -- Address Inputs A
			DQ		: INOUT Std_Logic_Vector(DATA_BITS-1 downto 0):=(others=>'Z');   -- Read/Write Data IO
			boot    : in std_logic
			); 
   end component;
   
   component sisa IS 
    PORT (CLOCK_50  : IN    STD_LOGIC;
          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
			 LEDG      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			 LEDR      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			 KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 ps2_clk : inout std_logic;
			 ps2_dat : inout std_logic; 
			 SD_CLK  : OUT std_logic; -- sclk 
			 SD_CMD  : OUT std_logic; -- mosi
			 SD_DAT  : IN  std_logic; -- miso
			 SD_DAT3 : OUT std_logic);
   end component;

   COMPONENT stub_SD IS
	PORT (CLOCK_50 : IN std_logic;
			SD_CLK  : IN std_logic; -- sclk 
			SD_CMD  : IN std_logic; -- mosi
			SD_DAT  : OUT  std_logic; -- miso
			SD_DAT3 : IN std_logic -- ss_n
       );
   END COMPONENT;
   
   -- Registres (entrades) i cables
   signal clk           : std_logic := '0';
   signal reset_ram    	: std_logic := '0';
   signal reset_proc    : std_logic := '0';
   signal key_value    : std_logic_vector(3 downto 0) := "0000";

   signal addr_SoC      : std_logic_vector(17 downto 0);
   signal addr_mem      : std_logic_vector(15 downto 0);
   signal data_mem      : std_logic_vector(15 downto 0);

   signal ub_m           : std_logic;
   signal lb_m           : std_logic;
   signal ce_m           : std_logic;
   signal oe_m           : std_logic;
   signal we_m           : std_logic;
   signal ce_m2           : std_logic;

  signal botones      : std_logic_vector(9 downto 0) := "0000000000";

  signal b_LEDG      : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"00"; 
	signal b_LEDR      : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"00";
	signal b_HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
	signal b_HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
	signal b_HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
	signal b_HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
	signal b_KEY : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"0";
	signal b_ps2_clk : std_logic := '0';
	signal b_ps2_data : std_logic := '0'; 

				signal SD_CLK  : std_logic;
				signal SD_CMD  : std_logic;
				signal SD_DAT  : std_logic;
				signal SD_DAT3 : std_logic;
   
	
begin
   
   ce_m2 <= '1', ce_m after 100 ns;
   -- Instanciacions de moduls
   SoC : sisa
      port map (
         CLOCK_50   => clk,
         SW        => botones,
         SRAM_ADDR  => addr_SoC,
         SRAM_DQ    => data_mem,
			SRAM_UB_N 	=> ub_m,
			SRAM_LB_N 	=> lb_m,
			SRAM_CE_N 	=> ce_m,
			SRAM_OE_N 	=> oe_m,
			SRAM_WE_N 	=> we_m,
			LEDG      => b_LEDG,
			LEDR       => b_LEDR,
			HEX0  => b_HEX0,
			HEX1  => b_HEX1,
			HEX2  => b_HEX2,
			HEX3  => b_HEX3,
			KEY  => b_KEY,
			ps2_clk  => b_ps2_clk,
			ps2_dat  => b_ps2_data,
			SD_CLK => SD_CLK, 
			SD_CMD => SD_CMD,
			SD_DAT => SD_DAT,
			SD_DAT3 => SD_DAT3
      );

   mem0 : async_64Kx16
      port map (
				A 	 => addr_mem,
				DQ  => data_mem,
				
				--CE_b => ce_m,
				CE_b => ce_m2,
				OE_b => oe_m,
				WE_b => we_m,
				BLE_b => lb_m,
				BHE_b => ub_m,

				boot     => reset_ram
      );

      sd0: stub_SD
         port map ( CLOCK_50 => clk,
			SD_CLK => SD_CLK, 
			SD_CMD => SD_CMD,
			SD_DAT => SD_DAT,
			SD_DAT3 => SD_DAT3);

	  

		addr_mem (15 downto 0) <= addr_SOC (15 downto 0);
		botones(8) <= reset_proc;
		b_KEY <= key_value;
		
   -- Descripcio del comportament
	clk <= not clk after 10 ns;
	reset_ram <= '1' after 15 ns, '0' after 50 ns;    -- reseteamos la RAm en el primer ciclo
	reset_proc <= '1' after 25 ns, '0' after 320 ns;  -- reseteamos el procesador en el segundo ciclo
	key_value <= "1010" after 5200 ns;
	
end comportament;


