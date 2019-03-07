library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity func_unit is
    Port(
        a, b: in std_logic_vector(15 downto 0);
        fs: in std_logic_vector(4 downto 0);    -- function select
        f: out std_logic_vector(15 downto 0);
        v, c, n, z: out std_logic   -- flags
    );
end func_unit;

architecture Behavioral of func_unit is

    component alu
        Port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            c_in : in std_logic;
            g_sel : in std_logic_vector(2 downto 0);
            c_out : out std_logic;
            v : out std_logic;
            g : out std_logic_vector(15 downto 0)
        );
    end component;

    component shifter
        Port(
            b: in std_logic_vector(15 downto 0);
            s: in std_logic_vector(1 downto 0);
            il, ir: in std_logic;
            h: out std_logic_vector(15 downto 0)
        );
    end component;
    
    component mux_2to1
        Port(
            I0: in std_logic_vector(15 downto 0);
            I1: in std_logic_vector(15 downto 0);
            S: in std_logic;
            Z: out std_logic_vector(15 downto 0)
        );
    end component;
     
    component zero_detect
        Port(
            A: in std_logic_vector(15 downto 0);
            Z: out std_logic
        );
    end component;

    signal g, h: std_logic_vector(15 downto 0);

begin

    alu: alu
        Port Map(
            a => a,
            b => b,
            Cin => fs(0),
            g_sel => fs(3 downto 0),
            Cout => c,
            v => v,
            g => g
        );

    shifter: shifter
        Port Map(
            b => b,
            s =. fs(3 downto 0),
            il => '0',
            ir => '0',
            h => h
        );

    mux_mf: mux_2to1
        Port Map(
            I0 => g,
            I1 => h,
            S => fs(4),
            Z => f
        );

    n <= g(15);

end Behavioral ; -- Behavioral