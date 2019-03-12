library IEEE;
use IEEE.std_logic_1164.ALL;

entity datapathtb is
end datapathtb;

architecture Behavioral of datapathtb is

    constant delay : time := 20 ns;
    constant clk_period : time := 20 ns;

    component datapath is
        port (
            write : in std_logic;
            d_address : in std_logic_vector(2 downto 0);
            a_address : in std_logic_vector(2 downto 0);
            b_address : in std_logic_vector(2 downto 0);
            constant_in : in std_logic_vector(15 downto 0);
            mb_sel : in std_logic;
            data_in : in std_logic_vector(15 downto 0);
            md_sel : in std_logic;
            fs : in std_logic_vector(4 downto 0);
            clk : in std_logic;
            address_out : out std_logic_vector(15 downto 0);
            data_out : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;
    
    signal write : std_logic;
    signal d_address : std_logic_vector(2 downto 0);
    signal a_address : std_logic_vector(2 downto 0);
    signal b_address : std_logic_vector(2 downto 0);
    signal constant_in : std_logic_vector(15 downto 0);
    signal mb_sel : std_logic := '0'; 
    signal data_in : std_logic_vector(15 downto 0);
    signal md_sel : std_logic := '0'; 
    signal fs : std_logic_vector(4 downto 0);
    
    signal v, c, n, z : std_logic;
    signal address_out : std_logic_vector(15 downto 0);
    signal data_out : std_logic_vector(15 downto 0);
    
    signal clk : std_logic;

begin

    uut: datapath
        port map (
            write => write,
            d_address => d_address,
            a_address => a_address,
            b_address => b_address,
            constant_in => constant_in,
            mb_sel => mb_sel,
            data_in => data_in,
            md_sel => md_sel,
            fs => fs,
            clk => clk,
            address_out => address_out,
            data_out => data_out,
            v => v,
            c => c,
            n => n,
            z => z
        );

    clock : process
    begin
        clk <= '0';
        wait for clk_period / 2;

        clk <= '1';
        wait for clk_period / 2;

    end process;

    sim : process
    begin

        wait for delay;

        write <= '1';
        md_sel <= '1';

        wait for delay;
        d_address <= "000";
        data_in <= x"AAAA";

        wait for clk_period;
        d_address <= "001";
        data_in <= x"BBBB";

        wait for clk_period;
        d_address <= "010";
        data_in <= x"CCCC";

        wait for clk_period;
        d_address <= "011";
        data_in <= x"DDDD";

        wait for clk_period;
        d_address <= "100";
        data_in <= x"EEEE";

        wait for clk_period;
        d_address <= "101";
        data_in <= x"9999";

        wait for clk_period;
        d_address <= "110";
        data_in <= x"8888";

        wait for clk_period;
        d_address <= "111";
        data_in <= x"7777";
        
        wait for clk_period;

        -- disable writing to registers
        write <= '0';

        -- test bus A
        a_address <= "000";
        wait for delay;

        -- test bus B
        b_address <= "001";
        wait for delay;
        
        -- select bus B <- b_data
        mb_sel <= '0';
        wait for delay;

        md_sel <= '0';
        d_address <= "011";
        write <= '1';
        wait for delay;

        -- test function unit
        --- arithmetic
        fs <= "00000";
        wait for delay;
        
        fs <= "00001";
        wait for delay;
        
        fs <= "00010";
        wait for delay;
        
        fs <= "00011";
        wait for delay;
        
        fs <= "00100";
        wait for delay;
        
        fs <= "00101";
        wait for delay;
        
        fs <= "00110";
        wait for delay;
        
        fs <= "00111";
        wait for delay;
        
        --- logic
        fs <= "01000";
        wait for delay;
        
        fs <= "01010";
        wait for delay;
        
        fs <= "01100";
        wait for delay;
        
        fs <= "01110";
        wait for delay;
        
        --- shifter
        fs <= "10000";
        wait for delay;

        fs <= "10100";
        wait for delay;
        
        fs <= "11000";
        wait for delay;
        
        -- constant_in test
        constant_in <= x"0002";
        mb_sel <= '1';

        wait for delay;

        -- test A + constant
        fs <= "00010";
        
        wait;
    end process;
    
end Behavioral;
