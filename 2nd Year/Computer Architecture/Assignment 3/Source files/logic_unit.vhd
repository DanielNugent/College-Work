library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit is
    Port(
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        s: in std_logic_vector(1 downto 0);
        z: out std_logic_vector(15 downto 0)
    );

end logic_unit;

architecture Behavioral of logic_unit is

begin
    
    with s select
    z <= (a and b) after 1 ns when "00",
         (a or b)  after 1 ns when "01",
         (a xor b) after 1 ns when "10",
         (not a)   after 1 ns when others;

end Behavioral ; -- Behavioral