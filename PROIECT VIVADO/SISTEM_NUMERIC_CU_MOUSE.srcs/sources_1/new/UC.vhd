----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2024 09:25:05 PM
-- Design Name: 
-- Module Name: UC - Behavioral
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

entity UC is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           Cup : out STD_LOGIC;
           Cdn : out STD_LOGIC;
           is_left : out STD_LOGIC;
           LB : in STD_LOGIC;
           RB : in STD_LOGIC);
end UC;


architecture Behavioral of UC is

    type stare_t is (start, increment, decrement, numara);
    signal stare, next_stare: stare_t;

begin

    process(clk)
        begin
            if rising_edge(clk) then 
                stare<=next_stare;
            end if;
    end process;


    process(LB, RB, reset)
        begin
            case stare is
                when start =>
                    Cup<='0';
                    Cdn<='0';
                    if reset = '1' then 
                        next_stare<=start;
                    else
                        next_stare<=numara;
                    end if;
                when numara =>
                    if LB = '1' then 
                        next_stare<=increment;
                    else
                        if RB = '1' then
                            next_stare<=decrement;
                        else next_stare<=start; 
                        end if;
                    end if;
                when increment =>
                    Cup<='1';
                    Cdn<='0';
                    next_stare<=start;
                when decrement =>
                    Cup<='0';
                    Cdn<='1';
                    next_stare<=start;
            end case;
            
    end process;

    is_left<=not revers;
    
end Behavioral;
