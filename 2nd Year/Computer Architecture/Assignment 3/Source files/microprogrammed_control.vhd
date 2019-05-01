library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- components:
--            -> CAR
--            -> IR
--            -> PC
--            -> extend
--            -> control memory
--            -> mux 2:1, 8 bit
--            -> mux 8:1, 1 bit
entity microprogrammed_control is 
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

        -- extra stuff for ease of functionality later
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0)
        
    );
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is

component pc
    Port(
        PC_in : in std_logic_vector(15 downto 0);
        PL: in std_logic;
        PI: in std_logic;
        Clk: in std_logic; 
        Reset: in std_logic;
        PC_Out: out std_logic_vector(15 downto 0)
    );
end component;

component extend
    Port(
        DR_SB : in std_logic_vector(5 downto 0);
        ext : out std_logic_vector(15 downto 0)
    );
end component;

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

component car
    Port(
        car_in : in std_logic_vector(7 downto 0);
        s, reset : in std_logic;
        car_out : out std_logic_vector(7 downto 0)
    );
end component;

component mux_2to1_8bit
    Port(
        I0: in std_logic_vector(7 downto 0);
        I1: in std_logic_vector(7 downto 0);
        S: in std_logic;
        Z: out std_logic_vector(7 downto 0) 
    );
end component;

component mux_8to1_1bit
    Port(
        I0: in std_logic;
        I1: in std_logic;
        I2: in std_logic;
        I3: in std_logic;
        I4: in std_logic;
        I5: in std_logic;
        I6: in std_logic;
        I7: in std_logic;
        src: in std_logic_vector(2 downto 0);
        Z: out std_logic
    );
end component;

component control_memory
    Port(
        MM : out std_logic;
        MW : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PI : out std_logic;
        PL : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0); 
        NA : out std_logic_vector(7 downto 0);
        IN_CAR : in std_logic_vector(7 downto 0)
    );
end component;

    signal PL_out, PI_out, IL_out, MC_out : std_logic;
    signal MS_out : std_logic_vector(2 downto 0);
    signal NA_out : std_logic_vector(7 downto 0);
    signal MUXS_OUT : std_logic; 
    signal notC : std_logic; 
    signal notZ : std_logic;
    signal DR_PC : std_logic_vector(2 downto 0); 
    signal SA_PC : std_logic_vector(2 downto 0);
    signal SB_PC : std_logic_vector(2 downto 0);
    signal IN_CAR : std_logic_vector(7 downto 0);
    signal MUXC_OUT : std_logic_vector(7 downto 0);
    signal OPCODE : std_logic_vector(6 downto 0);
    signal PCin : std_logic_vector(15 downto 0);
    signal PCout : std_logic_vector(15 downto 0);

begin

    ext0 : extend
        Port Map(
            DR_SB(2 downto 0) => SB_PC,
            DR_SB(5 downto 3) => DR_PC,
            ext => PCin
        );

    program_counter : pc
        Port Map(
            PC_in => PCin,
            PL => PL_out,
            PI => PI_out,
            Clk => clk,
            Reset => reset,
            PC_Out => PCout
        );



    mux_s : mux_8to1_1bit
        Port Map(
            I0 => '0',
            I1 => '1',
            I2 => c,
            I3 => v,
            I4 => z,
            I5 => n,
            I6 => notC,
            I7 => notZ,
            src(0) => MS_out(0),
            src(1) => MS_out(1),
            src(2) => MS_out(2),           
            Z => MUXS_out
        );

    instruction_register : IR 
        Port Map(
            ir_in => instruction_sel,
            il => IL_out,
            clk => clk,
            dr => DR_PC,
            sa => SA_PC,
            sb => SB_PC,
            opcode => OPCODE
        );

    control_mem : control_memory
        Port Map(
            IN_CAR => IN_CAR,
            MM => MM,
            MW => MW,
            RW => RW,
            MD => MD,
            FS => FS,
            MB => MB,
            TB => TB,
            TA => TA,
            TD => TD,
            PI => PI_out,
            PL => PL_out,
            IL => IL_out,
            MC => MC_out,
            MS => MS_out,
            NA => NA_out
        );

    car0 : car
        Port Map(
            car_in => MUXC_OUT,
            car_out => IN_CAR,
            reset => reset,
            s => MUXS_OUT
        );

    mux_c : mux_2to1_8bit
        Port Map(
            I1(0) => OPCODE(0),
            I1(1) => OPCODE(1),
            I1(2) => OPCODE(2),
            I1(3) => OPCODE(3),
            I1(4) => OPCODE(4),
            I1(5) => OPCODE(5),
            I1(6) => OPCODE(6),
            I1(7) => '0',
            I0 => NA_out,
            S => MC_out,
            Z => MUXC_OUT
        );

    PL <= PL_out;
    PI <= PI_out;
    IL <= IL_out;
    MC <= MC_out;
    MS <= MS_out;
    NA <= NA_out;
    DR <= DR_PC;
    SA <= SA_PC;
    SB <= SB_PC;    
end Behavioral ; -- Behavioral