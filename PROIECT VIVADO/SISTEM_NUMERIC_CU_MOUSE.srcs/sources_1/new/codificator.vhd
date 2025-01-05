----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2024 05:36:48 PM
-- Design Name: 
-- Module Name: BCD_CIFRA - Behavioral
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

entity BCD_CIFRA is
    Port ( nr : in integer;
           led : out STD_LOGIC_VECTOR(6 downto 0));
end BCD_CIFRA;

architecture Behavioral of BCD_CIFRA is

begin
process(nr)
    begin  
        case nr is
            when 0 => led <= "0000001";
            when 1 => led <= "1001111";
            when 2 => led <= "0010010";
            when 3 => led <= "0000110";
            when 4 => led <= "1001100";
            when 5 => led <= "0100100";
            when 6 => led <= "0100000";
            when 7 => led <= "0001111";
            when 8 => led <= "0000000";
            when 9 => led <= "0000100";
            when others => led <= "1111110";
        end case;
end process;

end Behavioral;
