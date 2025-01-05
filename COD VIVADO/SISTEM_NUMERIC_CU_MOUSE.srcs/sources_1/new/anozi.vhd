----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:44:18 AM
-- Design Name: 
-- Module Name: anozi - Behavioral
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

entity anozi is
    Port ( d : in STD_LOGIC_vector (2 downto 0);
           f : out STD_LOGIC_vector (3 downto 0));
end anozi;

architecture Behavioral of anozi is

begin

process(d)
        begin
             case d is
                when "00" => f<="1110";
                when "01" => f<="1101";
                when "10" => f<="1011";
                when "11" => f<="0111";
             end case;
        end process;

end Behavioral;
