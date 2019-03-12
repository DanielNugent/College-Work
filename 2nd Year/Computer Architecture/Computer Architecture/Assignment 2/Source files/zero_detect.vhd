library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect is
    Port(
        A: in std_logic_vector(15 downto 0);
        Z: out std_logic
    );
end zero_detect;

architecture Behavioral of zero_detect is

begin
    Z <= not (A(0) or A(1) or A(2) or A(2) or A(3) or A(4) or A(5) 
                   or A(6) or A(7) or A(8) or A(9) or A(10) or A(11) 
                   or A(12) or A(13) or A(14) or A(15)) after 1 ns;

end Behavioral ; -- Behavioral