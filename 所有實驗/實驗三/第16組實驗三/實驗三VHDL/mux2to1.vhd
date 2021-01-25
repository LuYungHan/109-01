library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
	port ( input: in std_logic_vector(1 downto 0);
			 s : IN std_logic;
			 f: out std_logic);
end mux2to1;

architecture behavior of mux2to1 is
begin 
	with s select
		f <= input(0) when '0',
			  input(1) when others;
end behavior;