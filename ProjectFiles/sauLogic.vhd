----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 12:57:09 PM
-- Design Name: 
-- Module Name: sauLogic - Behavioral
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

entity sauLogic is
Port (a,b: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(31 downto 0)
      --  overflow: out std_logic
   );
end sauLogic;

architecture Behavioral of sauLogic is
signal res1: std_logic_vector(31 downto 0);
begin

res1<= a or b;
res<=res1;
end Behavioral;
