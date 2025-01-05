----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2024 09:49:10 PM
-- Design Name: 
-- Module Name: BLACK_BOX - Behavioral
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

entity BLACK_BOX is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           is_left : out STD_LOGIC;
           usb_clk     : in STD_LOGIC;
           usb_data     : in STD_LOGIC;
           catozi : out STD_LOGIC_VECTOR(6 downto 0);
           anozii : out STD_LOGIC_VECTOR(3 downto 0));
end BLACK_BOX;

architecture Behavioral of BLACK_BOX is

component UE is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           usb_clk     : in STD_LOGIC;
           usb_data     : in STD_LOGIC;
           left_clik     : out STD_LOGIC;
           right_clik     : out STD_LOGIC;
           Cup     : in STD_LOGIC;
           Cdn     : in STD_LOGIC;
           catozi : out STD_LOGIC_VECTOR(6 downto 0);
           anozii : out STD_LOGIC_VECTOR(3 downto 0));
end component UE;

component UC is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           Cup : out STD_LOGIC;
           Cdn : out STD_LOGIC;
           is_left : out STD_LOGIC;
           LB : in STD_LOGIC;
           RB : in STD_LOGIC);
end component UC;

signal LM, RM: std_logic;
signal Cup, Cdn: std_logic;

begin

    UNITATEA_CONTROL: UC port map (clk, reset, revers, Cup, Cdn, is_left, LM, RM);
    
    UNITATEA_EXECUTIE: UE port map (clk, reset, revers, usb_clk, usb_data, LM, RM, Cup, Cdn, catozi, anozii );

end Behavioral;
