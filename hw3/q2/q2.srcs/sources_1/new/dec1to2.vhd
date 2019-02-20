----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 03:29:06 PM
-- Design Name: 
-- Module Name: dec1to2 - Behavioral
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
