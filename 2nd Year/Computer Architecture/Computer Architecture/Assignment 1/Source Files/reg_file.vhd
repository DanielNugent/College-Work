library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_file is
    Port(
        src_s0: in std_logic;
        src_s1: in std_logic; -- select lines for 8:1 mux
        src_s2: in std_logic;

        des_A: in std_logic;
        des_B: in std_logic; -- inputs for 3:8 decoder
        des_C: in std_logic; 

        Clk: in std_logic; -- common clock signal
        data_src: in std_logic; -- select line for 2:1 mux
        data: in std_logic_vector(15 downto 0);
        reg0: out std_logic_vector(15 downto 0);
        reg1: out std_logic_vector(15 downto 0);
        reg2: out std_logic_vector(15 downto 0);
        reg3: out std_logic_vector(15 downto 0);
        reg4: out std_logic_vector(15 downto 0);
        reg5: out std_logic_vector(15 downto 0);
        reg6: out std_logic_vector(15 downto 0);
        reg7: out std_logic_vector(15 downto 0)
    );
end reg_file;

architecture Behavioral of reg_file is
-- components

    -- 16 bit register
    component reg16
    Port(
        D: in std_logic_vector(15 downto 0);
        load: in std_logic;
        Clk: in std_logic;
        Q: out std_logic_vector(15 downto 0)
    );
    end component;

    -- 3:8 decoder
    component decoder_3to8
    Port(
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        D0: out std_logic;
        D1: out std_logic;
        D2: out std_logic;
        D3: out std_logic;
        D4: out std_logic;
        D5: out std_logic;
        D6: out std_logic;
        D7: out std_logic
    );
    end component;

    -- 2:1 multiplexer
    component mux_2to1
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        S: in std_logic;
        Z: out std_logic_vector(15 downto 0)
    );
    end component;

    -- 8:1 multiplexer
    component mux_8to1
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        I2: in std_logic_vector(15 downto 0);
        I3: in std_logic_vector(15 downto 0);
        I4: in std_logic_vector(15 downto 0);
        I5: in std_logic_vector(15 downto 0);
        I6: in std_logic_vector(15 downto 0);
        I7: in std_logic_vector(15 downto 0);
        S0: in std_logic;
        S1: in std_logic;
        S2: in std_logic;
        Z: out std_logic_vector(15 downto 0)
    );
    end component;

    -- signals
    signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, 
           load_reg5, load_reg6, load_reg7: std_logic;

    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, 
           reg7_q, data_src_mux_out, src_reg: std_logic_vector(15 downto 0);

    begin
        -- port maps;-)

        -- register 0
        reg00: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg0,
            Clk => Clk,
            Q => reg0_q
        );

        -- register 1
        reg01: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg1,
            Clk => Clk,
            Q => reg1_q
        );

        -- register 2
        reg02: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg2,
            Clk => Clk,
            Q => reg2_q
        );

        -- register 3
        reg03: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg3,
            Clk => Clk,
            Q => reg3_q
        );

        -- register 4
        reg04: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg4,
            Clk => Clk,
            Q => reg4_q
        );

        -- register 5
        reg05: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg5,
            Clk => Clk,
            Q => reg5_q
        );

        -- register 6
        reg06: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg6,
            Clk => Clk,
            Q => reg6_q
        );

        -- register 7
        reg07: reg16 Port Map(
            D => data_src_mux_out,
            load => load_reg7,
            Clk => Clk,
            Q => reg7_q
        );

        -- destination register decoder 3:8
        des_decoder_3to8: decoder_3to8 Port Map(
            A => des_A,
            B => des_B,
            C => des_C,
            D0 => load_reg0,
            D1 => load_reg1,
            D2 => load_reg2,
            D3 => load_reg3,
            D4 => load_reg4,
            D5 => load_reg5,
            D6 => load_reg6,
            D7 => load_reg7
        );

        -- 2:1 data source multiplexer
        data_src_mux2_16bit: mux_2to1 Port Map(
            I0 => data,
            I1 => src_reg,
            S => data_src,
            Z => data_src_mux_out
        );

        -- 8:1 source register multiplexer
        Inst_mux8_16bit: mux_8to1 Port Map(
            I0 => reg0_q,
            I1 => reg1_q,
            I2 => reg2_q,
            I3 => reg3_q,
            I4 => reg4_q,
            I5 => reg5_q,
            I6 => reg6_q,
            I7 => reg7_q,
            S0 => src_s0,
            S1 => src_s1,
            S2 => src_s2,
            Z => src_reg
        );

        reg0 <= reg0_q;
        reg1 <= reg1_q;
        reg2 <= reg2_q;
        reg3 <= reg3_q;
        reg4 <= reg4_q;
        reg5 <= reg5_q;
        reg6 <= reg6_q;
        reg7 <= reg7_q;
end Behavioral ; -- Behavioral