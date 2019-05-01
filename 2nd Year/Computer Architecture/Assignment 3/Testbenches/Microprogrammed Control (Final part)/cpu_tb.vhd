library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity cpu_tb is
end cpu_tb;

architecture Behavioral of cpu_tb is

    component cpu
        Port(
            clk : in std_logic;
            reset : in std_logic;
            r0 : in std_logic_vector(15 downto 0);
            r1 : in std_logic_vector(15 downto 0);
            r2 : in std_logic_vector(15 downto 0);
            r3 : in std_logic_vector(15 downto 0);
            r4 : in std_logic_vector(15 downto 0);
            r5 : in std_logic_vector(15 downto 0);
            r6 : in std_logic_vector(15 downto 0);
            r7 : in std_logic_vector(15 downto 0)
        );
    end component;

    signal clk, reset : std_logic := '0';
    signal r0, r1, r2, r3, r4, r5, r6, r7 : std_logic_vector(15 downto 0) := x"0000";


begin

    uut : cpu
        Port Map(
            clk => clk,
            reset => reset,
            r0 => r0,
            r1 => r1,
            r2 => r2,
            r3 => r3,
            r4 => r4,
            r5 => r5,
            r6 => r6,
            r7 => r7
        );

    sim : process 
    begin
        reset <= '1';
        clk <= '1';

        wait for 50 ns;
        reset <= '0';
        clk <= '0';
        wait;
    end process;
    
end Behavioral ; -- Behavioral