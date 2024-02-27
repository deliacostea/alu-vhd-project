----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 05:18:32 PM
-- Design Name: 
-- Module Name: csa - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity csa is
  Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
         b : in STD_LOGIC_VECTOR (63 downto 0);
         c : in STD_LOGIC_VECTOR (63 downto 0);
         sum : out STD_LOGIC_VECTOR (63 downto 0);
         carry : out STD_LOGIC_VECTOR (63 downto 0));
end csa;

architecture Behavioral of csa is
signal a1,b1,c1,sum1: std_logic_vector(127 downto 0):= (others => '0');
begin
a1<=(x"0000000000000000"&a);
b1<=(x"0000000000000000"&b);
c1<=(x"0000000000000000"&c);
sum1<=(a1+b1)+c1;
sum<=sum1(63 downto 0);
carry<=sum1(126 downto 64)&'0';


end Behavioral;
