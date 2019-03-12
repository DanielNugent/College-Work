library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_3to8 is
    Port(
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        D0: out std_logic;
        D1: out std_logic;
        D2: out std_logic;
        D3: out std_logic;
        D4: out std_logic;
        D5: out std_logic;
        D6: out std_logic;
        D7: out std_logic
    );
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

begin
    D0<= ((not A) and (not B) and (not C)) after 5 ns;
    D1<= ((not A) and (not B) and (C)) after 5 ns;
    D2<= ((not A) and (B) and (not C)) after 5 ns;
    D3<= ((not A) and (B) and (C)) after 5 ns;
    D4<= ((A) and (not B) and (not C)) after 5 ns;
    D5<= ((A) and (not B) and (C)) after 5 ns;
    D6<= ((A) and (B) and (not C)) after 5 ns;
    D7<= ((A) and (B) and (C)) after 5 ns;

end Behavioral; -- Behavioral