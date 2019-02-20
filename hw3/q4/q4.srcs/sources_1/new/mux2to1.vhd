
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2to1 is
    Port ( x : in STD_LOGIC_vector(7 downto 0);
          y : in STD_LOGIC_vector(7 downto 0);
           sel : in std_logic;
           output : out STD_LOGIC_vector(7 downto 0));
end mux2to1;

architecture Behavioral of mux2to1 is


begin

output <= x when sel ='1'
else y;


end Behavioral;