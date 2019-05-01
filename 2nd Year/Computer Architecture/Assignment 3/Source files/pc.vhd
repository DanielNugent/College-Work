library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is 
    Port(
        PC_in : in std_logic_vector(15 downto 0);
        PL: in std_logic;
        PI: in std_logic;
        Clk: in std_logic; 
        Reset: in std_logic;
        PC_Out: out std_logic_vector(15 downto 0)
    );

end pc;

architecture Behavioral of pc is
begin

    process (Clk, reset, PL, PI)
        variable pcvar : std_logic_vector(15 downto 0);
        variable temp : integer;
        variable increment : std_logic_vector(15 downto 0);
    
        begin
            if(reset = '1' and Clk = '1') then 
        	    pcvar := x"0000";
        
            elsif(PL = '1' and Clk = '1') then
                pcvar := pcvar + PC_IN;
        
            elsif(PI = '1' and Clk = '1') then
                temp := conv_integer(pcvar);
                temp := temp + conv_integer(1);
                increment := conv_std_logic_vector(temp, 16);
                pcvar := increment;
        
            end if;

            PC_Out <= pcvar after 10 ns;
        end process;

end Behavioral ; -- Behavioral