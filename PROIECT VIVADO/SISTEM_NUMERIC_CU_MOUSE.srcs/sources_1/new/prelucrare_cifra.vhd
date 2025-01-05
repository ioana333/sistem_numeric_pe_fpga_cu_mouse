----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2024 12:59:53 AM
-- Design Name: 
-- Module Name: prelucrare_cifra - Behavioral
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

entity prelucrare_cifra is
    Port ( sel : in std_logic_vector (2 downto 0);
           cif : out integer;
           nr : in STD_LOGIC_VECTOR(15 downto 0));
end prelucrare_cifra;

architecture Behavioral of prelucrare_cifra is

signal numar: integer := conv_integer(nr);

begin

AFISARE_CIFRA: process(sel)
        begin
            case sel is
                when "00" => cif<=numar mod 10;
                when "01" => cif<=(numar/10) mod 10;
                when "10" => cif<=(numar/100) mod 10;
                when "11" => cif<=(numar/1000) mod 10;
             end case;
    end process;

end Behavioral;
