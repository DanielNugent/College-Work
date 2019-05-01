library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend_tb is
end extend_tb;

architecture Behavioral of extend_tb is

component extend is
    Port(
        DR_SB : in std_logic_vector(5 downto 0);
        ext : out std_logic_vector(15 downto 0)
    );
end component;

    signal DR_SB : std_logic_vector(5 downto 0) := "000000";
    signal EXT : std_logic_vector(15 downto 0) := x"0000";

begin

    uut : extend
        Port Map(
            DR_SB => DR_SB,
            ext => EXT
        );
    
    sim : process
    begin
        DR_SB <= "111111";
        wait for 15 ns;

        DR_SB <= "011111";
        wait for 15 ns;
    
        wait;
        
    end process;

end Behavioral  ; -- Behavioral 