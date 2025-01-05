----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2024 02:16:21 PM
-- Design Name: 
-- Module Name: mouse_numarator - Behavioral
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

entity UE is
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
end UE;

architecture Behavioral of UE is

component divizor_frecventa_numarator is
    Port ( CLK100 : in STD_LOGIC;
           Rst : in STD_LOGIC;
           CLK : out STD_LOGIC);
end component divizor_frecventa_numarator;

component SSD is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           nr : in STD_LOGIC_VECTOR(15 downto 0);
           segment : out STD_LOGIC_VECTOR(6 downto 0);
           cifra : out STD_LOGIC_VECTOR(3 downto 0));
end component SSD;

component numarator_9999 is
    Port ( 
    		 Cup : in STD_LOGIC;
    		 Cdn: in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_vector(15 downto 0));
end component numarator_9999;

component Mouse_Interface is
    Port ( 
           clk         : in STD_LOGIC;     -- clock
           reset       : in STD_LOGIC;     -- reset
           usb_clk     : in STD_LOGIC;     -- USB clock de la mouse
           usb_data    : in STD_LOGIC;     -- USB data de la mouse
           left_button : out STD_LOGIC;    -- clik stanga
           right_button: out STD_LOGIC     -- clik dreapta
          );
end component Mouse_Interface;

signal Q: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal clk_num, LB, RB: std_logic;

begin

    DIV: divizor_frecventa_numarator port map (clk, reset, clk_num);
    
    MOUSE: Mouse_Interface port map (clk, reset, usb_clk, usb_data, LB, RB);
    
    NUMARA: numarator_9999 port map (clk=>clk_num, Cup=>Cup,Cdn=>Cdn,reset=> reset, revers=>revers,Q=>Q);
    
    AFISARE: SSD port map (clk, reset, Q, catozi, anozii);
    
    left_clik<=LB;
    right_clik<=RB;
    

end Behavioral;
