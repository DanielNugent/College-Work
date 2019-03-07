library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity shiftertb is
end shiftertb;
 
architecture Behavioral of shiftertb is
  
    component shifter
        port (
            b : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            il, ir : in std_logic;
            h : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal b : std_logic_vector(15 downto 0) := x"FFFF";
    signal s : std_logic_vector(1 downto 0) := "UU";
    signal il : std_logic := '0';
    signal ir : std_logic := '0';
    signal h : std_logic_vector(15 downto 0);
 
begin

    uut: shifter port map (
            b => b,
            s => s,
            il => il,
            ir => ir,
            h => h
        );

   sim: process

    begin
        
        wait for 1 ns;
        s <= "00";
        
        wait for 1 ns;
        s <= "01";
        
        wait for 1 ns;
        s <= "10";

        wait;

   end process;

end;
