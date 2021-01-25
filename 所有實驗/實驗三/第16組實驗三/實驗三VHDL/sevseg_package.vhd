LIBRARY ieee ;

USE ieee.std_logic_1164.all ;

PACKAGE sevseg_package IS
	COMPONENT sevseg
		port(w,x,y,z:in std_logic;
			w2,x2,y2,z2: in std_logic;
			a,b,c,d,e,f,g : out std_logic;
			a2,b2,c2,d2,e2,f2,g2 : out std_logic);
	END COMPONENT ;
END sevseg_package ;
