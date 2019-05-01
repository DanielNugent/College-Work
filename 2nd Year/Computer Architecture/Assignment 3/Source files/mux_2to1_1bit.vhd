library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_2to1_1bit is
    Port(
        I0: in std_logic;
        I1: in std_logic;
        S: in std_logic;
        Z: out std_logic
    );
end mux_2to1_1bit;

architecture Behavioral of mux_2to1_1bit is

begin
    
    Z<= I0 after 1 ns when S='0' else
        I1 after 1 ns when S='1' else
        '0' after 1 ns;

end Behavioral ; -- Behavioral