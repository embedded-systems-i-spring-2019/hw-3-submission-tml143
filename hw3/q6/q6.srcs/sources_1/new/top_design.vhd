
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_design is
Port (
A,B,C : in std_logic_vector(7 downto 0);
SEL1, SEL2, CLK : in std_logic;
RAP, RBP : out std_logic_vector (7 downto 0)
);
end top_design;

architecture Behavioral of top_design is

component mux2to1
port(
a : in STD_LOGIC_vector(7 downto 0);
b : in STD_LOGIC_vector(7 downto 0);
sel : in std_logic;
output : out STD_LOGIC_vector(7 downto 0)
);
end component;

component reg
port(
clk : in STD_LOGIC;
data : in STD_LOGIC_vector(7 downto 0);
LDA : in STD_LOGIC;
F : out STD_LOGIC_vector(7 downto 0)
);
end component;

component dec1to2
port(
in1 : in STD_LOGIC;
out1 : out STD_LOGIC_vector(1 downto 0)
);
end component;

signal s_muxToREGA : std_logic_vector(7 downto 0);
signal s_decToREGA, s_decToREGB : std_logic;

begin

decoder: dec1to2
port map(
in1 => SEL2,
out1(1) => s_decToREGA,
out1(0) => s_decToREGB
);

REGB: reg
port map(
clk => clk,
data => c,
LDA => s_decToREGB,
F => RBP
);

mux: mux2to1
port map(
a => A,
b => B,
sel => SEL1,
output => s_muxToREGA
);

REGA: reg
port map(
clk => clk,
data => s_muxToREGA,
LDA => s_decToREGA,
F => RAP
);

end Behavioral;
