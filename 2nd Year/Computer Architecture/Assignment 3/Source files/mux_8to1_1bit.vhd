library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8to1_1bit is
    Port(
        I0: in std_logic;
        I1: in std_logic;
        I2: in std_logic;
        I3: in std_logic;
        I4: in std_logic;
        I5: in std_logic;
        I6: in std_logic;
        I7: in std_logic;
        src: in std_logic_vector(2 downto 0);
        Z: out std_logic
    );
end mux_8to1_1bit;

architecture Behavioral of mux_8to1_1bit is

begin
	Z <= I0 after 5 ns when src="000" else
		 I1 after 5 ns when src="001" else
		 I2 after 5 ns when src="010" else
		 I3 after 5 ns when src="011" else
		 I4 after 5 ns when src="100" else
		 I5 after 5 ns when src="101" else
		 I6 after 5 ns when src="110" else
         I7 after 5 ns when src="111" else
         '0' after 5 ns;
end Behavioral; -- Behavioral
