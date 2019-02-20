

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dec1to2 is
    Port ( in1 : in STD_LOGIC;
           out1 : out STD_LOGIC_vector(1 downto 0)
         );
end dec1to2;

architecture Behavioral of dec1to2 is

begin
    
    out1 <= "01" when (in1 = '0') else
            "10" when (in1 = '1')else
            "00";

end Behavioral;
