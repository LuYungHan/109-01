library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sevseg is
    port(w,x,y,z : in std_logic;
			w2,x2,y2,z2 : in std_logic;
         a,b,c,d,e,f,g : out std_logic;
			a2,b2,c2,d2,e2,f2,g2 : out std_logic);
end sevseg;

architecture logicfunc of sevseg is
    
	 
begin
		  a <= ((not w) and (not x) and (not y) and z) or ((not w) and x and (not y) and (not z)) or ((not w) and x and y and (not z)) or (w and (not x) and y and z) or (w and x and (not y) and (not z)) or (w and x and (not y) and z);
		  b <= (((not w) and x and (not y) and z) or ((not w) and x and y and (not z)) or (w and (not x) and y and z) or (w and x and (not y) and (not z)) or (w and x and y and (not z)) or (w and x and y and z));
		  c <= ((not w) and (not x) and y and (not z)) or ( w and x and (not z)) or ( w and x and y );
		  d <= ((not x) and (not y) and z ) or ((not w) and x and (not y) and (not z)) or ( x and y and z) or (w and (not x) and y and (not z));
		  e <= ((not w) and z) or ((not w) and x and (not y)) or ((not x) and (not y) and z);
		  f <= (((not w) and (not x) and z) or ((not w) and (not x) and y) or ((not w) and y and z) or (w and x and (not y)));
        g <= (((not w) and (not x) and (not y)) or ((not w) and x and y and z));
		  
		  a2 <= ((not w2) and (not x2) and (not y2) and z2) or ((not w2) and x2 and (not y2) and (not z2)) or ((not w2) and x2 and y2 and (not z2)) or (w2 and (not x2) and y2 and z2) or (w2 and x2 and (not y2) and (not z2)) or (w2 and x2 and (not y2) and z2);
		  b2 <= (((not w2) and x2 and (not y2) and z2) or ((not w2) and x2 and y2 and (not z2)) or (w2 and (not x2) and y2 and z2) or (w2 and x2 and (not y2) and (not z2)) or (w2 and x2 and y2 and (not z2)) or (w2 and x2 and y2 and z2));
		  c2 <= ((not w2) and (not x2) and y2 and (not z2)) or ( w2 and x2 and (not z2)) or ( w2 and x2 and y2 );
		  d2 <= ((not x2) and (not y2) and z2 ) or ((not w2) and x2 and (not y2) and (not z2)) or ( x2 and y2 and z2) or (w2 and (not x2) and y2 and (not z2));
		  e2 <= ((not w2) and z2) or ((not w2) and x2 and (not y2)) or ((not x2) and (not y2) and z2);
		  f2 <= (((not w2) and (not x2) and z2) or ((not w2) and (not x2) and y2) or ((not w2) and y2 and z2) or (w2 and x2 and (not y2)));
        g2 <= (((not w2) and (not x2) and (not y2)) or ((not w2) and x2 and y2 and z2));
end logicfunc;
