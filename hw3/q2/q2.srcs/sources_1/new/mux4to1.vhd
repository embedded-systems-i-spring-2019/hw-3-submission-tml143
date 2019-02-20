library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4to1 is
    Port ( in0,in1,in2,in3 : in STD_LOGIC_vector(7 downto 0);
           sel : in std_logic_vector(1 downto 0);
           out1 : out STD_LOGIC_vector(7 downto 0)
         );
end mux4to1;

architecture Behavioral of mux4to1 is
begin

process (sel, in0, in1, in2, in3)

begin
   if sel ="11" then out1 <= in3; elsif
      sel ="10" then out1 <= in2; elsif
      sel ="01" then out1 <= in1; elsif
      sel = "00" then out1 <= in0; else
      out1 <= "00000000";
   
end if;
end process;


end Behavioral;
