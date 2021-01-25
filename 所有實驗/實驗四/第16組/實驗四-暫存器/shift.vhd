LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY shift IS

GENERIC (N : INTEGER := 16);
PORT(    clk    : IN STD_LOGIC;
			clear  : IN STD_LOGIC;
			load   : IN STD_LOGIC;
			lr_sel : IN STD_LOGIC;
			di     : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sdi    : IN STD_LOGIC;
			qo     : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0));

END  shift;

ARCHITECTURE Behavior OF shift IS
BEGIN
	process
	BEGIN
		wait until clk'event and clk='1';
		
		if clear ='1'then
				qo<= "0000000000000000";
		

		elsif load ='1'then
				qo<= di;
		

		elsif lr_sel ='1'then
					Genbits:For i in 0 to N-2 Loop
					qo(i) <= qo(i+1) ;
				end Loop;
				qo(N-1)<=sdi;
		elsif lr_sel ='0'then
					Genbits1:For i in 1 to N-1 Loop
					qo(i) <= qo(i-1) ;
				end Loop;
				qo(0)<=sdi;
		end if;
		
		


	END process;

END Behavior;