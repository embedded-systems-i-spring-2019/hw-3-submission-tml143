----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 04:19:10 PM
-- Design Name: 
-- Module Name: top_design - Behavioral
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

entity top_design is
    Port ( DS : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           Z : in STD_LOGIC_VECTOR (7 downto 0);
           MS : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           RB : inout STD_LOGIC_VECTOR (7 downto 0);
           RA : inout STD_LOGIC_VECTOR (7 downto 0));
end top_design;

architecture Behavioral of top_design is

component mux4to1
port(
           in0,in1,in2,in3 : in STD_LOGIC_vector(7 downto 0);
           sel : in std_logic_vector(1 downto 0);
           out1 : out STD_LOGIC_vector(7 downto 0)
);
end component;

component reg
port(
           clk : in STD_LOGIC;
           data : in STD_LOGIC_vector (7 downto 0);
           LDA : in STD_LOGIC;
           F : out STD_LOGIC_vector (7 downto 0)
);
end component;

component dec1to2
port(
           in1 : in STD_LOGIC;
           out1 : out STD_LOGIC_vector(1 downto 0)
);
end component;
signal sigA, sigB :std_logic;
signal muxtoRA : std_logic_vector (7 downto 0);
begin

dec0: dec1to2
port map(
in1 => DS,
out1(0) => sigA,
out1(1) => sigB
);

mux: mux4to1
port map(
in0 => RB,
in1 => Z,
in2 => Y,
in3 => X,
sel => MS,
out1 => muxtoRA
);

regA: reg
port map(
clk => clk,
data => muxtoRA,
LDA => sigA,
F => RA
);

regB: reg
port map(
clk => clk,
data => RA,
LDA => sigB,
F => RB
);

end Behavioral;
