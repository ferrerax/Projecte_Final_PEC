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
            valid       : OUT std_logic := '0'                                          
);
END sd_interface;

architecture rtl of sd_interface is

signal byte_counter   : std_logic_vector(8  downto  0)  :=  (others  =>  '0');
signal byte_counter_d : std_logic_vector(8  downto  0)  :=  (others  =>  '0');
signal offset         : std_logic_vector(8  downto  0)  :=  (others  =>  '0');

signal rd_out_tmp : std_logic;

signal validat : boolean := false; 

signal lec_fin : std_logic;
type state_type is (INI, IDLE, LEC, FIN);

-- Register to hold the current state
signal state   : state_type;

begin

	offset <= addr(8 downto 1) & '0'; -- 2 byte align addr%512
	dout_taken <= dout_avail;

--    rd_out_tmp <= rd when busy = '0' else
--              rd when rd   = '0';

rd_out <= '1' when state = LEC else '0';
valid  <= '0' when state = LEC or
                   state = INI else
          '1' when state = FIN;

process (rd, busy, lec_fin)
	begin
			case state is
				when INI=>
					if busy = '0' and rd = '0' then
						state <= IDLE;
					end if;
					if busy = '0' and rd = '1' then
						state <= LEC;
					end if;
				when IDLE=>
					if rd = '1' then
						state <= LEC;
					end if;
				when LEC=>
					if lec_fin = '1' then
						state <= FIN;
					end if;
				when FIN =>
					if busy = '0' then
						state <= IDLE;
                    elsif rd = '1' then
                        state <= INI;
					end if;
			end case;
	end process;
	
	process (dout_avail, busy) begin		
        if (busy = '0') then
             lec_fin <= '0';
             byte_counter <= (others => '0');
        else -- during read operation
            if ( rising_edge(dout_avail) ) then -- new byte readed
                if ( offset = byte_counter(8 downto 1) & '0' ) then
                    if ( byte_counter(0) = '1' ) then
                        data(15 downto 8) <= dout;
                        lec_fin <= '1'; -- and abort read
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
