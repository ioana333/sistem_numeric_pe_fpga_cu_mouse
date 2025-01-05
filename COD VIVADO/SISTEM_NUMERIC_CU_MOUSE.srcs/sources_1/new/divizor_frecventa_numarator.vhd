----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 11:10:49 AM
-- Design Name: 
-- Module Name: divizor_frecventa - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divizor_frecventa_numarator is
    Port ( CLK100 : in STD_LOGIC;
           Rst : in STD_LOGIC;
           CLK : out STD_LOGIC);
end divizor_frecventa_numarator;

architecture Behavioral of divizor_frecventa_numarator is
begin

process (CLK100)

variable nr: std_logic_vector (22 downto 0) := (others => '0');

begin
    if CLK100'EVENT and CLK100 = '1' then
        if Rst = '1' then 
            nr := (others => '0');
        else nr := nr+1;
        end if;
    end if;
    CLK <=nr(22);
end process;

end Behavioral;
