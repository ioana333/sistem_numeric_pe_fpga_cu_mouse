----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2024 12:20:56 AM
-- Design Name: 
-- Module Name: prelucrare cifra - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity prelucrare_cifra is
    Port ( sel : in STD_LOGIC_VECTOR(2 downto 0);
           nr : in STD_LOGIC_VECTOR(15 downto 0);
           cif : out integer);
end prelucrare_cifra;

architecture Behavioral of prelucrare_cifra is
begin

process(sel, nr)
    variable numar: integer;
begin
    numar := to_integer(unsigned(nr));  -- Conversia corect? la integer

    case sel is
        when "000" => cif <= numar mod 10;
        when "001" => cif <= (numar / 10) mod 10;
        when "010" => cif <= (numar / 100) mod 10;
        when "011" => cif <= (numar / 1000) mod 10;
        when others => cif <= 0;  -- Pentru a acoperi toate cazurile posibile
    end case;
end process;

end Behavioral;
