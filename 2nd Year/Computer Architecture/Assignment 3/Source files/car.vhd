library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
    Port ( 
       --Next Address (NA) or Opcode from IR
       car_in : in std_logic_vector(7 downto 0);
       s, reset : in std_logic;
       car_out : out std_logic_vector(7 downto 0)
    );
end car;

architecture Behavioral of car is

begin   

    process(reset, car_in)
    
        variable current : std_logic_vector(7 downto 0);
        variable temp : integer;
        variable increment : std_logic_vector(7 downto 0);

        begin

            if(reset = '1') then current := x"C0";
            elsif(s = '1') then current := car_in;
            elsif(s = '0') then
                temp := conv_integer(current);
                increment := conv_std_logic_vector(temp, 8);
                current := increment;
            end if;
            
            car_out <= current;
            
    end process;

end Behavioral;
