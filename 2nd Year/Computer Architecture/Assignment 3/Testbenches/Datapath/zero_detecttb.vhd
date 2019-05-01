library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detecttb is
end zero_detecttb;

architecture Behavioral of zero_detecttb is

    component zero_detect is
        Port ( 
            A : in std_logic_vector(15 downto 0);
            Z : out std_logic
        );
    end component;
    
    signal A : std_logic_vector(15 downto 0):= x"0000";
    signal Z : std_logic := '0';
        
begin

    uut: zero_detect
        Port Map (
            A => A,
            Z => Z
        );
    
    sim : process
    
    begin
        
        A <= x"AAAA";
        wait for 1 ns;
        
        A <= x"0000";
        wait for 1 ns;
        
        A <= x"BBBB";
        wait for 1 ns;
        
        A <= x"0000";
        wait for 1 ns;
        
        wait;
    
    end process;
    
end Behavioral;
