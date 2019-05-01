library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8to1_1bit_tb is
end mux_8to1_1bit_tb;

architecture Behavioral of mux_8to1_1bit_tb is
    
    component mux_8to1_1bit is
        Port(
            I0: in std_logic;
            I1: in std_logic;
            I2: in std_logic;
            I3: in std_logic;
            I4: in std_logic;
            I5: in std_logic;
            I6: in std_logic;
            I7: in std_logic;
            src: in std_logic_vector(2 downto 0);
            Z: out std_logic
        );
    end component;
 
    signal I0 : std_logic := '0';
    signal I1 : std_logic := '0';
    signal I2 : std_logic := '0';
    signal I3 : std_logic := '0';
    signal I4 : std_logic := '0';
    signal I5 : std_logic := '0';
    signal I6 : std_logic := '0';
    signal I7 : std_logic := '0';
    signal src : std_logic_vector(2 downto 0) := "000";
    signal Z : std_logic := '0';
        
begin

    -- initialise
    uut : mux_8to1_1bit
    Port Map(
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        src => src,
        Z => Z
    );
    
    sim :process
    begin
        I0 <= '0';
        I1 <= '1';
        I2 <= '0';
        I3 <= '1';
        I4 <= '0';
        I5 <= '1';
        I6 <= '0';
        I7 <= '1';
        

        src <= "000";
        wait for 5 ns;
        
        src <= "001";
        wait for 5 ns;
        
        src <= "010";
        wait for 5 ns;
        
        src <= "011";
        wait for 5 ns;
 
        src <= "100";
        wait for 5 ns;
        
        src <= "101";
        wait for 5 ns; 
       
        src <= "110";
        wait for 5 ns;
        
        src <= "111";
        wait for 5 ns;
    end process;
    
end Behavioral;