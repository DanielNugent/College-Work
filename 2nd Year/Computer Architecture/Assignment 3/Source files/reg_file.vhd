library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_file is
    Port(
		DA: in std_logic_vector(3 downto 0);	
		AA : in std_logic_vector(3 downto 0);
		BA : in std_logic_vector(3 downto 0);
		
		clk : in std_logic;
		RW : in std_logic;
		
		data : in std_logic_vector(15 downto 0);
		
		a_out : out std_logic_vector(15 downto 0);
		b_out : out std_logic_vector(15 downto 0);
		
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0);
        reg8 : out std_logic_vector(15 downto 0)
    );
end reg_file;

architecture Behavioral of reg_file is
-- components

    -- 16 bit register
    component reg16
    Port(
        D: in std_logic_vector(15 downto 0);
        load: in std_logic;
        clk: in std_logic;
        Q: out std_logic_vector(15 downto 0)
    );
    end component;

    -- 4:9 decoder, D address select
    component decoder_4to9
    Port(
        A: in std_logic_vector(3 downto 0);
        RW: in std_logic;
        D0: out std_logic;
        D1: out std_logic;
        D2: out std_logic;
        D3: out std_logic;
        D4: out std_logic;
        D5: out std_logic;
        D6: out std_logic;
        D7: out std_logic;
        D8: out std_logic
    );
    end component;

    -- 9:1 multiplexer, FOR (ABUS, BBUS)
    component mux_9to1
    Port(
        I0: in std_logic_vector(15 downto 0);
        I1: in std_logic_vector(15 downto 0);
        I2: in std_logic_vector(15 downto 0);
        I3: in std_logic_vector(15 downto 0);
        I4: in std_logic_vector(15 downto 0);
        I5: in std_logic_vector(15 downto 0);
        I6: in std_logic_vector(15 downto 0);
        I7: in std_logic_vector(15 downto 0);
        I8: in std_logic_vector(15 downto 0);
        src: in std_logic_vector(3 downto 0);
        Z: out std_logic_vector(15 downto 0)
    );
    end component;

    signal 	d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8  : std_logic;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q : std_logic_vector(15 downto 0);
    
    begin
        -- port maps;-)

        -- register 0
        reg00: reg16 Port Map(
            D => data,
            load => d_out0,
            clk => clk,
            Q => reg0_q
        );

        -- register 1
        reg01: reg16 Port Map(
            D => data,
            load => d_out1,
            clk => clk,
            Q => reg1_q
        );

        -- register 2
        reg02: reg16 Port Map(
            D => data,
            load => d_out2,
            clk => clk,
            Q => reg2_q
        );

        -- register 3
        reg03: reg16 Port Map(
            D => data,
            load => d_out3,
            clk => clk,
            Q => reg3_q
        );

        -- register 4
        reg04: reg16 Port Map(
            D => data,
            load => d_out4,
            clk => clk,
            Q => reg4_q
        );

        -- register 5
        reg05: reg16 Port Map(
            D => data,
            load => d_out5,
            clk => clk,
            Q => reg5_q
        );

        -- register 6
        reg06: reg16 Port Map(
            D => data,
            load => d_out6,
            clk => clk,
            Q => reg6_q
        );

        -- register 7
        reg07: reg16 Port Map(
            D => data,
            load => d_out7,
            clk => clk,
            Q => reg7_q
        );

        reg08: reg16 Port Map(
            D => data,
            load => d_out8,
            clk => clk,
            Q => reg8_q
        );

        -- destination register decoder 3:8 (D)
        des_decoder_4to9: decoder_4to9 Port Map(
            A => DA,
            RW => RW,
            D0 => d_out0,
            D1 => d_out1,
            D2 => d_out2,
            D3 => d_out3,
            D4 => d_out4,
            D5 => d_out5,
            D6 => d_out6,
            D7 => d_out7,
            D8 => d_out8
        );

        -- 9:1 source register multiplexer (A-BUS)
        A_mux9_16bit: mux_9to1 Port Map(
            I0 => reg0_q,
            I1 => reg1_q,
            I2 => reg2_q,
            I3 => reg3_q,
            I4 => reg4_q,
            I5 => reg5_q,
            I6 => reg6_q,
            I7 => reg7_q,
            I8 => reg8_q,
            src => AA,
            Z => a_out
        );

        -- 9:1 source register multiplexer (B-BUS)
        B_mux9_16bit: mux_9to1 Port Map(
            I0 => reg0_q,
            I1 => reg1_q,
            I2 => reg2_q,
            I3 => reg3_q,
            I4 => reg4_q,
            I5 => reg5_q,
            I6 => reg6_q,
            I7 => reg7_q,
            I8 => reg8_q,
            src => BA,
            Z => b_out
        );

        reg0 <= reg0_q;
        reg1 <= reg1_q;
        reg2 <= reg2_q;
        reg3 <= reg3_q;
        reg4 <= reg4_q;
        reg5 <= reg5_q;
        reg6 <= reg6_q;
        reg7 <= reg7_q;
        reg8 <= reg8_q;

end Behavioral ; -- Behavioral