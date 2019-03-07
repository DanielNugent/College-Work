library IEEE;
use IEEE.std_logic_1164.ALL;

entity logic_unittb is
end logic_unittb;

architecture Behavioral of logic_unittb is

    constant delay : time := 10 ns;

    component logic_unit is
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            z : out std_logic_vector(15 downto 0)
        );
    end component;


    signal a : std_logic_vector(15 downto 0);
    signal b : std_logic_vector(15 downto 0);
    signal s : std_logic_vector(1 downto 0);

    signal z : std_logic_vector(15 downto 0);

begin

    uut: logic_unit
        port map (
            a => a,
            b => b,
            s => s,
            z => z
        );

    sim :process
    begin
        --z = a and b
        a <= x"F0CF";
        b <= x"ABCD";
        s <= "00";
        wait for delay;
        
        --z = a or b
        a <= x"FF00";
        b <= x"A0EE";
        s <= "01";
        wait for delay;
        
        --z = a xor b
        a <= x"FFFF";
        b <= x"ABCD";
        s <= "10";
        wait for delay;
        
        --z = not a
        a <= x"AA11";
        b <= x"FFFF";
        s <= "11";
        wait;
        
     end process;
    
end Behavioral;