LIBRARY ieee ;

USE ieee.std_logic_1164.all ;

ENTITY fulladder IS
	PORT ( 
		Cin, A, B : IN STD_LOGIC ;
		S, Cout : OUT STD_LOGIC ) ;
	END fulladder ;
ARCHITECTURE LogicFunc OF fulladder IS
	BEGIN
		S <= A XOR B XOR Cin ;
		Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
END LogicFunc ;