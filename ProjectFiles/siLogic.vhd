----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 01:05:55 PM
-- Design Name: 
-- Module Name: siLogic - Behavioral
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

entity siLogic is
Port (a,b: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(31 downto 0)
     
   );
end siLogic;

architecture Behavioral of siLogic is

---signal res1: std_logic_vector(31 downto 0);
begin

res<= a and b;

end Behavioral;
