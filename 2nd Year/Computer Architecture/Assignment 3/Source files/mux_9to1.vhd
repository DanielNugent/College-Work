library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_9to1 is
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        I2: in std_logic_vector(15 downto 0);
        I3: in std_logic_vector(15 downto 0);
        I4: in std_logic_vector(15 downto 0);
        I5: in std_logic_vector(15 downto 0);
        I6: in std_logic_vector(15 downto 0);
        I7: in std_logic_vector(15 downto 0);
        I8: in std_logic_vector(15 downto 0);
        src: in std_logic_vector(3 downto 0);
        Z: out std_logic_vector(15 downto 0)
    );
end mux_9to1;

architecture Behavioral of mux_9to1 is

begin
	Z <= I0 after 5 ns when src="0000" else
		 I1 after 5 ns when src="0001" else
		 I2 after 5 ns when src="0010" else
		 I3 after 5 ns when src="0011" else
		 I4 after 5 ns when src="0100" else
		 I5 after 5 ns when src="0101" else
		 I6 after 5 ns when src="0110" else
         I7 after 5 ns when src="0111" else
         I8 after 5 ns when src="1000" else
         "0000000000000000" after 5 ns;
end Behavioral; -- Behavioral
