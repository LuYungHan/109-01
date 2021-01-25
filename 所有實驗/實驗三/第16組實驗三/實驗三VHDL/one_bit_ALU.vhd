library ieee;

use ieee.std_logic_1164.all;
use work.fulladder_package.all;
use work.mux2to1_package.all;
use work.mux4to1_package.all;

entity one_bit_ALU is
	port( ALUctrl : in std_logic_vector(3 downto 0);
			A,B,less,carryin : IN std_logic;
			result, set, carryout : OUT std_logic);
end one_bit_ALU;

Architecture logicfunc of one_bit_ALU is
	signal orGate, andGate, add :std_logic;
	signal outA, outB :std_logic;
begin
	mux2_1: mux2to1 port map(input(0) => A, input(1) => not(A), s => ALUctrl(3), f => outA);
	mux2_2: mux2to1 port map(input(0) => B, input(1) => not(B), s => ALUctrl(2), f => outB);
	
	add1: fulladder port map(carryin, outA, outB, add, carryout);
	
	orGate <= outA or outB;
	andGate <= outA and outB;
	set <= add;
	
	mux4_1: mux4to1 port map(input(0) => andGate, input(1) => orGate, input(2) => add, input(3) => less, s(0) => ALUctrl(0), s(1) => ALUctrl(1), f => result);
	
end logicfunc;
