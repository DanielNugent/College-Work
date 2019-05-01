library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR_tb is 
end IR_tb;

architecture Behavioral of IR_tb is

    component IR
        Port(
            ir_in: in std_logic_vector(15 downto 0);
            il: in std_logic;
            clk: in std_logic;
            dr: out std_logic_vector(2 downto 0);
            sa: out std_logic_vector(2 downto 0);
            sb: out std_logic_vector(2 downto 0);
            opcode: out std_logic_vector(6 downto 0)
        );
    end component;

    signal ir_in: std_logic_vector(15 downto 0) := x"0000";
    signal il: std_logic := '0';
    signal clk: std_logic := '0';
    signal dr: std_logic_vector(2 downto 0) := "000";
    signal sa: std_logic_vector(2 downto 0) := "000";
    signal sb: std_logic_vector(2 downto 0) := "000";
    signal opcode: std_logic_vector(6 downto 0) := "0000000";

begin

    uut : IR
        Port Map(
            ir_in => ir_in,
            il => il,
            clk => clk,
            dr => dr,
            sa => sa,
            sb => sb,
            opcode => opcode
        );

    sim : process
    begin
        -- load blank into ir_in
        ir_in <= x"0000";
        il <= '1';
        clk <= '1';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        -- load some arbitrary ir_in
        ir_in <= x"ABCD";
        il <= '1';
        clk <= '1';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        -- check to see that nothing changes when il = 0
        ir_in <= x"DCBA";
        il <= '0';
        clk <= '1';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

    end process;
end Behavioral ; -- Behavioral