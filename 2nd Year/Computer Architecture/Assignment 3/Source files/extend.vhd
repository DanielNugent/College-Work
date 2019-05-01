library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend is
    Port ( 
        DR_SB : in std_logic_vector(5 downto 0);
        ext : out std_logic_vector(15 downto 0)
    );
end extend;

architecture Behavioral of extend is

    signal ext_s : std_logic_vector(15 downto 0);

begin

    ext_s(5 downto 0) <= DR_SB;
    ext_s(15 downto 6) <= "0000000000" when DR_SB(5) = '0' else "1111111111";
    ext <= ext_s;

end Behavioral;
