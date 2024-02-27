----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 02:18:14 PM
-- Design Name: 
-- Module Name: impartire1 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity impartire1 is
  Port (op_a,op_b: in std_logic_vector(31 downto 0);
        cat: out std_logic_vector(31 downto 0);
        rest: out std_logic_vector(31 downto 0)
   );
end impartire1;

architecture Behavioral of impartire1 is

component impartire is
 Port (
     op_a,op_b: in std_logic_vector(31 downto 0);
     cat: out std_logic_vector(31 downto 0);
     rest: out std_logic_vector(31 downto 0)
  );
end component;

signal compA, compB, aux_a,aux_b,aux_cat,aux_rest: std_logic_vector(31 downto 0):= (others => '0');

begin

compA <= (not op_a) +1;
compB <= (not op_b) +1;

process(compA, op_a, compB, op_b)
begin
if op_a(31) = '1' then
aux_a <= compA;
else
aux_a <= op_a;
end if;
if op_b(31) ='1' then
aux_b <=compB;
else
aux_b <=op_b;
end if;
end process;

imp: impartire port map(aux_a,aux_b,aux_cat,rest);

process(op_a,op_b,aux_cat)
begin
if (op_a(31) xor op_b(31)) = '1' then
cat <= (not aux_cat) +1;
else 
cat <= aux_cat;
end if;
end process;




end Behavioral;
