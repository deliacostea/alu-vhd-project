----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 06:54:30 PM
-- Design Name: 
-- Module Name: rotatii - Behavioral
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

entity rotatii is
 Port (a: in std_logic_vector(31 downto 0);
 dir: in std_logic;
 rez: out std_logic_vector(31 downto 0)
  );
end rotatii;

architecture Behavioral of rotatii is


begin
process(dir,a)
begin
if dir='1' then --dreapta
   rez(31)<=a(0);
   rez(30)<=a(31);
   rez(29)<=a(30);
   rez(28)<=a(29);
   rez(27)<=a(28);
   rez(26)<=a(27);
   rez(25)<=a(26);
   rez(24)<=a(25);
   rez(23)<=a(24);
   rez(22)<=a(23);
   rez(21)<=a(22);
   rez(20)<=a(21);
   rez(19)<=a(20);
   rez(18)<=a(19);
   rez(17)<=a(18);
   rez(16)<=a(17);
   rez(15)<=a(16);
   rez(14)<=a(15);
   rez(13)<=a(14);
   rez(12)<=a(13);
   rez(11)<=a(12);
   rez(10)<=a(11);
   rez(9)<=a(10);
   rez(8)<=a(9);
   rez(7)<=a(8);
   rez(6)<=a(7);
   rez(5)<=a(6);
   rez(4)<=a(5);
   rez(3)<=a(4);
   rez(2)<=a(3);
   rez(1)<=a(2);
   rez(0)<=a(1);
  
else
   rez(31)<=a(30);
   rez(30)<=a(29);
   rez(29)<=a(28);
   rez(28)<=a(27);
   rez(27)<=a(26);
   rez(26)<=a(25);
   rez(25)<=a(24);
   rez(24)<=a(23);
   rez(23)<=a(22);
   rez(22)<=a(21);
   rez(21)<=a(20);
   rez(20)<=a(19);
   rez(19)<=a(18);  
   rez(18)<=a(17); 
   rez(17)<=a(16); 
   rez(16)<=a(15); 
   rez(15)<=a(14); 
   rez(14)<=a(13); 
   rez(13)<=a(12); 
   rez(12)<=a(11); 
   rez(11)<=a(10); 
   rez(10)<=a(9); 
   rez(9)<=a(8); 
   rez(8)<=a(7); 
   rez(7)<=a(6); 
   rez(6)<=a(5); 
   rez(5)<=a(4); 
   rez(4)<=a(3); 
   rez(3)<=a(2); 
   rez(2)<=a(1); 
   rez(1)<=a(0); 
   rez(0)<=a(31); 
  end if;
 end process;

   


end Behavioral;
