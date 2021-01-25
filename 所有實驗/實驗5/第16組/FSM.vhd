library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port( clock, resetn, w: in std_logic ;
		y: out std_logic_vector (1 to 3) );
end FSM ;

architecture behavior of FSM is
type state_type is(s0,s1,s2,s3,s4,s5);
signal state: state_type ;
begin

next_state_logic: process (resetn, clock)
begin
 if resetn = '0' then
	state <= s0 ; 
 elsif (clock'event and clock = '1') then
	case state is
	when s0 =>
		if w = '1' then
			state <= s1 ;
		else
			state <= s0 ;
		end if ;
	when s1 =>
		if w = '1' then
			state <= s3 ;
		else
			state <= s2 ;
		end if ;
	when s2 =>
		state <= s4 ;
	when s3 =>
		state <= s4 ;
	when s4 =>
		 if w = '0' then
			 state <= s1 ;
		 else
			state <= s5 ;
		end if ;
	when s5 =>
		 state <= s5 ;
	end case;
	end if ;
	end process;
	
	output_logic: process(state, w)
		begin
			case state is
			when s0 => 
				y <= "000" ;
			when s1 =>
				y <= "001" ;
			when s2 =>
				y <= "010" ;
			when s3 =>
				y <= "011" ;
			when s4 =>
				y <= "100";
			when s5 =>
				 y <= "101" ;
			end case ;
		end process;
		
end behavior ;
