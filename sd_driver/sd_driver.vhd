LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY sd_driver IS
	PORT ( addr  : IN std_logic_vector(31 downto 0);
				 rd    : IN std_logic;
				 busy : IN std_logic;
         dout  : IN std_logic_vector(7 downto 0);
         dout_avail : IN std_logic;
         dout_taken : OUT std_logic;
				 data  : OUT std_logic_vector(15 downto 0) := (others => '0');
         valid : OUT std_logic
);
END sd_driver;

architecture rtl of sd_driver is
signal byte_counter : std_logic_vector(8 downto 0) := (others => '0');
signal offset : std_logic_vector(8 downto 0) := (others => '0');
begin
	offset <= addr(8 downto 1) & '0'; -- 2 byte align addr%512
	process (rd, addr, dout_avail, busy) begin
		if rising_edge(rd) then -- clear valid for each new read op
				valid <= '0';
		end if;
		if ( rd = '1' )  then	
			if ( rising_edge(busy) ) then -- init counter when op start
				byte_counter <= (others => '0');
			end if;
		end if;
		if ( dout_avail = '0' ) then -- init counter when op start
				dout_taken <= '0';
		end if;
		if ( busy = '1' ) then -- during read operation
			if ( rising_edge(dout_avail) ) then -- new byte readed
				if ( offset = byte_counter(8 downto 1) ) then
					if ( byte_counter(0) = '1' ) then
						data(15 downto 8) <= dout;
						valid <= '1'; -- and abort read
					else 
						data(7 downto 0) <= dout;
					end if;
				end if;
				dout_taken <= '1';
				byte_counter <= byte_counter + 1;

			end if;
		end if;

	end process;


end rtl;
