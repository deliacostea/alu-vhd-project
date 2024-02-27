----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2023 05:24:03 PM
-- Design Name: 
-- Module Name: Alu_test - Behavioral
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

entity test_env is
 Port ( clk : in STD_LOGIC;
          btn : in STD_LOGIC_VECTOR (4 downto 0);
          sw : in STD_LOGIC_VECTOR (15 downto 0);
          led : out STD_LOGIC_VECTOR (15 downto 0);
          an : out STD_LOGIC_VECTOR (3 downto 0);
          cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is
component MPG1 is
 Port ( clk : in STD_LOGIC;
          btn : in STD_LOGIC;
          en : out STD_LOGIC);
end component;


component SSD is
Port ( clk : in STD_LOGIC;
           digits : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end component;


component MEM is
 Port ( clk : in STD_LOGIC;
          en : in STD_LOGIC;
          ad1: in std_logic_vector(3 downto 0);
          ad2: in std_logic_vector(3 downto 0);
          data1: out std_logic_vector(31 downto 0);
          data2: out std_logic_vector(31 downto 0));
end component;

component ALU_op is
 Port ( clk:in std_logic;
        en: in std_logic;
       a:in std_logic_vector(31 downto 0);
       b: in std_logic_vector(31 downto 0);
       sel: in std_logic_vector(3 downto 0);
       alu_out: out std_logic_vector(63 downto 0)
  );
end component;
signal en,rst:std_logic;
signal data1,data2:std_logic_vector(31 downto 0);
signal rez_alu:std_logic_vector(63 downto 0);
signal digits:std_logic_vector(15 downto 0);
begin
b1: MPG1 port map (clk,btn(0),en);
b2:MPG1 port map (clk,btn(1),rst);
--op:MEM port map(clk,en,sw(7 downto 4), sw(11 downto 8),data1,data2);
op:MEM port map(clk,en,"0000", "0001",data1,data2);
alu: ALU_op port map(clk,en,data1,data2,sw(15 downto 12),rez_alu);

with sw(3 downto 0) select
digits <=
        data1(15 downto 0) when "0000",
        data1(31 downto 16) when "0001",
        data2(15 downto 0) when "0010",
        data2(31 downto 16) when "0011",
        rez_alu(15 downto 0) when "0100", 
        rez_alu(31 downto 16) when "0101",
        rez_alu(47 downto 32) when "0110",
        rez_alu(63 downto 48) when "0111",
        (others =>'X') when others;
afisaj: SSD port map(clk,digits,an,cat);
led(15 downto 0)<=digits;
end Behavioral;
