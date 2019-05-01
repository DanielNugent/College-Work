library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_2to1_1bit_tb is
end mux_2to1_1bit_tb;

architecture Behavioral of mux_2to1_1bit_tb is

    component mux_2to1_1bit
        Port(
            I0 : in std_logic;
            I1 : in std_logic;
            S : in std_logic;
            Z : out std_logic
        );
    end component;

    signal I0 : std_logic := '0';
    signal I1 : std_logic := '0';
    signal S : std_logic := '0';
    signal Z : std_logic := '0';
        

begin

    uut : mux_2to1_1bit 
        Port Map(
            I0 => I0,
            I1 => I1,
            S => S,
            Z => Z
        );

    sim : process
    begin
        I0 <= '1';
        I1 <= '0';

        S <= '0';
        wait for 10 ns;
        -- Z = '1'
        S <= '1';
        wait for 10 ns;
        -- Z = '0'
    end process;

end Behavioral ; -- Behavioral