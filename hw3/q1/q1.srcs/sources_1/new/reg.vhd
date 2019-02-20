----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 02:59:53 PM
-- Design Name: 
-- Module Name: reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( clk : in STD_LOGIC;
           data : in STD_LOGIC_vector(7 downto 0);
           LDA : in STD_LOGIC;
           F : out STD_LOGIC_vector(7 downto 0));
end reg;

architecture Behavioral of reg is

begin

process (clk)
begin
if (rising_edge(clk)) then
if LDA ='1' then
F <= data;
end if;
end if;
end process;


end Behavioral;
