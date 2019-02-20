
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_design is
    Port ( x : in STD_LOGIC_vector(7 downto 0);
           y : in STD_LOGIC_vector(7 downto 0);
           s1, s0, clk, LDA, LDB, RD : in std_logic;
           RA : out STD_LOGIC_vector(7 downto 0);
           RB : inout STD_LOGIC_vector(7 downto 0)
           );
end top_design;

architecture Behavioral of top_design is

component mux2to1
port(
x : in STD_LOGIC_vector(7 downto 0);
y : in STD_LOGIC_vector(7 downto 0);
sel : in std_logic;
output : out STD_LOGIC_vector(7 downto 0)
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

signal s_mux0toREGB, s_mux1toREGA : std_logic_vector(7 downto 0);
signal LDB_not_RD, LDA_and_RD : std_logic;
begin

LDB_not_RD <= LDB and (not RD);
LDA_and_RD <= LDA and RD;

mux0: mux2to1
port map(
x => x,
y => y,
sel => s1,
output => s_mux0toREGB
);

REGB: reg
port map(
clk => clk,
data => s_mux0toREGB,
LDA => LDB_not_RD,
F => RB
);

mux1: mux2to1
port map(
x => RB,
y => y,
sel => s0,
output => s_mux1toREGA
);

REGA: reg
port map(
clk => clk,
data => s_mux1toREGA,
LDA => LDA_and_RD,
F => RA
);

end Behavioral;