library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divizor_frecventa is
    Port ( CLK100 : in STD_LOGIC;
           Rst : in STD_LOGIC;
           CLK_1Hz : out STD_LOGIC_vector (2 downto 0));
end divizor_frecventa;

architecture Behavioral of divizor_frecventa is
begin

process (CLK100)

variable nr: std_logic_vector (15 downto 0) := (others => '0');

begin
    if CLK100'EVENT and CLK100 = '1' then
        if Rst = '1' then 
            nr := (others => '0');
        else nr := nr+1;
        end if;
    end if;
   CLK_1Hz(2) <=nr(15);
    CLK_1Hz(1) <=nr(14);
    CLK_1Hz(0) <=nr(13);
end process;

end Behavioral;