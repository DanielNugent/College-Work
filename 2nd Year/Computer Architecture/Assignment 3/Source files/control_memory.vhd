library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity control_memory is
    Port (
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
end control_memory;

architecture Behavioral of control_memory is
type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
begin
            memory_m : process(in_car)
        variable ControlMemory : mem_array := (
        --Module 0
        x"C020304", --0 start of intermediate value in register
        x"C020304", --1 immediate value in register
        x"C020304", --2 immediate value in register
        x"C020304", --3 immediate value in register
        x"C020304", --4 immediate value in register
        x"C020304", --5 immediate value in register
        x"C020304", --6 immediate value in register
        x"C020304", --7 end of immediate value in register
        x"C020224", --8 ADI -> add the immediate operand
        x"C02000C", --9 LDR -> load to register
        x"C020001", --A STR -> store in register
        x"C020014", --B INC -> increment the register's value by 1
        x"C0200E4", --C NOT -> compliment 
        x"C020024", --D ADD -> add values from source and destination
        x"1228002", --E B -> branch unconditionally
        x"0000000", --F
        
        --Module 1
        x"0000000", --0 
        x"0000000", --1 
        x"C020000", --2 
        x"C020024", --3 ADD -> add values from source and destination
        x"169A002", --4 BXX -> branch conditionally to area
        x"C020024", --5 ADD -> add values from source and destination
        x"C020024", --6 ADD -> add values from source and destination
        x"C020024", --7 
        x"0000000", --8 
        x"0000000", --9 
        x"0000000", --A  
        x"0000000", --B 
        x"0000000", --C 
        x"0000000", --D 
        x"0000000", --E 
        x"0000000", --F 
        
        --Module 2
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 3
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 4
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 5
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 6
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 7
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 8
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module 9
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module A
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module B
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module C
        x"C10C002", --0 IF fetching
        x"0030000", --1 Exit signal
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module D
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module E
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000", --F
        
        --Module F
        x"0000000", --0
        x"0000000", --1
        x"0000000", --2
        x"0000000", --3
        x"0000000", --4
        x"0000000", --5
        x"0000000", --6
        x"0000000", --7
        x"0000000", --8
        x"0000000", --9
        x"0000000", --A
        x"0000000", --B
        x"0000000", --C
        x"0000000", --D
        x"0000000", --E
        x"0000000" --F
        );
        
        variable addr : integer;
        variable control_out : STD_LOGIC_VECTOR(27 downto 0);
        
        begin
        addr := conv_integer(in_car);
        control_out := ControlMemory(addr);
        MW <= control_out(0);
        MM <= control_out(1);
        RW <= control_out(2);
        MD <= control_out(3);
        FS <= control_out(8 downto 4);
        MB <= control_out(9);
        
        TB <= control_out(10);
        TA <= control_out(11);
        TD <= control_out(12);
        PL <= control_out(13);
        PI <= control_out(14);
        IL <= control_out(15);
        MC <= control_out(16);
        MS <= control_out(19 downto 17);
        NA <= control_out(27 downto 20);
        end process;

end Behavioral;