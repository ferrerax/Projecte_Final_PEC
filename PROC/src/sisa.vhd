LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;  

ENTITY sisa IS
    PORT (CLOCK_50  : IN    STD_LOGIC;
          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
          SW        : in std_logic_vector(9 downto 0);
			 KEY       : in std_logic_vector(3 downto 0);
			 PS2_CLK   : inout std_logic;
          PS2_DAT   : inout std_logic;
          VGA_R     : out std_logic_vector(3 downto 0); -- vga red pixel value
          VGA_G     : out std_logic_vector(3 downto 0); -- vga green pixel value
          VGA_B     : out std_logic_vector(3 downto 0); -- vga blue pixel value
          VGA_HS    : out std_logic; -- vga control signal
          VGA_VS    : out std_logic; -- vga control signal
			 LEDR : OUT std_logic_vector(7 DOWNTO 0);
			 LEDG : OUT std_logic_vector(7 DOWNTO 0);
			 HEX0 : OUT std_logic_vector(6 DOWNTO 0);
			 HEX1 : OUT std_logic_vector(6 DOWNTO 0);
			 HEX2 : OUT std_logic_vector(6 DOWNTO 0);
			 HEX3 : OUT std_logic_vector(6 DOWNTO 0);
			 SD_CLK  : OUT std_logic; -- sclk 
			 SD_CMD  : OUT std_logic; -- mosi
			 SD_DAT  : IN  std_logic; -- miso
			 SD_DAT3 : OUT std_logic);
END sisa;

