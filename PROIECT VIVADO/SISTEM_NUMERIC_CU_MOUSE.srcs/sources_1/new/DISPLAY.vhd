----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2024 05:32:08 PM
-- Design Name: 
-- Module Name: SSD - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           nr : in STD_LOGIC_VECTOR(15 downto 0);
           segment : out STD_LOGIC_VECTOR(6 downto 0);
           cifra : out STD_LOGIC_VECTOR(3 downto 0));
end SSD;

architecture Behavioral of SSD is

component divizor_frecventa is
    Port ( CLK100 : in STD_LOGIC;
           Rst : in STD_LOGIC;
           CLK_1Hz : out STD_LOGIC_vector (2 downto 0));
end component divizor_frecventa;

component anozi is
    Port ( d : in STD_LOGIC_vector (2 downto 0);
           f : out STD_LOGIC_vector (3 downto 0));
end component anozi;

component BCD_CIFRA is
    Port ( nr : in integer;
           led : out STD_LOGIC_VECTOR(6 downto 0));
end component BCD_CIFRA;


component prelucrare_cifra is
    Port ( sel : in std_logic_vector (2 downto 0);
           cif : out integer;
           nr : in STD_LOGIC_VECTOR(15 downto 0));
end component prelucrare_cifra;

signal numar: integer := conv_integer(nr);
signal sel: std_logic_vector (2 downto 0);
signal cif: integer;

begin

    DIV: divizor_frecventa port map (clk, reset, sel);
    
    MUX: prelucrare_cifra port map (sel, cif, nr);
    
    CATOD: BCD_CIFRA port map(cif, segment);
    ANOD: anozi port map (sel, cifra);
    
    

end Behavioral;
