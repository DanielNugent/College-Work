library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- components:
--            -> Datapath
--            -> Micro-programmed Control
--            -> Memory 512x16

entity cpu is 
    Port(
        clk : in std_logic;
        reset : in std_logic;
        r0 : out std_logic_vector(15 downto 0);
        r1 : out std_logic_vector(15 downto 0);
        r2 : out std_logic_vector(15 downto 0);
        r3 : out std_logic_vector(15 downto 0);
        r4 : out std_logic_vector(15 downto 0);
        r5 : out std_logic_vector(15 downto 0);
        r6 : out std_logic_vector(15 downto 0);
        r7 : out std_logic_vector(15 downto 0)
    );
end cpu;

architecture Behavioral of cpu is

    component datapath
        Port(
            data_in : in std_logic_vector(15 downto 0);
            
            pc_in : in std_logic_vector(15 downto 0);
            
            SB: in std_logic_vector(2 downto 0);            
            
            MB : in std_logic;        
            MD : in std_logic;
            MM : in std_logic;
            
            Dsel : in std_logic_vector(3 downto 0);
            Asel : in std_logic_vector(3 downto 0);
            Bsel : in std_logic_vector(3 downto 0);
    
            
            FS : in std_logic_vector(4 downto 0);
            RW : in std_logic;
            Clk : in std_logic;
    
            adr_out : out std_logic_vector(15 downto 0);
            data_out : out std_logic_vector(15 downto 0);
            
            reg_0_out : out std_logic_vector(15 downto 0);
            reg_1_out : out std_logic_vector(15 downto 0);
            reg_2_out : out std_logic_vector(15 downto 0);
            reg_3_out : out std_logic_vector(15 downto 0);
            reg_4_out : out std_logic_vector(15 downto 0);
            reg_5_out : out std_logic_vector(15 downto 0);
            reg_6_out : out std_logic_vector(15 downto 0);
            reg_7_out : out std_logic_vector(15 downto 0);
            reg_8_out : out std_logic_vector(15 downto 0);
            
            v, c, n, z : out std_logic
        );
    end component; 

    component microprogrammed_control
        Port(
            instruction_sel : in std_logic_vector(15 downto 0);
            reset : in std_logic;
            clk : in std_logic;
    
            v : in std_logic;
            c : in std_logic; --flags
            n : in std_logic;
            z : in std_logic;
    
            pc_out : out std_logic_vector(15 downto 0);
            dr : out std_logic_vector(2 downto 0);
            sa : out std_logic_vector(2 downto 0);
            sb : out std_logic_vector(2 downto 0);
            td : out std_logic;
            ta : out std_logic;
            tb : out std_logic;
            mb : out std_logic;
            fs : out std_logic_vector(4 downto 0);
            md : out std_logic;
            rw : out std_logic;
            mm : out std_logic;
            mw : out std_logic;
    
            
            PL : out std_logic;
            PI : out std_logic;
            IL : out std_logic;
            MC : out std_logic;
            MS : out std_logic_vector(2 downto 0);
            NA : out std_logic_vector(7 downto 0)
            
        );
    end component;

    component memory
        Port(
            address : in std_logic_vector(15 downto 0);
            WD : in std_logic_vector(15 downto 0); --in
            MW : in std_logic;
            MR : in std_logic;
            read_data : out std_logic_vector(15 downto 0) -- out
        );
    end component;

    signal adr_out : std_logic_vector(15 downto 0);
    signal data_out : std_logic_vector(15 downto 0);
    signal V : std_logic;
    signal C : std_logic;
    signal N : std_logic;
    signal Z : std_logic;
    signal PC : std_logic_vector(15 downto 0);
    signal DR, SA, SB : std_logic_vector(2 downto 0);
    signal TD, TA, TB : std_logic;
    signal MB, MM, MW, MD : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal RW : std_logic;
    signal memOut : std_logic_vector(15 downto 0);
    signal pcOut : std_logic_vector(15 downto 0);


begin
    mc : microprogrammed_control
            Port Map(
                instruction_sel => memOut,
                clk => clk,
                reset => reset,
                v => V,
                c => C,
                n => N,
                z => Z,
                pc_out => pcOut,
                MW => MW,
                MM => MM,
                MD => MD,
                MB => MB,
                FS => FS,
                RW => RW,
                TD => TD,
                TA => TA,
                TB => TB,
                DR => DR,
                SA => SA,
                SB => SB
            );

    dp : datapath
        Port Map(
             data_in => memOut,
             PC_in => pcOut,
        
             SB => SB,
             
             MB => MB,
             MD => MD,
             MM => MM,
            
             ASel(2 downto 0) => SA,
             ASel(3) => TA,
             BSel(2 downto 0) => SB,
             BSel(3) => TB,
             DSel(2 downto 0) => DR,
             DSel(3) => TD,
             
             FS => FS,
             RW => RW,
             Clk => clk,
             
             adr_out => adr_out,
             data_out => data_out,
             
             reg_0_out => r0,
             reg_1_out => r1,
             reg_2_out => r2,
             reg_3_out => r3,
             reg_4_out => r4,
             reg_5_out => r5,
             reg_6_out => r6,
             reg_7_out => r7,
             
             v => V,
             c => C,
             n => N,
             z => Z
        );

    mem : memory
        Port Map(
            address => adr_out,
            WD => data_out,
            MW => MW,
            MR => clk,
            read_data => memOut
        );

    
end Behavioral ; -- Behavioral