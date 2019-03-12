library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
    Port(
        b: in std_logic_vector(15 downto 0);
        s: in std_logic_vector(1 downto 0);
        il, ir: in std_logic;
        h: out std_logic_vector(15 downto 0)
    );
end shifter;

architecture Behavioral of shifter is 
    
    component mux_3to1
        Port(
            I0, I1, I2: in std_logic;
            S: in std_logic_vector(1 downto 0);
            Z: out std_logic
        );
    end component;

begin
    mux00: mux_3to1
        Port Map(
            I0 => b(0),
            I1 => b(1),
            I2 => il,
            S => s,
            Z => h(0)
        );

    mux01: mux_3to1
        Port Map(
            I0 => b(1),
            I1 => b(2),
            I2 => b(0),
            S => s,
            Z => h(1)
        );

    mux02: mux_3to1
        Port Map(
            I0 => b(2),
            I1 => b(3),
            I2 => b(1),
            S => s,
            Z => h(2)
        );

    mux03: mux_3to1
        Port Map(
            I0 => b(3),
            I1 => b(4),
            I2 => b(2),
            S => s,
            Z => h(3)
        );

    mux04: mux_3to1
        Port Map(
            I0 => b(4),
            I1 => b(5),
            I2 => b(3),
            S => s,
            Z => h(4)
        );

    mux05: mux_3to1
        Port Map(
            I0 => b(5),
            I1 => b(6),
            I2 => b(4),
            S => s,
            Z => h(5)
        );

    mux06: mux_3to1
        Port Map(
            I0 => b(6),
            I1 => b(7),
            I2 => b(5),
            S => s,
            Z => h(6)
        );

    mux07: mux_3to1
        Port Map(
            I0 => b(7),
            I1 => b(8),
            I2 => b(6),
            S => s,
            Z => h(7)
        );

    mux08: mux_3to1
        Port Map(
            I0 => b(8),
            I1 => b(9),
            I2 => b(7),
            S => s,
            Z => h(8)
        );

    mux09: mux_3to1
        Port Map(
            I0 => b(9),
            I1 => b(10),
            I2 => b(8),
            S => s,
            Z => h(9)
        );

    mux10: mux_3to1
        Port Map(
            I0 => b(10),
            I1 => b(11),
            I2 => b(9),
            S => s,
            Z => h(10)
        );

    mux11: mux_3to1
        Port Map(
            I0 => b(11),
            I1 => b(12),
            I2 => b(10),
            S => s,
            Z => h(11)
        );

    mux12: mux_3to1
        Port Map(
            I0 => b(12),
            I1 => b(13),
            I2 => b(11),
            S => s,
            Z => h(12)
        );

    mux13: mux_3to1
        Port Map(
            I0 => b(13),
            I1 => b(14),
            I2 => b(12),
            S => s,
            Z => h(13)
        );

    mux14: mux_3to1
        Port Map(
            I0 => b(14),
            I1 => b(15),
            I2 => b(13),
            S => s,
            Z => h(14)
        );

    mux15: mux_3to1
        Port Map(
            I0 => b(15),
            I1 => b(14),
            I2 => ir,
            S => s,
            Z => h(15)
        );

end Behavioral ; -- Behavioral