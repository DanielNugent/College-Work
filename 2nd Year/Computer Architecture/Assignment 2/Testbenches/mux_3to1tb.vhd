library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_3to1tb is
end mux_3to1tb;

architecture Behavioral of mux_3to1tb is 

    constant delay : time := 10 ns;
    
    component mux_3to1
        port (
            I0 : in std_logic;
            I1 : in std_logic;
            I2 : in std_logic;
            S : in std_logic_vector(1 downto 0);
            Z : out std_logic
        );
    end component;
 
    signal I0 : std_logic := '1';
    signal I1 : std_logic := '0';
    signal I2 : std_logic := '1';
    signal S : std_logic_vector(1 downto 0) := "UU";
    signal Z : std_logic;

begin

    uut : mux_3to1
        port map (
            I0 => I0,
            I1 => I1,
            I2 => I2,
            S => S,
            Z => Z
        );

    sim : process

    begin
    
        wait for delay;
        S <= "00";
    
        wait for delay;
        S <= "01";
    
        wait for delay;
        I0 <= '0';
        S <= "10";

        wait;
    
    end process;

end;