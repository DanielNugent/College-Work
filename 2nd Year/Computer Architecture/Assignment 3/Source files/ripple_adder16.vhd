library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_adder16 is
    Port(
        A: in std_logic_vector(15 downto 0);
        B: in std_logic_vector(15 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(15 downto 0);
        Cout: out std_logic;
        V: out std_logic
    );
end ripple_adder16;

architecture Behavioral of ripple_adder16 is

    signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16: std_logic;

    component full_adder
        Port(
            A, B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;

begin
    fa00: full_adder 
        Port Map(
            A => A(0),
            B => B(0),
            Cin => Cin,
            S => S(0),
            Cout => c1
        );

    fa01: full_adder 
        Port Map(
            A => A(1),
            B => B(1),
            Cin => c1,
            S => S(1),
            Cout => c2
        );
    
    fa02: full_adder 
        Port Map(
            A => A(2),
            B => B(2),
            Cin => c2,
            S => S(2),
            Cout => c3
        );
    fa03: full_adder 
        Port Map(
            A => A(3),
            B => B(3),
            Cin => c3,
            S => S(3),
            Cout => c4
        );
        
    fa04: full_adder 
        Port Map(
            A => A(4),
            B => B(4),
            Cin => c4,
            S => S(4),
            Cout => c5
        );

    fa05: full_adder 
        Port Map(
            A => A(5),
            B => B(5),
            Cin => c5,
            S => S(5),
            Cout => c6
        );
        
    fa06: full_adder 
        Port Map(
            A => A(6),
            B => B(6),
            Cin => c6,
            S => S(6),
            Cout => c7
        );

    fa07: full_adder 
        Port Map(
            A => A(7),
            B => B(7),
            Cin => c7,
            S => S(7),
            Cout => c8
        );

    fa08: full_adder 
        Port Map(
            A => A(8),
            B => B(8),
            Cin => c8,
            S => S(8),
            Cout => c9
        );

    fa09: full_adder 
        Port Map(
            A => A(9),
            B => B(9),
            Cin => c9,
            S => S(9),
            Cout => c10
        );

    fa10: full_adder 
        Port Map(
            A => A(10),
            B => B(10),
            Cin => c10,
            S => S(10),
            Cout => c11
        );

    fa11: full_adder 
        Port Map(
            A => A(11),
            B => B(11),
            Cin => c11,
            S => S(11),
            Cout => c12
        );

    fa12: full_adder 
        Port Map(
            A => A(12),
            B => B(12),
            Cin => c12,
            S => S(12),
            Cout => c13
        );

    fa013: full_adder 
        Port Map(
            A => A(13),
            B => B(13),
            Cin => c13,
            S => S(13),
            Cout => c14
        );

    fa14: full_adder 
        Port Map(
            A => A(14),
            B => B(14),
            Cin => c14,
            S => S(14),
            Cout => c15
        );

    fa15: full_adder 
        Port Map(
            A => A(15),
            B => B(15),
            Cin => c15,
            S => S(0),
            Cout => c16
        );

    Cout <= c16;
    V <= c15 xor c16;
    
end Behavioral ; -- Behavioral