library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_3to8tb is
end decoder_3to8tb;

architecture Behavioral of decoder_3to8tb is

    component decoder_3to8 is
    Port( 
        	A : in std_logic;
            B : in std_logic;
            C : in std_logic;  
            D0 : out std_logic;
            D1 : out std_logic;
            D2 : out std_logic;
            D3 : out std_logic;
            D4 : out std_logic;
            D5 : out std_logic;
            D6 : out std_logic;
            D7 : out std_logic
    );
    end component;
    
    -- signals for tests (initialise to 0)
    
    --inputs    
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
     
    --outputs    
    signal D0 : std_logic := '0';
    signal D1 : std_logic := '0';
    signal D2 : std_logic := '0';
    signal D3 : std_logic := '0';
    signal D4 : std_logic := '0';
    signal D5 : std_logic := '0';
    signal D6 : std_logic := '0';
    signal D7 : std_logic := '0';
        
begin

    UUT: decoder_3to8
    Port map(
        A => A,
        B => B,
        C => C,
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7
    );

    
    simulation_process :process
    begin
        -- D0 = high
        A <= '0';
        B <= '0';
        C <= '0';
        wait for 5ns;
        
        -- D1 = high
        A <= '0';
        B <= '0';
        C <= '1';
        wait for 5ns;
        
        -- D2 = high
        A <= '0';
        B <= '1';
        C <= '0';
        wait for 5ns;
        
        -- D3 = high
        A <= '0';
        B <= '1';
        C <= '1';
        wait for 5ns;
        
        -- D4 = high
        A <= '1';
        B <= '0';
        C <= '0';
        wait for 5ns;
        
        -- D5 = high
        A <= '1';
        B <= '0';
        C <= '1';
        wait for 5ns;
        
        -- D6 = high
        A <= '1';
        B <= '1';
        C <= '0';
        wait for 5ns;
        
        -- D7 = high
        A <= '1';
        B <= '1';
        C <= '1';
        wait for 5ns;
        
     end process;
    
end Behavioral;