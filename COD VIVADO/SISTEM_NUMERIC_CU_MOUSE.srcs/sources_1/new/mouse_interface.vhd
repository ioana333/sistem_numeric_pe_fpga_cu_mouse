library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mouse_Interface is
    Port ( 
           clk         : in STD_LOGIC;     -- clock
           reset       : in STD_LOGIC;     -- reset
           usb_clk     : in STD_LOGIC;     -- USB clock de la mouse
           usb_data    : in STD_LOGIC;     -- USB data de la mouse
           left_button : out STD_LOGIC;    -- clik stanga
           right_button: out STD_LOGIC     -- clik dreapta
          );
end Mouse_Interface;


architecture Behavioral of Mouse_Interface is

    signal mouse_data  :  STD_LOGIC_VECTOR (31 downto 0); 
    signal data_valid  :  STD_LOGIC; 

    signal clk_div    : STD_LOGIC := '0'; 
    signal bit_count  : integer range 0 to 33 := 0;
    signal data_shift : STD_LOGIC_VECTOR (32 downto 0) := (others => '0');
    signal data_out   : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sync_data  : STD_LOGIC := '1';
    signal sync_clk   : STD_LOGIC := '1';
    signal state      : integer range 0 to 3 := 0;
    signal debounce_count : integer range 0 to 3 := 0;
    signal debounced_clk  : STD_LOGIC := '1';

    constant debounce_limit : integer := 2;

begin

    -- DIVIZOR FRECVANTA CLK PENTRU A SINCRONIZA USB-ul CU MOUSE-ul
    process (clk)
    begin
        if rising_edge(clk) then
            clk_div <= not clk_div;
        end if;
    end process;

    -- DEBOUMCER USB CLK
    process (clk)
    begin
        if rising_edge(clk) then
            if usb_clk /= sync_clk then
                debounce_count <= 0;
            else
                if debounce_count < debounce_limit then
                    debounce_count <= debounce_count + 1;
                end if;
            end if;
            if debounce_count = debounce_limit then
                debounced_clk <= usb_clk;
            end if;
            sync_clk <= usb_clk;
        end if;
    end process;

    -- CITIRE DATE MOUSE
    process (debounced_clk, reset)
    begin
        if reset = '1' then
            bit_count <= 0;
            data_shift <= (others => '0');
            data_valid <= '0';
            state <= 0;
        elsif falling_edge(debounced_clk) then
            case state is
                when 0 =>  -- scriem
                    if usb_data = '0' then
                        bit_count <= 1;
                        state <= 1;
                    end if;
                when 1 =>  -- citim datele
                    data_shift(bit_count - 1) <= usb_data;
                    if bit_count = 33 then
                        bit_count <= 0;
                        data_out <= data_shift(31 downto 0);
                        data_valid <= '1';
                        state <= 2;
                    else
                        bit_count <= bit_count + 1;
                    end if;
                when 2 =>  -- pregatire citire urmatorul bit de start
                    data_valid <= '0';
                    if usb_data = '1' then
                        state <= 0;
                    end if;
                when others =>
                    state <= 0;
            end case;
        end if;
    end process;

    
    mouse_data <= data_out;
    left_button <= data_out(0);
    right_button <= data_out(1);

end Behavioral;
