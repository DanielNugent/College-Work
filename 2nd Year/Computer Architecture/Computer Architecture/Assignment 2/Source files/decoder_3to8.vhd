library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_3to8 is
    Port(
        A: in std_logic_vector(2 downto 0);
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

        D0 <= ((not A(2)) and (not A(1)) and (not A(0))) after 1 ns;
        D1 <= ((not A(2)) and (not A(1)) and      A(0))  after 1 ns;
        D2 <= ((not A(2)) and      A(1)  and (not A(0))) after 1 ns;
        D3 <= ((not A(2)) and      A(1)  and      A(0))  after 1 ns;
        D4 <=      (A(2)  and (not A(1)) and (not A(0))) after 1 ns;
        D5 <=      (A(2)  and (not A(1)) and      A(0))  after 1 ns;
        D6 <=      (A(2)  and      A(1)  and (not A(0))) after 1 ns;
        D7 <=      (A(2)  and      A(1)  and      A(0))  after 1 ns;
    

end Behavioral; -- Behavioral