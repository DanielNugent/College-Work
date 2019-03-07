library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8to1 is
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        I2: in std_logic_vector(15 downto 0);
        I3: in std_logic_vector(15 downto 0);
        I4: in std_logic_vector(15 downto 0);
        I5: in std_logic_vector(15 downto 0);
        I6: in std_logic_vector(15 downto 0);
        I7: in std_logic_vector(15 downto 0);
        src: in std_logic_vector(2 downto 0);
        Z: out std_logic_vector(15 downto 0)
    );
end mux_8to1;

architecture Behavioral of mux_8to1 is

begin
	Z <= I0 after 1 ns when src="000" else
		 I1 after 1 ns when src="001" else
		 I2 after 1 ns when src="010" else
		 I3 after 1 ns when src="011" else
		 I4 after 1 ns when src="100" else
		 I5 after 1 ns when src="101" else
		 I6 after 1 ns when src="110" else
         I7 after 1 ns when src="111" else
         "0000000000000000" after 1 ns;
end Behavioral; -- Behavioral
