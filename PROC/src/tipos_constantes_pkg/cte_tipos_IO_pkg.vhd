library ieee;
use ieee.std_logic_1164.all;

package cte_tipos_IO_pkg is

constant IO_PORT_LEDG           : integer := 5;
constant IO_PORT_LEDR           : integer := 6;
constant IO_PORT_KEY            : integer := 7;
constant IO_PORT_SW             : integer := 8;
constant IO_PORT_HEX_NUM        : integer := 9;
constant IO_PORT_HEX_DISPLAY_EN : integer := 10;
constant IO_PORT_KB_READ_CHAR   : integer := 15;
constant IO_PORT_KB_DATA_READY  : integer := 16;
constant IO_PORT_CONT_CICLOS    : integer := 20;
constant IO_PORT_CONT_MILI      : integer := 21;
constant IO_PORT_SD_ADDR		  : integer := 22;
constant IO_PORT_SD_DATA		  : integer := 23;
constant IO_PORT_SD_RD			  : integer := 24;
constant IO_PORT_SD_VALID		  : integer := 25;
constant IO_PORT_SD_ERROR		  : integer := 26;

constant INT_IID_TIMER          : std_logic_vector(7 downto 0) := "00000000";
constant INT_IID_PULSADORES     : std_logic_vector(7 downto 0) := "00000001";
constant INT_IID_INTERRUPTORES  : std_logic_vector(7 downto 0) := "00000010";
constant INT_IID_KEYBOARD       : std_logic_vector(7 downto 0) := "00000011";

END PACKAGE cte_tipos_IO_pkg;
