LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY sd_interface IS
	PORT (  addr        : IN  std_logic_vector(15 downto 0);                   
            rd          : IN  std_logic;                                         
            busy        : IN  std_logic;                                         
            dout        : IN  std_logic_vector(7  downto 0);                   
            dout_avail  : IN  std_logic;                                         
            dout_taken  : OUT std_logic;                                         
			rd_out      : OUT std_logic := '0';
            data        : OUT std_logic_vector(15 downto 0) := (others => '0');
            valid       : OUT std_logic                                          
);
END sd_interface;

architecture rtl of sd_interface is

signal byte_counter   : std_logic_vector(8  downto  0)  :=  (others  =>  '0');
signal byte_counter_d : std_logic_vector(8  downto  0)  :=  (others  =>  '0');
signal offset         : std_logic_vector(8  downto  0)  :=  (others  =>  '0');

begin

	offset <= addr(8 downto 1) & '0'; -- 2 byte align addr%512
	dout_taken <= dout_avail;

    rd_out <= rd when busy = '0' else
              rd when rd   = '0';

	process (dout_avail, busy, rd) begin
		
--    if (rising_edge(rd)) then
--        valid <= '0';
--		 byte_counter <= (others => '0');
    if (busy = '0') then
		 valid <= '0';
		 byte_counter <= (others => '0');
    else  -- during read operation
        if ( rising_edge(dout_avail) ) then -- new byte readed
            if ( offset = byte_counter(8 downto 1) & '0' ) then
                if ( byte_counter(0) = '1' ) then
                    data(15 downto 8) <= dout;
                    valid <= '1'; -- and abort read
                else 
                    data(7 downto 0) <= dout;
                end if;
            end if;
            -- dout_taken <= '1';
            byte_counter <= byte_counter + 1;

        end if;
    end if;

	end process;

--  process (rd, byte_counter) begin
--    if(rising_edge(rd)) then
--      byte_counter_d <= "000000000";
--    else
--      byte_counter_d <= byte_counter;
--    end if;
--  end process;

end rtl;
