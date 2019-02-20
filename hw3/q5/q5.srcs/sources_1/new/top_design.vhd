library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_design is
    Port ( a,b,c : in STD_LOGIC_vector(7 downto 0);
           SL1,SL2,CLK : in STD_LOGIC;
           RAX, RBX : out STD_LOGIC_vector(7 downto 0));
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

signal s_mux1toREGB : std_logic_vector(7 downto 0);
signal s_decToREGA, s_decToREGB : std_logic;

begin

decoder: dec1to2
port map(
in1 => SL1,
out1(1) => s_decToREGA,
out1(0) => s_decToREGB
);

REGA: reg
port map(
clk => clk,
data => A,
LDA =>s_decToREGA,
F => RAX
);


mux: mux2to1
port map(
a => B,
b => C,
sel => SL2,
output => s_mux1toREGB
);

REGB: reg
port map(
clk => clk,
data => s_mux1toREGB,
LDA => s_decToREGB,
F => RBX
);

end Behavioral;