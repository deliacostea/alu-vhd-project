----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 12:31:10 PM
-- Design Name: 
-- Module Name: scadere - Behavioral
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

entity adunare_scadere is
  Port (a,b: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(31 downto 0);
        sel:in std_logic
     
   );
end adunare_scadere;

architecture Behavioral of adunare_scadere is

component cla is
Port( a,b : in std_logic_vector(31 downto 0);
      res : out std_logic_vector(31 downto 0));
end component;

signal C2,sub,out_mux: std_logic_vector(31 downto 0);


begin
C2<= (not b) + "00000000000000000000000000000001";
mux: process(b,C2,sel)
begin
    if sel='0' then
        out_mux<=b;
    else out_mux<=C2;
    end if;
end process;

op: cla port map(a,out_mux,sub);


res<=sub;


end Behavioral;
