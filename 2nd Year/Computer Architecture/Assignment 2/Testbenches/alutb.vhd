library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alutb is
end alutb;

architecture Behavioral of alutb is

    component alu is
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            Cin : in std_logic;
            g_sel : in std_logic_vector(2 downto 0);
            Cout : out std_logic;
            v : out std_logic;
            g : out std_logic_vector(15 downto 0)
        );
    end component;

    signal a : std_logic_vector(15 downto 0);
    signal b : std_logic_vector(15 downto 0);
    signal Cin : std_logic;
    signal g_sel : std_logic_vector(2 downto 0);

    signal Cout : std_logic;
    signal v : std_logic;
    signal g : std_logic_vector(15 downto 0);
        
begin

    uut: alu
        port map (
            a => a,
            b => b,
            Cin => Cin,
            g_sel => g_sel,
            Cout => Cout,
            v => v,
            g => g
        );

    sim : process
    begin
        
        a <= x"FFAA";
        b <= x"000F";
        g_sel <= "000";
        Cin <= '0';
        
        wait for 1 ns;
        g_sel <= "000";
        Cin <= '1';
        
        wait for 1 ns;
        g_sel <= "001";
        Cin <= '0';
                
        wait for 1 ns;
        g_sel <= "001";
        Cin <= '1';
        
        wait for 1 ns;
        g_sel <= "010";
        Cin <= '0';

        wait for 1 ns;
        g_sel <= "010";
        Cin <= '1';

        wait for 1 ns;
        g_sel <= "011";
        Cin <= '0';

        wait for 1 ns;
        g_sel <= "011";
        Cin <= '1';
        
        wait for 1 ns;
        g_sel <= "100";
        Cin <= '0';

        wait for 1 ns;
        g_sel <= "101";

        wait for 1 ns;
        g_sel <= "110";

        wait for 1 ns;
        g_sel <= "111";

        wait;
       
end process;
    
end Behavioral;