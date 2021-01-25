library ieee;

use ieee.std_logic_1164.all;
use work.one_bit_ALU_package.all;
use work.sevseg_package.all;

entity sev_bit_ALU is
	port( ALUctrl : in std_logic_vector(3 downto 0);
			A, B: in std_logic_vector(6 downto 0);
			out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14 :out std_logic);
end sev_bit_ALU;

Architecture logicfunc of sev_bit_ALU is
	signal set, ignore, carryin: std_logic;
	signal result, carryout: std_logic_vector(6 downto 0);
	signal sign: std_logic;
begin
	sign <= ALUctrl(2) AND ALUctrl(1);
	G1: For i in 0 to 6 generate
		G2: if i=0 generate
			stage1: one_bit_ALU port map(ALUctrl(3 downto 0), A(i), B(i), set, sign, result(i), ignore, carryout(i));
			end generate;
		G3: if i=1 or i=2 or i=3 or i=4 or i=5 generate
			stage2: one_bit_ALU port map(ALUctrl(3 downto 0), A(i), B(i), '0', carryout(i-1), result(i), ignore, carryout(i));
			end generate;
		G4: if i=6 generate
			stage3: one_bit_ALU port map(ALUctrl(3 downto 0), A(i), B(i), '0', carryout(i-1), result(i), set, carryout(i));
			end generate;
		
		
	end generate;
	
	output: sevseg port map('0', result(6), result(5), result(4), result(3), result(2), result(1), result(0), out8, out9, out10, out11, out12, out13, out14, out1, out2, out3, out4, out5, out6, out7);
	
end logicfunc;
