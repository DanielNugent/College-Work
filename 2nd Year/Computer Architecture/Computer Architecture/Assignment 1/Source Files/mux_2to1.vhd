library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_2to1 is
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        S: in std_logic;
        Z: out std_logic_vector(15 downto 0)
    );
end mux_2to1;

architecture Behavioral of mux_2to1 is

begin
    
    Z<= I0 after 5 ns when S='0' else
        I1 after 5 ns when S='1' else
        "0000000000000000" after 5 ns;

end Behavioral ; -- Behavioral