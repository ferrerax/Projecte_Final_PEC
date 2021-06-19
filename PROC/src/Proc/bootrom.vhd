LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;        --Esta libreria sera necesaria si usais conversiones TO_INTEGER
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER


ENTITY bootrom IS
    PORT (addr : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
			    a    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END bootrom;


ARCHITECTURE Structure OF bootrom IS
    -- Aqui iria la definicion de los registros
	type brom is array (0 to 128) of std_logic_vector(15 downto 0);
	signal bootrom  : brom := (
            x"5e00", x"5ff8", x"58a2", x"5900",
            x"5000", x"2ffe", x"41c0", x"2ffe",
            x"41c0", x"2ffe", x"41c0", x"2ffe",
            x"41c0", x"5a00", x"567f", x"5745",
            x"2340", x"ad04", x"14d9", x"2342",
            x"ad04", x"564c", x"5746", x"12d9",
            x"0242", x"6201", x"ffff", x"5220",
            x"ad04", x"43c3", x"5230", x"ad04",
            x"43c2", x"3bc3", x"5428", x"8281",
            x"0761", x"47c1", x"37c1", x"1363",
            x"621c", x"2348", x"ad04", x"5402",
            x"0242", x"6213", x"234c", x"ad04",
            x"2640", x"2350", x"ad04", x"2440",
            x"4bc0", x"2354", x"ad04", x"2a40",
            x"0b62", x"10a5", x"6006", x"2280",
            x"ad04", x"42c0", x"2482", x"26c2",
            x"65f8", x"3bc0", x"5228", x"0b61",
            x"6be1", x"5200", x"53c0", x"0010",
            x"0251", x"0492", x"06d3", x"0914",
            x"0b55", x"0d96", x"0fd7", x"5dc0",
            x"a183", x"2ffe", x"41c0", x"2ffe",
            x"43c0", x"2ffe", x"45c0", x"2ffe",
            x"47c0", x"2ffe", x"49c0", x"2ffe",
            x"4bc0", x"2ffe", x"4dc0", x"5001",
            x"7316", x"7118", x"0010", x"7019",
            x"60fe", x"7417", x"45fd", x"3dc0",
            x"2fc2", x"3bc0", x"2fc2", x"39c0",
            x"2fc2", x"37c0", x"2fc2", x"35c0",
            x"2fc2", x"33c0", x"2fc2", x"31c0",
            x"2fc2", x"a183",
  others=>x"FFFF");
BEGIN

	 a <= bootrom(conv_integer(addr));

END Structure;
