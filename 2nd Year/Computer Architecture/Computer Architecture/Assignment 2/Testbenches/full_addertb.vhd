library IEEE;
use IEEE.std_logic_1164.ALL;

entity full_addertb is
end full_addertb;

architecture Behavioral of full_addertb is

    component full_adder
        port (
            A, B : in std_logic;
            Cin : in std_logic;
            S : out std_logic;
            Cout : out std_logic
        );
    end component;

    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal Cin : std_logic := '0';

    signal S : std_logic;
    signal Cout : std_logic;

begin

    uut : full_adder
        Port Map (
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout
        );

    sim : process

    begin

        wait for 1 ns;
        A <= '0';
        B <= '0';
        Cin <= '1';

        wait for 1 ns;
        A <= '0';
        B <= '1';
        Cin <= '0';

        wait for 1 ns;
        A <= '0';
        B <= '1';
        Cin <= '1';

        wait for 1 ns;
        A <= '1';
        B <= '0';
        Cin <= '0';

        wait for 1 ns;
        A <= '1';
        B <= '0';
        Cin <= '1';

        wait for 1 ns;
        A <= '1';
        B <= '1';
        Cin <= '0';

        wait for 1 ns;
        A <= '1';
        B <= '1';
        Cin <= '1';
        
        wait;

    end process;

end Behavioral;
