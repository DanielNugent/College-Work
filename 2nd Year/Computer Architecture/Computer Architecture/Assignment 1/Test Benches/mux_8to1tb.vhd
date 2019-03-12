library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8to1tb is
--  Port ( );
end mux_8to1tb;

architecture Behavioral of mux_8to1tb is
    -- declare component to test
    
    component mux_8to1 is
        Port ( 
        I0 : in std_logic_vector(15 downto 0); 
        I1 : in std_logic_vector(15 downto 0); 
        I2 : in std_logic_vector(15 downto 0); 
        I3 : in std_logic_vector(15 downto 0); 
        I4 : in std_logic_vector(15 downto 0); 
        I5 : in std_logic_vector(15 downto 0); 
        I6 : in std_logic_vector(15 downto 0); 
        I7 : in std_logic_vector(15 downto 0);
    	S0 : in std_logic;
    	S1 : in std_logic;
    	S2 : in std_logic;
    	Z : out std_logic_vector(15 downto 0));
    end component;
    
    -- signals for tests (initialise to 0)
        
        --inputs
        signal I0 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I1 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I2 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I3 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I4 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I5 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I6 : std_logic_vector(15 downto 0):= "0000000000000000";
        signal I7 : std_logic_vector(15 downto 0):= "0000000000000000";
        
        signal S0 : std_logic := '0';
        signal S1 : std_logic := '0';
        signal S2 : std_logic := '0';
        
        --outputs
        signal Z : std_logic_vector(15 downto 0):= "0000000000000000";
        
begin

    -- initialise
    UUT: mux_8to1
    Port Map(
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Z => Z
    );
    
simulation_process :process
begin
        I0 <= x"00AA";
        I1 <= x"00BB";
        I2 <= x"00CC";
        I3 <= x"00DD";
        I4 <= x"00EE";
        I5 <= x"00FF";
        I6 <= x"0AAA";
        I7 <= x"0BBB";
        
        --Select line 0 and send 0x00AA to output line Z
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 5ns;
        
        --Select line 1 and send 0x00BB to output line Z
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 5ns;
        
        --Select line 2 and send 0x00CC to output line Z
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 5ns;
        
        --Select line 3 and send 0x00DD to output line Z
        S0 <= '0';
        S1 <= '1';
        S2 <= '1';
        wait for 5ns;
 
         --Select line 4 and send 0x00EE to output line Z
        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 5ns;
        
        --Select line 5 and send 0x00FF to output line Z
        S0 <= '1';
        S1 <= '0';
        S2 <= '1';
        wait for 5ns; 
       
        --Select line 6 and send 0x0AAA to output line Z
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 5ns;
        
        --Select line 7 and send 0x0BBB to output line Z
        S0 <= '1';
        S1 <= '1';
        S2 <= '1';
        wait for 5ns;
     end process;
    
end Behavioral;