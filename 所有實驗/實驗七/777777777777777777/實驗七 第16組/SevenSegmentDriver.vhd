library ieee;
use ieee.std_logic_1164.all;

entity SevenSegmentDriver is
	port(h3, h2, h1, h0: in std_logic;
		  a, b, c, d, e, f, g: out std_logic);
end SevenSegmentDriver;


architecture SSD_arch of SevenSegmentDriver is

begin
	a <= (not h3 and not h2 and not h1 and h0) or (h3 and not h2 and h1 and h0) or (h3 and h2 and not h1) or (h2 and not h1 and not h0);
	b <= (not h3 and h2 and not h1 and h0) or (h3 and h2 and not h0) or (h3 and h1 and h0) or (h2 and h1 and not h0);
	c <= (not h3 and not h2 and h1 and not h0) or (h3 and h2 and not h0) or (h3 and h2 and h1);
	d <= (not h2 and not h1 and h0) or (not h3 and h2 and not h1 and not h0) or (h2 and h1 and h0) or (h3 and not h2 and h1 and not h0);
	e <= (not h3 and h0) or (not h3 and h2 and not h1) or (not h2 and not h1 and h0);
	f <= (not h3 and not h2 and h0) or (not h3 and not h2 and h1) or (not h3 and h1 and h0) or (h3 and h2 and not h1);
	g <= (not h3 and not h2 and not h1) or (not h3 and h2 and h1 and h0);
end SSD_arch;