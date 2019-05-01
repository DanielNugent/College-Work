library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1tb is
end mux_2to1tb;

architecture Behavioral of mux_2to1tb is
    -- declare component to test
    
    component mux_2to1 is
        Port ( 
        	I0 : in std_logic_vector(15 downto 0);
            I1 : in std_logic_vector(15 downto 0);
            S : in std_logic;
            Z : out std_logic_vector(15 downto 0)
        );
    end component;
    
    -- signals for tests (initialise to 0)
       
    --inputs    
    signal I0 : std_logic_vector(15 downto 0):= "0000000000000000";
    signal I1 : std_logic_vector(15 downto 0):= "0000000000000000";
    signal S : std_logic := '0';
    
    --outputs
    signal Z : std_logic_vector(15 downto 0):= "0000000000000000";
        
begin

    -- initialise
    UUT: mux_2to1
    Port Map(
        I0 => I0,
        I1 => I1,
        S => S,
        Z => Z
    );
    
simulation_process :process
begin
        
        I0 <= "1010101010101010";
        I1 <= "1111111111111111";
        
        --Select line 0 (data input) and send 0x00FF to output line Z
        S <= '0';
        wait for 5ns;
        
        --Select line 1 (register data) and send 0x00AA to output line Z
        S <= '1';
        wait for 5ns;
     
     end process;
    
end Behavioral;