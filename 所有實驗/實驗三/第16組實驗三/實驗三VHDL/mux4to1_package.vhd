library ieee;
use ieee.std_logic_1164.all;

PACKAGE mux4to1_package IS
	COMPONENT mux4to1
		port ( input: in std_logic_vector(3 downto 0);
			 s: in std_logic_vector(1 downto 0);
			 f: out std_logic);
	END COMPONENT ;
END mux4to1_package;
