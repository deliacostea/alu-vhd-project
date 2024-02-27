----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2023 12:17:55 AM
-- Design Name: 
-- Module Name: impartire - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity impartire is
  Port (
      op_a,op_b: in std_logic_vector(31 downto 0);
      cat: out std_logic_vector(31 downto 0);
      rest: out std_logic_vector(31 downto 0)
   );
end impartire;

architecture Behavioral of impartire is
begin
process(op_a,op_b)
variable cat1: std_logic_vector(31 downto 0):= (others => '0');
variable rest1: std_logic_vector(31 downto 0):= (others => '0');
variable i: integer;

begin
cat1 :=(others => '0');
rest1 := (others => '0');

for i in 30 downto 0 loop
    rest1(31) := rest1(30);
    rest1(30) := rest1(29);
    rest1(29) := rest1(28);
    rest1(28) := rest1(27);
    rest1(27) := rest1(26);
    rest1(26) := rest1(25);
    rest1(25) := rest1(24);
    rest1(24) := rest1(23);
    rest1(23) := rest1(22);
    rest1(22) := rest1(21);
    rest1(21) := rest1(20);
    rest1(20) := rest1(19);
    rest1(19) := rest1(18);
    rest1(18) := rest1(17);
    rest1(17) := rest1(16);
    rest1(16) := rest1(15);
    rest1(15) := rest1(14);
    rest1(14) := rest1(13);
    rest1(13) := rest1(12);
    rest1(12) := rest1(11);
    rest1(11) := rest1(10);
    rest1(10) := rest1(9);
    rest1(9) := rest1(8);
    rest1(8) := rest1(7);
    rest1(7) := rest1(6);
    rest1(6) := rest1(5);
    rest1(5) := rest1(4);
    rest1(4) := rest1(3);
    rest1(3) := rest1(2);
    rest1(2) := rest1(1);
    rest1(1) := rest1(0);
    rest1(0) := op_a(i);
    
    if rest1 >= op_b then
        rest1 := rest1-op_b;
        cat1(i) :='1';
     end if;
     end loop;
     
    if op_b =x"00000000" then 
        cat <= x"FFFFFFFF";
        rest <=x"FFFFFFFF";
    else
        cat<=cat1;
        rest<=rest1;
     end if;
     end process;
    
    



end Behavioral;
