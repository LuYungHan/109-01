library ieee;

use ieee.std_logic_1164.all;
use work.fulladder_package.all;
use work.mux2to1_package.all;
use work.mux4to1_package.all;

PACKAGE one_bit_ALU_package IS
	COMPONENT one_bit_ALU
		port( ALUctrl : in std_logic_vector(3 downto 0);
				A,B,less,carryin : IN std_logic;
				result, set, carryout : OUT std_logic);
	END COMPONENT ;
END one_bit_ALU_package ;