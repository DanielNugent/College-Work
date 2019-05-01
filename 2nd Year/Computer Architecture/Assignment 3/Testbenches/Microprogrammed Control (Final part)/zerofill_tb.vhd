library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zeroFill_tb is
end zeroFill_tb;
    
architecture Behavioral of zeroFill_tb is
    
    component zerofill is
        Port ( 
            SB : in std_logic_vector(2 downto 0);
            zeroFill : out std_logic_vector(15 downto 0)
        );
    end component;
           
    signal SB : std_logic_vector(2 downto 0) := "000";
    signal zf : std_logic_vector(15 downto 0) := x"0000";
            
begin
    
    uut : zerofill
        Port Map(
            SB => SB,
            zeroFill => zf
        );
        
    sim : process
    begin
        
        SB <= "111";
        wait for 10 ns;
            
        SB <= "010";
        wait for 10 ns;
            
        wait;
    end process;
        
end Behavioral;
    