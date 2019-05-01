library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_4to9tb is
end decoder_4to9tb;

architecture Behavioral of decoder_4to9tb is

    component decoder_4to9 is
    Port( 
            A : in std_logic_vector(3 downto 0);  
            RW : in std_logic;
            D0 : out std_logic;
            D1 : out std_logic;
            D2 : out std_logic;
            D3 : out std_logic;
            D4 : out std_logic;
            D5 : out std_logic;
            D6 : out std_logic;
            D7 : out std_logic;
            D8 : out std_logic
    );
    end component;
    
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal RW : std_logic := '0';
     
    signal D0 : std_logic := '0';
    signal D1 : std_logic := '0';
    signal D2 : std_logic := '0';
    signal D3 : std_logic := '0';
    signal D4 : std_logic := '0';
    signal D5 : std_logic := '0';
    signal D6 : std_logic := '0';
    signal D7 : std_logic := '0';
    signal D8 : std_logic := '0';

begin

    uut : decoder_4to9
    Port map(
        A => A,
        RW => RW,
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7,
        D8 => D8
    );

    
    sim :process
    begin

        RW <= '1';

        A <= "0000";
        wait for 10 ns;
        

        A <= "0001";
        wait for 10 ns;

        A <= "0010";
        wait for 10 ns;
        

        A <= "0100";
        wait for 10 ns;
        
 
        A <= "0101";
        wait for 10 ns;
        

        A <= "0110";
        wait for 10 ns;
        

        A <= "0111";
        wait for 10 ns;
        

        A <= "1000";
        wait for 10 ns;

     end process;
    
end Behavioral;