library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zerofill is
    Port ( 
        SB : in std_logic_vector(2 downto 0);
        zeroFill : out std_logic_vector(15 downto 0)
    );
end zerofill;

architecture Behavioral of zerofill is
    
    signal zf : std_logic_vector(15 downto 0);

begin
    
    zf(2 downto 0) <= SB;
    zf(15 downto 3) <= "0000000000000";
    zerofill <= zf;

end Behavioral;