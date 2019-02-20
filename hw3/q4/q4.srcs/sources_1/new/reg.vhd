
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity reg is
    Port ( clk : in STD_LOGIC;
           data : in STD_LOGIC_vector (7 downto 0);
           LDA : in STD_LOGIC;
           F : out STD_LOGIC_vector (7 downto 0));
end reg;

architecture Behavioral of reg is

begin

process (clk)
begin
if (falling_edge(clk)) then
if LDA ='1' then
F <= data;
end if;
end if;
end process;


end Behavioral;



