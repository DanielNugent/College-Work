library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity memory_tb is
end memory_tb;

architecture Behavioral of memory_tb is

    component memory 
        Port(
            address : in std_logic_vector(15 downto 0);
            WD : in std_logic_vector(15 downto 0); --in
            MW : in std_logic;
            MR : in std_logic;
            read_data : out std_logic_vector(15 downto 0) -- out
        );
    end component;

    signal address, WD, read_data : std_logic_vector(15 downto 0) := x"0000";
    signal MW, MR : std_logic := '0';


begin

    uut : memory
        Port Map(
            address => address,
            WD => WD,
            MW => MW,
            MR => MR,
            read_data => read_data
        );
    
    sim : process
    begin
        -- read address 4
        address <= x"0004";
        WD <= x"0000";
        MW <= '0';
        MR <= '1';
        wait for 10 ns;

        MR <= '0';
        wait for 10 ns;

        -- write to address 4
        address <= x"0004";
        WD <= x"ABAB";
        MW <= '1';
        MR <= '1';
        wait for 10 ns;

        MR <= '0';
        wait for 10 ns;

        -- read data just written to address 4
        address <= x"0004";
        WD <= x"0000";
        MW <= '0';
        MR <= '1';

        MR <= '0';
        wait for 10 ns;

    end process;

end Behavioral ; -- Behavioral