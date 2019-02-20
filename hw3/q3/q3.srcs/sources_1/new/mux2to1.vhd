
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2to1 is
    Port ( a : in STD_LOGIC_vector(7 downto 0);
           b : in STD_LOGIC_vector(7 downto 0);
           sel : in std_logic;
           output : out STD_LOGIC_vector(7 downto 0));
end mux2to1;

architecture Behavioral of mux2to1 is


begin

output <= a when sel ='1'
else b;


end Behavioral;