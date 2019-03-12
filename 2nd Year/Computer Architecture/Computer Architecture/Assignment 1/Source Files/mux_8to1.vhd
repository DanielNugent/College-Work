library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8to1 is
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        I2: in std_logic_vector(15 downto 0);
        I3: in std_logic_vector(15 downto 0);
        I4: in std_logic_vector(15 downto 0);
        I5: in std_logic_vector(15 downto 0);
        I6: in std_logic_vector(15 downto 0);
        I7: in std_logic_vector(15 downto 0);
        S0: in std_logic;
        S1: in std_logic;
        S2: in std_logic;
        Z: out std_logic_vector(15 downto 0)
    );
end mux_8to1;

architecture Behavioral of mux_8to1 is

begin
    Z<= I0 after 5 ns when S0='0' and S1='0' and S2='0' else
        I1 after 5 ns when S0='0' and S1='0' and S2='1' else
        I2 after 5 ns when S0='0' and S1='1' and S2='0' else
        I3 after 5 ns when S0='0' and S1='1' and S2='1' else
        I4 after 5 ns when S0='1' and S1='0' and S2='0' else
        I5 after 5 ns when S0='1' and S1='0' and S2='1' else
        I6 after 5 ns when S0='1' and S1='1' and S2='0' else
        I7 after 5 ns when S0='1' and S1='1' and S2='1' else
        "0000000000000000" after 5 ns;
end Behavioral; -- Behavioral
