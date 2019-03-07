library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_3to1 is
    Port(
        I0: in std_logic;
        I1: in std_logic;
        I2: in std_logic;
        S: in std_logic_vector(1 downto 0);
        Z: out std_logic
    );
end mux_3to1;

architecture Behavioral of mux_3to1 is
    
begin
    with S select
        Z <= I0 after 1 ns when "00",
             I1 after 1 ns when "01",
             I2 after 1 ns when "10",
             "0000000000000000" after 1 ns when others;

end Behavioral ; -- Behavioral