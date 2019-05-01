library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_2to1_8bit_tb is
end mux_2to1_8bit_tb;

architecture Behavioral of mux_2to1_8bit_tb is

    component mux_2to1_8bit
        Port(
            I0: in std_logic_vector(7 downto 0);
            I1: in std_logic_vector(7 downto 0);
            S: in std_logic;
            Z: out std_logic_vector(7 downto 0)
        );
    end component;

    signal I0 : std_logic_vector := "00000000";
    signal I1 : std_logic_vector := "00000000";
    signal S : std_logic := '0';
    signal Z : std_logic_vector := "00000000";

begin

    uut : mux_2to1_8bit 
        Port Map(
            I0 => I0,
            I1 => I1,
            S => S,
            Z => Z
        );

    sim : process
    begin
        I0 <= "11111111";
        I1 <= "00000000";

        S <= '0';
        wait for 10 ns;
        -- Z = '11111111'
        S <= '1';
        wait for 10 ns;
        -- Z = '00000000'
    end process;

end Behavioral ; -- Behavioral