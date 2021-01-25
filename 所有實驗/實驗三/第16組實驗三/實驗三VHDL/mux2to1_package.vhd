library ieee;
use ieee.std_logic_1164.all;

PACKAGE mux2to1_package IS
	COMPONENT mux2to1
		port ( input: in std_logic_vector(1 downto 0);
				s : IN std_logic;
				f: out std_logic);
	END COMPONENT ;
END mux2to1_package ;