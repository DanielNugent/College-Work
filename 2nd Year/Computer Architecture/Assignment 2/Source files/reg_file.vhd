library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_file is
    Port(
        write: in std_logic;
        d_address: in std_logic_vector(2 downto 0); -- dest address (dest register)
        a_address: in std_logic_vector(2 downto 0);
        b_address: in std_logic_vector(2 downto 0);
        d_data: in std_logic_vector(15 downto 0); -- dest data (dest register's data)
        a_data: out std_logic_vector(15 downto 0); -- data from register a
        b_data: out std_logic_vector(15 downto 0); -- data from register b
        clk: in std_logic
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

    -- 3:8 decoder, D address select
    component decoder_3to8
    Port(
        dest: in std_logic_vector(2 downto 0);
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

    -- 8:1 multiplexer, FOR (ABUS, BBUS)
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
        src: in std_logic_vector(2 downto 0);
        Z: out std_logic_vector(15 downto 0)
    );
    end component;

    signal dout_0, dout_1, dout_2, dout_3, dout_4, dout_5. dout_6, dout_7: std_logic;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q : std_logic_vector(15 downto 0);   
    signal reg1, reg2, reg3, reg3, reg4, reg5, reg6, reg7: std_logic;
    
    begin
        -- port maps;-)

        -- register 0
        reg00: reg16 Port Map(
            D => d_data,
            load => reg0,
            clk => clk,
            Q => reg0_q
        );

        -- register 1
        reg01: reg16 Port Map(
            D => d_data,
            load => reg1,
            clk => clk,
            Q => reg1_q
        );

        -- register 2
        reg02: reg16 Port Map(
            D => d_data,
            load => reg2,
            clk => clk,
            Q => reg2_q
        );

        -- register 3
        reg03: reg16 Port Map(
            D => d_data,
            load => reg3,
            clk => clk,
            Q => reg3_q
        );

        -- register 4
        reg04: reg16 Port Map(
            D => d_data,
            load => reg4,
            clk => clk,
            Q => reg4_q
        );

        -- register 5
        reg05: reg16 Port Map(
            D => d_data,
            load => reg5,
            clk => clk,
            Q => reg5_q
        );

        -- register 6
        reg06: reg16 Port Map(
            D => d_data,
            load => reg6,
            clk => clk,
            Q => reg6_q
        );

        -- register 7
        reg07: reg16 Port Map(
            D => d_data,
            load => reg7,
            clk => clk,
            Q => reg7_q
        );

        -- destination register decoder 3:8 (D)
        des_decoder_3to8: decoder_3to8 Port Map(
            dest => d_address,
            D0 => dout_0,
            D1 => dout_1,
            D2 => dout_2,
            D3 => dout_3,
            D4 => dout_4,
            D5 => dout_5,
            D6 => dout_6,
            D7 => dout_7
        );

        -- 8:1 source register multiplexer (A-BUS)
        A_mux8_16bit: mux_8to1 Port Map(
            I0 => reg0_q,
            I1 => reg1_q,
            I2 => reg2_q,
            I3 => reg3_q,
            I4 => reg4_q,
            I5 => reg5_q,
            I6 => reg6_q,
            I7 => reg7_q,
            src => a_address,
            Z => a_data
        );

        -- 8:1 source register multiplexer (B-BUS)
        B_mux8_16bit: mux_8to1 Port Map(
            I0 => reg0_q,
            I1 => reg1_q,
            I2 => reg2_q,
            I3 => reg3_q,
            I4 => reg4_q,
            I5 => reg5_q,
            I6 => reg6_q,
            I7 => reg7_q,
            src => b_address,
            Z => b_data
        );

        reg0 <= write and dout_0;
        reg1 <= write and dout_1;
        reg2 <= write and dout_2;
        reg3 <= write and dout_3;
        reg4 <= write and dout_4;
        reg5 <= write and dout_5;
        reg6 <= write and dout_6;
        reg7 <= write and dout_7;

end Behavioral ; -- Behavioral