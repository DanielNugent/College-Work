library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_4to9 is
    Port(
        A: in std_logic_vector(3 downto 0);
        RW: in std_logic;
        D0: out std_logic;
        D1: out std_logic;
        D2: out std_logic;
        D3: out std_logic;
        D4: out std_logic;
        D5: out std_logic;
        D6: out std_logic;
        D7: out std_logic;
        D8: out std_logic
    );
end decoder_4to9;

architecture Behavioral of decoder_4to9 is

    begin
        D0<= '1' after 5ns when A = "0000" and RW = '1' else '0' after 5ns;
        D1<= '1' after 5ns when A = "0001" and RW = '1' else '0' after 5ns;
        D2<= '1' after 5ns when A = "0010" and RW = '1' else '0' after 5ns;
        D3<= '1' after 5ns when A = "0011" and RW = '1' else '0' after 5ns;
        D4<= '1' after 5ns when A = "0100" and RW = '1' else '0' after 5ns;
        D5<= '1' after 5ns when A = "0101" and RW = '1' else '0' after 5ns;
        D6<= '1' after 5ns when A = "0110" and RW = '1' else '0' after 5ns;
        D7<= '1' after 5ns when A = "0111" and RW = '1' else '0' after 5ns;
        D8<= '1' after 5ns when A = "1000" and RW = '1' else '0' after 5ns;
    end Behavioral;