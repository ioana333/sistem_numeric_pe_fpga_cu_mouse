---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity numarator_9999 is
    Port ( 
    		 Cup : in STD_LOGIC;
    		 Cdn: in STD_LOGIC;
           reset : in STD_LOGIC;
           revers : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_vector(15 downto 0));
end numarator_9999;

architecture Behavioral of numarator_9999 is

signal RM, LM: std_logic;

begin

process (clk, reset)
variable nr: std_logic_vector (15 downto 0) := (others => '0');
begin
    if reset='1' then
    		nr:=(others => '0');
    elsif rising_edge(clk) then 
    		if revers = '1' then 
    			LM<=Cdn;
    			RM<=Cup;
    		else
    			LM<=Cup;
    			RM<=Cdn;
    		end if;
    		if LM='1' and RM='0' then 
    		    if nr = "0010011100001111" then   --resetare la 9999 daca incrementam
    		          nr:=(others => '0');
    		    else
    			     nr:=nr+1;
    			end if;
    		elsif LM='0' and RM='1' then 
    		     if nr = "0000000000000000" then  --daca decrementam la 0 merge la 9999
                      nr:="0010011100001111";
                 else
                     nr:=nr-1;
    			 end if;
    		else nr:=nr+0;
    		end if;
    end if;
    Q <= nr;
end process;


end Behavioral;
