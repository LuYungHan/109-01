library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
	port ( input: in std_logic_vector(3 downto 0);
			 s: in std_logic_vector(1 downto 0);
			 f: out std_logic);
end mux4to1;

architecture behavior of mux4to1 is
begin
	with s select
		f <= input(0) when "00",
			  input(1) when "01",
			  input(2) when "10",
			  input(3) when "11";
end behavior;