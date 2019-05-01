library IEEE;
use IEEE.std_logic_1164.ALL;

entity datapath is
    port (
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
end datapath;

architecture Behavioral of datapath is

    component reg_file
        port (
            DA: in std_logic_vector(3 downto 0);	
			AA : in std_logic_vector(3 downto 0);
			BA : in std_logic_vector(3 downto 0);
			
			Clk : in std_logic;
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
    end component;

    component mux_2to1
        port (
            I0 : in std_logic_vector (15 downto 0);
            I1 : in std_logic_vector (15 downto 0);
            S : in std_logic;
            Z : out std_logic_vector (15 downto 0)
        );
    end component;

    component func_unit
        port (
            a, b : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            f : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;

    component zerofill
        Port(
            SB: in std_logic_vector(2 downto 0);
            zerofill: out std_logic_vector(15 downto 0)
        );
    end component;

    signal Data, BOut, ABus, BBus, Fsig, ConIn : std_logic_vector(15 downto 0);


begin

    rf : reg_file
        port map (
            AA => Asel,	
            BA => Bsel,
            DA => Dsel,
            
            RW => RW,
            Clk => Clk,
            
            data => Data,
            
            a_out => ABus,
            b_out => BOut,
            
            reg0 => reg_0_out,
            reg1 => reg_1_out,
            reg2 => reg_2_out,
            reg3 => reg_3_out,
            reg4 => reg_4_out,
            reg5 => reg_5_out,
            reg6 => reg_6_out,
            reg7 => reg_7_out,
            reg8 => reg_8_out
        );

    mux_b : mux_2to1
        port map (
            I0 => BOut,
            I1 => ConIn,
            S => MB,
            Z => BBus
        );

    fu : func_unit
        port map (
            a => ABus,
            b => Bbus,
            fs => FS,
            f => Fsig,
            v => v,
            c => c,
            n => n,
            z => z
        );

    mux_d : mux_2to1
        port map (
            I0 => Fsig,
            I1 => data_in,
            S => MD,
            Z => Data
        );

    mux_m : mux_2to1
        Port Map(
            I0 => Abus,
            I1 => pc_in,
            S => MM,
            Z => adr_out
        );

    fill_zero : zerofill
        Port Map(
            SB => SB,
            zerofill => Conin
        );

    data_out <= BBus;
  --  address_out <= a_data;

end Behavioral;
