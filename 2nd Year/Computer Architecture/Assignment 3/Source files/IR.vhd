library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity IR is
    Port(
        ir_in: in std_logic_vector(15 downto 0);
        il: in std_logic;
        clk: in std_logic;
        dr: out std_logic_vector(2 downto 0);
        sa: out std_logic_vector(2 downto 0);
        sb: out std_logic_vector(2 downto 0);
        opcode: out std_logic_vector(6 downto 0)
    );
end IR;

architecture Behavioral of IR is

    signal ir_sig: std_logic_vector(15 downto 0);

begin
    ir_sig <= ir_in after 1 ns when il = '1' else ir_sig after 1 ns;

    opcode <= ir_sig(15 downto 9) when clk = '1';
    dr <= ir_sig(8 downto 6) when clk = '1';
    sa <= ir_sig(5 downto 3) when clk = '1';
    sb <= ir_sig(2 downto 0) when clk = '1';
    
end Behavioral ; -- Behavioral