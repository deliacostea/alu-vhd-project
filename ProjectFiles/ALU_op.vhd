----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2023 05:28:01 PM
-- Design Name: 
-- Module Name: ALU_op - Behavioral
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

entity ALU_op is
  Port ( clk:in std_logic;
         en: in std_logic;
        a:in std_logic_vector(31 downto 0);
        b: in std_logic_vector(31 downto 0);
        sel: in std_logic_vector(3 downto 0);
        alu_out: out std_logic_vector(63 downto 0)
   );
end ALU_op;

architecture Behavioral of ALU_op is
component adunare_scadere is
 Port (a,b: in std_logic_vector(31 downto 0);
       res: out std_logic_vector(31 downto 0);
       sel:in std_logic
    
  );
end component;

component decrementare is
 Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
        res : out STD_LOGIC_VECTOR (31 downto 0));
end component;


component incrementare is
 Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
          res : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component nuLogic is
 Port (a: in std_logic_vector(31 downto 0);
       res: out std_logic_vector(31 downto 0)
 
 );
end component;

component sauLogic is
Port (a,b: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(31 downto 0)
      
   );
end component;

component siLogic is
Port (a,b: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(31 downto 0)
     
   );
end component;

component shiftRegister is
 Port (clk: in std_logic;
       rst: in std_logic;
       shiftdir : in std_logic;
       data: in std_logic;
       res: out std_logic_vector(31 downto 0)
 
  );
end component;

component wallace is
 Port (x, y: in std_logic_vector(31 downto 0);
 produs: out std_logic_vector(127 downto 0)
 
  );
end component;

component impartire1 is
   Port (op_a,op_b: in std_logic_vector(31 downto 0);
      cat: out std_logic_vector(31 downto 0);
      rest: out std_logic_vector(31 downto 0)
 );
end component;

component rotatii is
 Port (a: in std_logic_vector(31 downto 0);
dir: in std_logic;
rez: out std_logic_vector(31 downto 0)
 );
 end component;

signal res_ad,res_sc,res_si,res_sau,res_not,res_inc,res_dec,res_shift_l,res_shift_r,cat_imp,rest_imp,res_rotR,res_rotL: std_logic_vector(31 downto 0);
signal res_mul:std_logic_vector(127 downto 0);
signal sel1,sel0:std_logic;
signal rst:std_logic;
begin
sel1<='1';
sel0<='0';
ad11: adunare_scadere port map(a,b,res_ad,sel0);
sc1: adunare_scadere port map(a,b,res_sc,sel1);
si1: siLogic port map(a,b,res_si);
sau1: sauLogic port map(a,b,res_sau);
not1: nuLogic port map(a,res_not);
dec1: decrementare port map(a,res_dec);
inc1: incrementare port map(a,res_inc);
mul1: wallace port map(a,b,res_mul);
shL1:shiftRegister port map (clk,rst,sel1,'1',res_shift_l);
shR1:shiftRegister port map(clk,rst,sel0,'1',res_shift_r);
imp: impartire1 port map(a,b,cat_imp,rest_imp);
rotL:rotatii port map(a,sel0,res_rotL);
rotR:rotatii port map(a,sel1,res_rotR);

process(sel,a,b,clk,en)
begin
    if clk'event and clk='1' then
    if en='1' then
    case sel is
    when "0000" => --adunare
             alu_out(31 downto 0)<=res_ad;
             alu_out(63 downto 32)<=x"00000000";
    when "0001" => --scadere
            alu_out(31 downto 0)<=res_sc;
    when "0010" =>--si
            alu_out(31 downto 0)<=res_si;
    when "0011" =>--sau
            alu_out(31 downto 0)<=res_sau;
    when "0100" =>--nu
            alu_out(31 downto 0)<=res_not;
    when "0101" =>--incrementare
            alu_out(31 downto 0)<=res_inc;
    when "0110" =>--decremenare
            alu_out(31 downto 0)<=res_dec;
    when "0111" => --shiftLeft
            alu_out(31 downto 0)<=res_shift_l;
    when"1000"=>--shiftRight
            alu_out(31 downto 0)<=res_shift_r;
    when"1001"=>--rotRight
            alu_out(31 downto 0)<=res_rotR;
    when"1010"=>--rotLeft
            alu_out(31 downto 0)<=res_rotL;        
    when"1011"=>--inmultire
            alu_out<=res_mul(63 downto 0);
    when"1100"=> --impartire
            alu_out(31 downto 0)<=cat_imp;
            alu_out(63 downto 32)<= rest_imp;
    when others=> alu_out <= (others=>'0');
end case;
end if;
end if;
end process;
  


end Behavioral;