ARCHITECTURE Structure OF sisa IS
component MemoryController is
    port (CLOCK_50  : in  std_logic;
	      addr      : in  std_logic_vector(15 downto 0);
          wr_data   : in  std_logic_vector(15 downto 0);
          rd_data   : out std_logic_vector(15 downto 0);
          we        : in  std_logic;
          byte_m    : in  std_logic;
          -- seÃ¯Â¿Â½ales para la placa de desarrollo
			 SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1');
end component;
component proc IS
	PORT (
		clk : IN STD_LOGIC;
		boot : IN STD_LOGIC;
		datard_m : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		rd_io:     IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		intr:     IN STD_LOGIC;
		inta :   OUT STD_LOGIC;
		addr_m : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		data_wr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_m : OUT STD_LOGIC;
		addr_io: OUT STD_LOGIC_VECTOR(7 downto 0);
		rd_in: OUT STD_LOGIC;
		int_en : OUT STD_LOGIC;
	   wr_out: OUT STD_LOGIC;
		wr_io:     OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		word_byte : OUT STD_LOGIC
	);
end component;

--component Reloj is
--	GENERIC (factor : integer := 8);	
--	PORT (
--		CLOCK_50 : IN std_logic;
--		reloj : OUT std_logic
--	);
-- end component;

component clock IS
 GENERIC (N : integer);
 PORT( CLOCK_50 : IN std_logic;
 contador : in std_logic_vector (N-1 downto 0);
 clk : out std_logic);
END component;

COMPONENT controladores_IO IS
	PORT (
		boot       : IN STD_LOGIC;
		CLOCK_50   : IN std_logic;
		addr_io    : IN std_logic_vector(7 DOWNTO 0);
		wr_io      : IN std_logic_vector(15 DOWNTO 0);
		rd_io      : OUT std_logic_vector(15 DOWNTO 0);
		wr_out     : IN std_logic;
		rd_in      : IN std_logic;
		int_en     : IN STD_LOGIC;
		inta       : IN STD_LOGIC;
		intr       : OUT STD_LOGIC;
		led_verdes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		led_rojos  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		PS2_CLK    : inout std_logic;
    PS2_DAT    : inout std_logic;
		KEY        : in std_logic_vector(3 downto 0);
		SW         : in std_logic_vector(7 downto 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		HEX3 : OUT std_logic_vector(6 DOWNTO 0);
		SD_CLK  : OUT std_logic; -- sclk 
		SD_CMD  : OUT std_logic; -- mosi
		SD_DAT  : IN  std_logic; -- miso
		SD_DAT3 : OUT std_logic -- ss_n
	);
END COMPONENT;
component vga_controller is
    port(clk_50mhz      : in  std_logic; -- system clock signal
         reset          : in  std_logic; -- system reset
         red_out        : out std_logic_vector(7 downto 0); -- vga red pixel value
         green_out      : out std_logic_vector(7 downto 0); -- vga green pixel value
         blue_out       : out std_logic_vector(7 downto 0); -- vga blue pixel value
         horiz_sync_out : out std_logic; -- vga control signal
         vert_sync_out  : out std_logic; -- vga control signal
         --
         addr_vga          : in std_logic_vector(12 downto 0);
         we                : in std_logic;
         wr_data           : in std_logic_vector(15 downto 0);
         rd_data           : out std_logic_vector(15 downto 0);
         byte_m            : in std_logic);                     -- simplemente lo ignoramos, este controlador no lo tiene implementado
end component;

component bootrom IS
    port (addr : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
			    a    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END component;

signal rellotge, proc0_word_byte, wr_m_t : std_logic;
signal proc0_addr_m, proc0_data_wr, proc0_datard_m, vga_rd_data, mem0_rd_data : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rellotge_proves: std_logic;
signal addr_io_t: std_logic_vector(7 downto 0);
signal rd_io_t: std_logic_vector(15 downto 0);
signal wr_io_t: std_logic_vector(15 downto 0);
signal wr_io_en: std_logic;
signal rd_io_en: std_logic;
signal vga_we: std_logic;
signal mem0_we: std_logic;
signal proc0_wr_m: std_logic;
signal proc0_inta : std_logic;
signal proc0_int_en: std_logic;

signal io0_intr: std_logic;

signal vga_addr_vga: std_logic_vector(15 downto 0);
signal bootrom_addr: std_logic_vector(6 downto 0);
signal bootrom_rd_data: std_logic_vector(15 downto 0);

BEGIN
--	rel0  : Reloj GENERIC MAP ( factor => 8) PORT MAP (CLOCK_50 => CLOCK_50, reloj => rellotge);
	
	clk_c: clock generic map (4)
					 port map (CLOCK_50 => CLOCK_50, contador => std_logic_vector(to_unsigned(8, 4)), clk => rellotge);
	
	proc0 : proc PORT MAP (clk => rellotge,
								  boot => SW(8),
								  datard_m => proc0_datard_m,
								  rd_io => rd_io_t,
                  intr => io0_intr,
								  inta  => proc0_inta,
								  addr_m => proc0_addr_m,
								  data_wr => proc0_data_wr,
								  wr_m => proc0_wr_m,
								  addr_io => addr_io_t,
								  rd_in => rd_io_en,
								  int_en => proc0_int_en,
								  wr_out => wr_io_en,
								  wr_io => wr_io_t,
								  word_byte => proc0_word_byte);
								  
	mem0	: memoryController PORT MAP (CLOCK_50 => CLOCK_50, 
												  addr => proc0_addr_m,
                                      wr_data => proc0_data_wr,
												  rd_data => mem0_rd_data,
                                      we => mem0_we,
                                      byte_m => proc0_word_byte,
                                      SRAM_ADDR => SRAM_ADDR,
                                      SRAM_DQ => SRAM_DQ,
                                      SRAM_UB_N => SRAM_UB_N,
                                      SRAM_LB_N => SRAM_LB_N,
                                      SRAM_CE_N => SRAM_CE_N,
                                      SRAM_OE_N => SRAM_OE_N,
                                      SRAM_WE_N => SRAM_WE_N);
												  
												  
	io0: controladores_IO port map (
	   boot => SW(8),
		CLOCK_50 => CLOCK_50,
		addr_io => addr_io_t,
		wr_io => wr_io_t,
		rd_io => rd_io_t,
		wr_out => wr_io_en,
		rd_in => rd_io_en,
    intr  => io0_intr,
		int_en => proc0_int_en,
		inta   => proc0_inta,
		led_verdes => LEDG,
		led_rojos => LEDR,
		PS2_CLK => PS2_CLK,
		PS2_DAT => PS2_DAT,
		key => KEY,
		sw  => SW(7 downto 0),
		HEX0 => HEX0,
		HEX1 => HEX1,
		HEX2 => HEX2,
		HEX3 => HEX3,
		SD_CLK => SD_CLK,
		SD_CMD => SD_CMD,
		SD_DAT => SD_DAT,
		SD_DAT3 => SD_DAT3
	);
	
	--blank_out, csync_out, horiz_sync_out, vert_sync_out, red_out, green_out y blue_out s
	vga: vga_controller  port map(clk_50mhz  => CLOCK_50, -- system clock signal
         reset         => SW(8), -- system reset
         red_out(3 downto 0)   => VGA_R, -- vga red pixel value
         green_out(3 downto 0) =>  VGA_G, -- vga green pixel value
         blue_out(3 downto 0)  => VGA_B, -- vga blue pixel value
         horiz_sync_out => VGA_HS, -- vga control signal
         vert_sync_out  => VGA_VS, -- vga control signal
         --
         addr_vga       => vga_addr_vga(12 downto 0),
         we             => vga_we,
         wr_data        => proc0_data_wr,
         rd_data        => vga_rd_data,
         byte_m         => proc0_word_byte);  
		
	bootrom: bootrom port map(
		addr => bootrom_addr,
		a    => bootrom_rd_data 
	);
	
	 bootrom_addr <= proc0_addr_m(7 downto 1);
	 vga_addr_vga <= proc0_addr_m - x"A000";
	 process (CLOCK_50, SW(8)) begin
	   if SW(8) = '1' then
			vga_we <= '0';
			mem0_we <= '0';
			proc0_datard_m <= mem0_rd_data;
		else 
		  if rising_edge(CLOCK_50) then
		    if (proc0_addr_m >= x"A000"	and proc0_addr_m < x"B2C0") then
			   vga_we <= proc0_wr_m;
				mem0_we <= '0';
				proc0_datard_m <= vga_rd_data;
			 else
				if (proc0_addr_m < x"0100") then
					proc0_datard_m <= bootrom_rd_data;
					mem0_we <= '0';
				else 
					mem0_we <= proc0_wr_m;
					proc0_datard_m <= mem0_rd_data;
				end if;
			   vga_we <= '0';
			 end if;
		  end if;
		end if;
    end process;
END Structure;
