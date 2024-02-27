library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity cla is
Port( a,b : in std_logic_vector(31 downto 0);
      res : out std_logic_vector(31 downto 0));

end cla;

architecture Behavioral of cla is
component full_adder is 
  Port ( x : in STD_LOGIC;
          y : in STD_LOGIC;
          carry_in : in STD_LOGIC;
          sum : out STD_LOGIC;
          P : out STD_LOGIC;
          G: out STD_LOGIC );
      
 end component;
 signal G,P,C,S : std_logic_vector(31 downto 0);
 signal cin: std_logic_vector(31 downto 0);
begin
cin(0)<='0';
cin(1)<=G(0) or (P(0) and cin(0));
cin(2)<=G(1) or (P(1) and cin(1));
cin(3) <= G(2) or (P(2) and cin(2));
cin(4) <= G(3) or (P(3) and cin(3));
cin(5) <= G(4) or (P(4) and cin(4));
cin(6) <= G(5) or (P(5) and cin(5));
cin(7) <= G(6) or (P(6) and cin(6));
cin(8) <= G(7) or (P(7) and cin(7));
cin(9) <= G(8) or (P(8) and cin(8));
cin(10) <= G(9) or (P(9) and cin(9));
cin(11) <= G(10) or (P(10) and cin(10));
cin(12) <= G(11) or (P(11) and cin(11));
cin(13) <= G(12) or (P(12) and cin(12));
cin(14) <= G(13) or (P(13) and cin(13));
cin(15) <= G(14) or (P(14) and cin(14));
cin(16) <= G(15) or (P(15) and cin(15));
cin(17) <= G(16) or (P(16) and cin(16));
cin(18) <= G(17) or (P(17) and cin(17));
cin(19) <= G(18) or (P(18) and cin(18));
cin(20) <= G(19) or (P(19) and cin(19));
cin(21) <= G(20) or (P(20) and cin(20));
cin(22) <= G(21) or (P(21) and cin(21));
cin(23) <= G(22) or (P(22) and cin(22));
cin(24) <= G(23) or (P(23) and cin(23));
cin(25) <= G(24) or (P(24) and cin(24));
cin(26) <= G(25) or (P(25) and cin(25));
cin(27) <= G(26) or (P(26) and cin(26));
cin(28) <= G(27) or (P(27) and cin(27));
cin(29) <= G(28) or (P(28) and cin(28));
cin(30) <= G(29) or (P(29) and cin(29));
cin(31) <= G(30) or (P(30) and cin(30));

 


bit0: full_adder port map(a(0), b(0),cin(0), S(0), P(0), G(0));
bit1: full_adder port map(a(1), b(1),cin(1), S(1), P(1), G(1));
bit2: full_adder port map(a(2), b(2), cin(2), S(2), P(2), G(2));
bit3: full_adder port map(a(3), b(3), cin(3), S(3), P(3), G(3));
bit4: full_adder port map(a(4), b(4), cin(4), S(4), P(4), G(4));
bit5: full_adder port map(a(5), b(5), cin(5), S(5), P(5), G(5));
bit6: full_adder port map(a(6), b(6), cin(6), S(6), P(6), G(6));
bit7: full_adder port map(a(7), b(7), cin(7), S(7), P(7), G(7));
bit8: full_adder port map(a(8), b(8), cin(8), S(8), P(8), G(8));
bit9: full_adder port map(a(9), b(9), cin(9), S(9), P(9), G(9));
bit10: full_adder port map(a(10), b(10), cin(10), S(10), P(10), G(10));
bit11: full_adder port map(a(11), b(11), cin(11), S(11), P(11), G(11));
bit12: full_adder port map(a(12), b(12), cin(12), S(12), P(12), G(12));
bit13: full_adder port map(a(13), b(13), cin(13), S(13), P(13), G(13));
bit14: full_adder port map(a(14), b(14), cin(14), S(14), P(14), G(14));
bit15: full_adder port map(a(15), b(15), cin(15), S(15), P(15), G(15));
bit16: full_adder port map(a(16), b(16), cin(16), S(16), P(16), G(16));
bit17: full_adder port map(a(17), b(17), cin(17), S(17), P(17), G(17));
bit18: full_adder port map(a(18), b(18), cin(18), S(18), P(18), G(18));
bit19: full_adder port map(a(19), b(19), cin(19), S(19), P(19), G(19));
bit20: full_adder port map(a(20), b(20), cin(20), S(20), P(20), G(20));
bit21: full_adder port map(a(21), b(21), cin(21), S(21), P(21), G(21));
bit22: full_adder port map(a(22), b(22), cin(22), S(22), P(22), G(22));
bit23: full_adder port map(a(23), b(23), cin(23), S(23), P(23), G(23));
bit24: full_adder port map(a(24), b(24), cin(24), S(24), P(24), G(24));
bit25: full_adder port map(a(25), b(25), cin(25), S(25), P(25), G(25));
bit26: full_adder port map(a(26), b(26), cin(26), S(26), P(26), G(26));
bit27: full_adder port map(a(27), b(27), cin(27), S(27), P(27), G(27));
bit28: full_adder port map(a(28), b(28), cin(28), S(28), P(28), G(28));
bit29: full_adder port map(a(29), b(29), cin(29), S(29), P(29), G(29));
bit30: full_adder port map(a(30), b(30), cin(30), S(30), P(30), G(30));
bit31: full_adder port map(a(31), b(31), cin(31), S(31), P(31), G(31));



res<=S;
end Behavioral;