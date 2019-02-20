


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_design is
Port (
LDA,LDB : in std_logic;
x : in std_logic_vector (7 downto 0);
s0,s1, clk : in std_logic;
y : in std_logic_vector (7 downto 0);
RB : inout std_logic_vector (7 downto 0)
 );
end top_design;

architecture Behavioral of top_design is
signal s_mux0toREGA, s_REGAtomux1, s_mux1toREGB : std_logic_vector (7 downto 0);
component reg
port(
clk : in STD_LOGIC;
data : in STD_LOGIC_vector(7 downto 0);
LDA : in STD_LOGIC;
F : out STD_LOGIC_vector(7 downto 0)
);
end component;
component mux2to1
port(
a : in STD_LOGIC_vector(7 downto 0);
b : in STD_LOGIC_vector(7 downto 0);
sel : in std_logic;
output : out STD_LOGIC_vector(7 downto 0)
);
end component;

begin

mux0: mux2to1
port map(
a => x,
b => RB,
sel => s1,
output => s_mux0toREGA
);

REGA: reg
port map(
clk =>clk,
data => s_mux0toREGA,
LDA => LDA,
F => s_REGAtomux1
);

mux1: mux2to1
port map(
a => s_REGAtomux1,
b => y,
sel => s0,
output => s_mux1toREGB
);

REGB: reg
port map(
clk =>clk,
data => s_mux1toREGB,
LDA => LDB,
F => RB
);




end Behavioral;
