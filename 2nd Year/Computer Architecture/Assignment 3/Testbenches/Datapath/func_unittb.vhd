library IEEE;
use IEEE.std_logic_1164.ALL;

entity func_unittb is
end;

architecture Behavioral of func_unittb is

    component function_unit is
        port (
            a, b : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            f : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;
    
    signal a, b : std_logic_vector(15 downto 0);
    signal fs : std_logic_vector(4 downto 0);
    
    signal f : std_logic_vector(15 downto 0);
    signal v, c, n, z : std_logic;
        
begin

    uut: function_unit
        Port Map (
            a => a,
            b => b,
            fs => fs,
            f => f,
            v => v,
            c => c,
            n => n, 
            z => z
        );
    
    sim : process
    begin

        -- arithmetic
        fs <= "00000";
        a <= x"00AA";
        b <= x"00BB";
        wait for 1 ns;
        
        fs <= "00001";
        a <= x"00AA";
        b <= x"00BB";
        wait for 1 ns;
        
        fs <= "00010";
        a <= x"0002";
        b <= x"0001";
        wait for 1 ns;
        
        fs <= "00011";
        a <= x"7FFE";
        b <= x"0001";
        wait for 1 ns;
        
        fs <= "00100";
        a <= x"0001";
        b <= x"FFFC";
        wait for 1 ns;
        
        fs <= "00101";
        a <= x"000F";
        b <= x"FFFE";
        wait for 1 ns;
        
        fs <= "00110";
        a <= x"000A";
        b <= x"000B";
        wait for 1 ns;
        
        fs <= "00111";
        a <= x"000A";
        b <= x"000B";
        wait for 1 ns;
        
        -- logic
        fs <= "01000";
        a <= x"F0CF";
        b <= x"ABCD";
        wait for 1 ns;
        
        fs <= "01010";
        a <= x"FF00";
        b <= x"A0EE";
        wait for 1 ns;
        
        fs <= "01100";
        a <= x"FFFF";
        b <= x"ABCD";
        wait for 1 ns;
        
        fs <= "01110";
        a <= x"AA11";
        b <= x"FFFF";
        wait for 1 ns;
        
        -- shifter
        fs <= "10000";
        a <= x"000A";
        b <= x"000B";
        wait for 1 ns;
        
        fs <= "10100";
        a <= x"000A";
        b <= x"000B";
        wait for 1 ns;
        
        fs <= "11000";
        a <= x"000A";
        b <= x"000B";
        wait for 1 ns;
     wait;
end process;
    
end Behavioral;
