LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;        --Esta libreria sera necesaria si usais conversiones TO_INTEGER
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER

library work;
use work.cte_tipos_UF_pkg.all;
use work.cte_tipos_IO_pkg.all;

ENTITY controladores_IO IS
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
		led_verdes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		led_rojos  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		intr       : OUT std_logic;
		PS2_CLK    : inout std_logic;
      PS2_DAT    : inout std_logic; 
		KEY        : in std_logic_vector(3 downto 0);
		SW         : in std_logic_vector(7 downto 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		HEX3 : OUT std_logic_vector(6 DOWNTO 0);
		
		-- Senyals SD
		SD_CLK  : OUT std_logic; -- sclk 
		SD_CMD  : OUT std_logic; -- mosi
		SD_DAT  : IN  std_logic; -- miso
		SD_DAT3 : OUT std_logic -- ss_n
		
	);
END controladores_IO;
ARCHITECTURE Structure OF controladores_IO IS 

COMPONENT driverHex IS
	PORT (  num         :  IN   std_logic_vector(15  DOWNTO  0);
            display_en  :  IN   std_logic_vector(3   downto  0);
            HEX0        :  OUT  std_logic_vector(6   DOWNTO  0);
            HEX1        :  OUT  std_logic_vector(6   DOWNTO  0);
            HEX2        :  OUT  std_logic_vector(6   DOWNTO  0);
            HEX3        :  OUT  std_logic_vector(6   DOWNTO  0)
	);
END COMPONENT;
COMPONENT keyboard_controller IS
    Port (clk        : in    STD_LOGIC;
          reset      : in    STD_LOGIC;
          ps2_clk    : inout STD_LOGIC;
          ps2_data   : inout STD_LOGIC;
          read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
          clear_char : in    STD_LOGIC;
		  data_ready : out   STD_LOGIC);
END COMPONENT;
COMPONENT pulsadores_controller IS
    Port (  clk       :  in   STD_LOGIC;                  
            boot      :  in   STD_LOGIC;                  
            inta      :  in   STD_LOGIC;                  
            keys      :  in   STD_LOGIC_VECTOR(3  DOWNTO  0);
            intr      :  out  STD_LOGIC;                  
            read_key  :  out  STD_LOGIC_VECTOR(3  DOWNTO  0));
END COMPONENT;

COMPONENT interruptores_controller IS
    Port (  clk        :  in   STD_LOGIC;                  
            boot       :  in   STD_LOGIC;                  
            inta       :  in   STD_LOGIC;                  
            switches   :  in   STD_LOGIC_VECTOR(7  DOWNTO  0);
            intr       :  out  STD_LOGIC;                  
            rd_switch  :  out  STD_LOGIC_VECTOR(7  DOWNTO  0));
END COMPONENT;

COMPONENT timer_controller IS
    Port (  CLOCK_50  :  in   STD_LOGIC;
            boot      :  in   STD_LOGIC;
            inta      :  in   STD_LOGIC;
            intr      :  out  STD_LOGIC);
END COMPONENT;

COMPONENT interrupt_controller IS
    Port (  clk          :  in   STD_LOGIC;                  
            boot         :  in   STD_LOGIC;                  
            inta         :  in   STD_LOGIC;                  
            key_intr     :  in   STD_LOGIC;                  
            ps2_intr     :  in   STD_LOGIC;                  
            switch_intr  :  in   STD_LOGIC;                  
            timer_intr   :  in   STD_LOGIC;                  

            intr         :  out  STD_LOGIC;                  
            key_inta     :  out  STD_LOGIC;                  
            ps2_inta     :  out  STD_LOGIC;                  
            switch_inta  :  out  STD_LOGIC;                  
            timer_inta   :  out  STD_LOGIC;                  
            iid          :  out  STD_LOGIC_VECTOR(7  DOWNTO  0));
END COMPONENT;

COMPONENT sd_driver IS
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
			reset : IN std_logic;
			error : OUT std_logic_vector(2 downto 0)
			
	);
END COMPONENT;

	type bancRegistres is array (0 to 31) of std_logic_vector(15 downto 0);
	signal mem            : bancRegistres := (others=>(others=>'0'));
	
	signal hex_num        : std_logic_vector(15 downto 0);
	signal hex_display_en : std_logic_vector(3 downto 0);
	
	signal keys_q : std_logic_vector(3 downto 0);
	signal switches_q : std_logic_vector(7 downto 0);
	signal iid : std_logic_vector(7 downto 0);
	
	signal key_inta : std_logic;
	signal switch_inta : std_logic;
	signal int_key_inta : std_logic;
	signal int_switch_inta : std_logic;
   signal int_ps2_inta     : std_logic;
	--signal ps2_inta : std_logic;
	signal timer_inta : std_logic;
	
	signal key_intr : std_logic;
	signal switch_intr : std_logic;
	--signal ps2_intr : std_logic;
	signal timer_intr : std_logic;
	
	signal kb_read_char   : std_logic_vector(7 downto 0);
	signal kb_data_ready  : std_logic;
	
	signal clear_char     : std_logic;
	
	signal cont_ciclos  : STD_LOGIC_VECTOR(15 downto 0):=x"0000";
	signal cont_mili    : STD_LOGIC_VECTOR(15 downto 0):=x"0000";

    signal  inta_pulsa  :  std_logic;
    signal  inta_sw     :  std_logic;
    signal  inta_ps2    :  std_logic;
	
	signal sd_data : std_logic_vector(15 downto 0);
	signal sd_rd : std_logic := '0';
	signal sd_valid : std_logic := '0';
	signal sd_error : std_logic_vector(2 downto 0);

