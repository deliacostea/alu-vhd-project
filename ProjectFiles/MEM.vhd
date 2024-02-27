----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2023 06:35:14 PM
-- Design Name: 
-- Module Name: MEM - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           ad1: in std_logic_vector(3 downto 0);
           ad2: in std_logic_vector(3 downto 0);
           data1: out std_logic_vector(31 downto 0);
           data2: out std_logic_vector(31 downto 0));
          
end MEM;

architecture Behavioral of MEM is

type mem is array(0 to 15) of std_logic_vector(31 downto 0);
signal ram:mem:=(x"00006411",
x"00001231",--s=4
x"00000004",
x"00000004",--s=8
x"00000009",
x"00000003",
x"00000001",
x"00000008",--s=16
x"00000006",
x"00000009",
others =>x"00000000");
begin


process(clk)
begin
    if rising_edge(clk)then
      if en ='1' then
       data1<=ram(conv_integer(ad1));
       data2<=ram(conv_integer(ad2));
       end if;
       end if;
       end process;

end Behavioral;
