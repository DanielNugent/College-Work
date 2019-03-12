library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    Port(
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        Cin: in std_logic;
        g_sel: in std_logic_vector(2 downto 0);
        Cout: out std_logic;
        v: out std_logic;
        g: out std_logic_vector(15 downto 0)
    );
end alu;

architecture Behavioral of alu is

    -- arithmetic unit
    component ripple_adder16
        Port(
            A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            Cin: in std_logic;
            S: out std_logic_vector(15 downto 0);
            Cout: out std_logic;
            V: out std_logic
        );
    end component;

    component logic_unit
        Port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            z : out std_logic_vector(15 downto 0)
        );
    end component;
 
    -- mux to choose between arithmetic operation or logic operation
    component mux_2to1
        Port(
            I0: in std_logic_vector(15 downto 0);
            I1: in std_logic_vector(15 downto 0);
            S: in std_logic;
            Z: out std_logic_vector(15 downto 0)
        );
    end component;

    signal y, arith_z, logic_z : std_logic_vector(15 downto 0);

begin

    ra: ripple_adder16
        Port Map(
            A => a,
            B => y,
            Cin => Cin,
            S => arith_z,
            Cout => Cout,
            V => v
        );

    mux: mux_2to1
        Port Map(
            I0 => arith_z,
            I1 => logic_z,
            S => g_Sel(2),
            Z => g
        );

    lu : logic_unit
        Port Map (
            a => a,
            b => b,
            s => g_sel(1 downto 0),
            z => logic_z
        );

    with g_sel(1 downto 0) select
        y <= x"0000" after 1 ns when "00",
                   b after 1 ns when "01",
               not b after 1 ns when "10",
             x"FFFF" after 1 ns when "11",
             "UUUUUUUUUUUUUUUU" after 1 ns when others;

end Behavioral ; -- Behavioral