BEGIN
	 rd_io      <= mem(conv_integer(addr_io(4 downto 0))) when inta = '0' else 
	               x"00" & iid;
	 led_rojos  <= mem(IO_PORT_LEDR)(7 downto 0);
	 led_verdes <= mem(IO_PORT_LEDG)(7 downto 0);
	 
	 
	 process(CLOCK_50,wr_out)
	 begin
		if boot = '1' then
		elsif rising_edge(CLOCK_50) then
			  clear_char  <= '0';
				key_inta    <= '0';
			  switch_inta <= '0';
              sd_rd <= mem(IO_PORT_SD_RD)(0);
				
				mem(IO_PORT_KEY)           <= "000000000000"    & keys_q;
				mem(IO_PORT_SW)            <= "00000000"     	& switches_q;
				mem(IO_PORT_KB_READ_CHAR)  <= "00000000"        & kb_read_char;
				mem(IO_PORT_KB_DATA_READY) <= "000000000000000" & kb_data_ready;
				mem(IO_PORT_CONT_CICLOS)   <= cont_ciclos;
				mem(IO_PORT_CONT_MILI)     <= cont_mili;
				mem(IO_PORT_SD_DATA)			<= sd_data;
				mem(IO_PORT_SD_VALID)		<= "000000000000000" & sd_valid;
				mem(IO_PORT_SD_ERROR)		<= "0000000000000" & sd_error;
				if sd_valid = '1' then
					mem(IO_PORT_SD_RD) 			<= x"0000";
				end if;
				
				hex_num        <= mem(IO_PORT_HEX_DISPLAY_EN);
				hex_display_en <= mem(IO_PORT_HEX_NUM)(3 downto 0);
				
				if wr_out = PE then
					if    addr_io = IO_PORT_KEY then
					  key_inta <= not int_en;
					elsif addr_io = IO_PORT_SW then
					  switch_inta <= not int_en;
					elsif addr_io = IO_PORT_KB_READ_CHAR then
					elsif addr_io = IO_PORT_KB_DATA_READY then
					  clear_char <= not int_en;
					elsif addr_io = IO_PORT_CONT_CICLOS then
					elsif addr_io = IO_PORT_CONT_MILI then
					elsif addr_io = IO_PORT_SD_DATA then 
					elsif addr_io = IO_PORT_SD_VALID then
					else
					  mem(conv_integer(addr_io(4 downto 0))) <= wr_io;
					end if;
				end if;
		end if;
	 end process;
	 
	 timer: process(CLOCK_50)
	begin
		if rising_edge(CLOCK_50) then
		
			if cont_ciclos=0 then
				cont_ciclos <= x"C350"; -- tiempo de ciclo=20ns(50Mhz) 1ms=50000ciclos
			else
				cont_ciclos <= cont_ciclos-1;
			end if;
		
			if wr_out = PE and addr_io = IO_PORT_CONT_MILI then
				cont_mili <= wr_io;
			elsif cont_mili > 0 and cont_ciclos = 0 then
				cont_mili <= cont_mili-1;
			end if;
			
		end if;
	end process;
	 inta_ps2 <=clear_char or int_ps2_inta;
	 kb : keyboard_controller port map (clk => CLOCK_50,
          reset      => boot,
          ps2_clk    => PS2_CLK,
          ps2_data   => PS2_DAT,
          read_char  => kb_read_char,
          clear_char => inta_ps2,
			 data_ready => kb_data_ready); 
			 
	 hex : driverHex port map    (num        => mem(IO_PORT_SD_DATA), --hex_num, 
											display_en => "1111", --hex_display_en,
											HEX0       => HEX0,
											HEX1       => HEX1,
											HEX2       => HEX2,
											HEX3       => HEX3);

		inta_pulsa <= key_inta or int_key_inta;
    keys_ctr : pulsadores_controller port map (clk      => CLOCK_50,
	                                            boot     => boot,
															  inta     => inta_pulsa,
															  keys     => KEY,
															  intr     => key_intr,
															  read_key => keys_q);
	 inta_sw <= switch_inta or int_switch_inta; 
	 sw_ctr : interruptores_controller port map (clk      => CLOCK_50,
	                                            boot      => boot,
															  inta      => inta_sw,
															  switches  => SW,
															  intr      => switch_intr,
															  rd_switch => switches_q);
															
															
    timer_ctr : timer_controller port map (CLOCK_50 => CLOCK_50,
	                                        boot     => boot,
														 inta     => timer_inta,
														 intr     => timer_intr);
														 
	 int_ctr : interrupt_controller port map (clk         => CLOCK_50,
	                                          boot        => boot,
															inta        => inta,
															key_intr    => key_intr,
															ps2_intr    => kb_data_ready,
															switch_intr => switch_intr,
															timer_intr  => timer_intr,
															intr        => intr,
															key_inta    => int_key_inta,
															ps2_inta    => int_ps2_inta,
															switch_inta => int_switch_inta,
															timer_inta  => timer_inta,
															iid         => iid);			
															
	sd_ctr : sd_driver
	PORT MAP(CLOCK_50 => CLOCK_50,
				SD_CLK  	=> SD_CLK,
				SD_CMD   => SD_CMD, -- mosi
				SD_DAT   => SD_DAT, -- miso
				SD_DAT3  => SD_DAT3, -- ss_n
				addr 		=> mem(IO_PORT_SD_ADDR),
				rd       => sd_rd,
				data     => sd_data,
				valid		=> sd_valid,
				reset 	=> boot,
				error		=> sd_error
	);


END Structure;
