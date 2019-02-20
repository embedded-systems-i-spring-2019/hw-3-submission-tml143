----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 03:14:28 PM
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
    Port ( LDA : in STD_LOGIC;
           a : in STD_LOGIC_vector(7 downto 0);
           b : in STD_LOGIC_vector (7 downto 0);
           sel : in STD_LOGIC;
           clk : in STD_LOGIC;
           F : out STD_LOGIC_vector (7 downto 0));
end top_design;

architecture Behavioral of top_design is
signal muxtoreg : std_logic_vector(7 downto 0);

component mux2_1
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

begin

mux1: mux2_1
port map(
        a => a,
        b => b,
        sel => sel,
        output => muxtoreg
);

reg1: reg
port map( 
        clk => clk,
        data => muxtoreg,
        LDA => LDA,
        F => F
);
end Behavioral;
