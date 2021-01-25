LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.fulladd_package.all ;
USE work.seven_segment_display_package.all ;
USE ieee.std_logic_signed.all ;

ENTITY adder8 IS
PORT ( Cin   : IN STD_LOGIC ;
       X, Y  : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
    
        Cout : OUT STD_LOGIC ;
      WW,XX,YY,ZZ: IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
    A,B,C,D,E,F,G   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)) ;
END adder8 ;
ARCHITECTURE Structure OF adder8 IS
SIGNAL CC : STD_LOGIC_VECTOR(1 TO 7) ;
SIGNAL S :  STD_LOGIC_VECTOR(7 DOWNTO 0) ;


BEGIN
   stage0: fulladd PORT MAP ( '0', X(0), Y(0), S(0), CC(1) ) ;
   stage1: fulladd PORT MAP ( CC(1), X(1), Y(1), S(1), CC(2) ) ;
   stage2: fulladd PORT MAP ( CC(2), X(2), Y(2), S(2), CC(3) ) ;
   stage3: fulladd PORT MAP ( CC(3), X(3), Y(3), S(3), CC(4) ) ;
   stage4: fulladd PORT MAP ( CC(4), X(4), Y(4), S(4), CC(5) ) ;
   stage5: fulladd PORT MAP ( CC(5), X(5), Y(5), S(5), CC(6) ) ;
   stage6: fulladd PORT MAP ( CC(6), X(6), Y(6), S(6), CC(7) ) ;
   stage7: fulladd PORT MAP ( CC(7), X(7), Y(7), S(7), Cout ) ;
       
   stage8:seven_segment_display PORT MAP (s(7),s(6),s(5),s(4),A(1),B(1),C(1),D(1),E(1),F(1),G(1));
   stage9:seven_segment_display PORT MAP (s(3),s(2),s(1),s(0),A(0),B(0),C(0),D(0),E(0),F(0),G(0));
END Structure ;
