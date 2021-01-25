LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.fulladd_package.all ;
USE work.seven_segment_display_package.all ;
USE ieee.std_logic_signed.all ;

ENTITY BCDAdder IS
PORT(
X,Y : IN STD_LOGIC_VECTOR(3 downto 0);
Cout : OUT STD_LOGIC;
A,B,C,D,E,F,G   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)) ;
END BCDAdder;
ARCHITECTURE a OF BCDAdder IS
SIGNAL cc : STD_LOGIC_VECTOR(8 downto 0);
SIGNAL S :  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
SIGNAL carry :  STD_LOGIC ;
SIGNAL temp :  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
BEGIN

	stage0: fulladd PORT MAP ( '0', X(0), Y(0), S(0), CC(1) ) ;
   stage1: fulladd PORT MAP ( CC(1), X(1), Y(1), S(1), CC(2) ) ;
   stage2: fulladd PORT MAP ( CC(2), X(2), Y(2), S(2), CC(3) ) ;
   stage3: fulladd PORT MAP ( CC(3), X(3), Y(3), S(3), CC(4) ) ;
	carry <=  ( S(3) and S(2)) or (S(3) and S(1)) or CC(4);
	
	stage7: fulladd PORT MAP ( '0', S(0), '0', temp(0), CC(5) ) ;
	stage4: fulladd PORT MAP ( CC(5), S(1), carry, temp(1), CC(6) ) ;
   stage5: fulladd PORT MAP ( CC(6), S(2), carry,temp(2) , CC(7) ) ;
   stage6: fulladd PORT MAP ( CC(7), s(3), '0', temp(3), CC(8) ) ;
	
       
   stage8:seven_segment_display PORT MAP ('0','0','0',carry,A(1),B(1),C(1),D(1),E(1),F(1),G(1));
   stage9:seven_segment_display PORT MAP (temp(3),temp(2),temp(1),temp(0),A(0),B(0),C(0),D(0),E(0),F(0),G(0));

END a; 