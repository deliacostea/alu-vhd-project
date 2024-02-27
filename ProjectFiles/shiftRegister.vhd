----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 09:43:37 PM
-- Design Name: 
-- Module Name: shiftRegister - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftRegister is
  Port (clk: in std_logic;
        rst: in std_logic;
        shiftdir : in std_logic;
        data: in std_logic;
        res: out std_logic_vector(31 downto 0)
  
   );
end shiftRegister;

architecture Behavioral of shiftRegister is
signal temp: std_logic_vector(31 downto 0):=(others => '0');
begin
    process (clk,rst)
    begin
       if rst='1' then
         temp<=(others =>'0');
       elsif clk'event and clk='1' then
       if shiftdir='0' then --dreapta
            temp(31)<=data;
            temp(30 downto 0)<=temp(31 downto 1);
            res<=temp;
       elsif shiftdir='1' then --stanga
           temp(0)<=data;
           temp(31 downto 1)<=temp(30 downto 0);
           res<=temp;
       end if;
       end if;
    end process;

end Behavioral;
