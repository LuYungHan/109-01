library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PipelineCPU is
	port( Data: in std_logic_vector(7 downto 0);
			Instruction: in std_logic_vector(7 downto 0);
			--Instruction(7-4) : Opcode
			--Instruction(3-2) : Rs address
			--Instruction(1-0) : Rt address
			Clock: in std_logic;
			D_Rs: out std_logic_vector(7 downto 0);
			D_Rt: out std_logic_vector(7 downto 0);
			HazardDetection: out std_logic;
			ExcuteStatus: out std_logic_vector(3 downto 0));
			
end PipelineCPU;

architecture PCPU_arch of PipelineCPU is

	function getOpcode(Ins: std_logic_vector(7 downto 0)) return std_logic_vector is
	begin
		return Ins(7 downto 4);
	end function;

	signal r0, r1, r2, r3: std_logic_vector(7 downto 0);

begin
	
	D_Rs <= r0 when Instruction(3 downto 2) = "00" else
		 r1 when Instruction(3 downto 2) = "01" else
		 r2 when Instruction(3 downto 2) = "10" else
		 r3;
	D_Rt <= r0 when Instruction(1 downto 0) = "00" else
		 r1 when Instruction(1 downto 0) = "01" else
		 r2 when Instruction(1 downto 0) = "10" else
		 r3;
	
	process(Clock)
		variable tmpIns1: std_logic_vector(7 downto 0) := "11110000";	--Instruction fetch
		variable tmpIns2: std_logic_vector(7 downto 0) := "11110000";	--Instruction decode
		variable tmpIns3: std_logic_vector(7 downto 0) := "11110000";	--Excution
		variable tmpIns4: std_logic_vector(7 downto 0) := "11110000";	--Write back
		
		variable excuteResult: std_logic_vector(7 downto 0);
		
		variable tmpRs, tmpRt, tmpData1, tmpData2: std_logic_vector(7 downto 0);
		
	begin
		if rising_edge(Clock) then
			--Write back
			tmpIns4 := tmpIns3;
			
			if not (getOpcode(tmpIns4) = "1111") then
				ExcuteStatus(3) <= '1';
				
				case tmpIns4(3 downto 2) is	--Rs address
					when "00" => r0 <= excuteResult;
					when "01" => r1 <= excuteResult;
					when "10" => r2 <= excuteResult;
					when others => r3 <= excuteResult;
				end case;
			else
				ExcuteStatus(3) <= '0';
			end if;
			
			--Excution
			tmpIns3 := tmpIns2;
			
			
			case getOpcode(tmpIns3) is
				when "0000" =>		--Load
					excuteStatus(2) <= '1';
					excuteResult := tmpData2;
					
				when "0001" => 	--Move
					excuteStatus(2) <= '1';
					excuteResult := tmpRt;
					
				when "0010" =>		--Add
					excuteStatus(2) <= '1';
					excuteResult := std_logic_vector(signed(tmpRs) + signed(tmpRt));
					
				when "0011" =>		--Sub
					excuteStatus(2) <= '1';
					excuteResult := std_logic_vector(signed(tmpRs) - signed(tmpRt));
					
				when "0100" =>		--And
					excuteStatus(2) <= '1';
					excuteResult := tmpRs and tmpRt;
					
				when "0101" =>		--Or
					excuteStatus(2) <= '1';
					excuteResult := tmpRs or tmpRt;
					
				when "0110" =>		--Nor

					excuteStatus(2) <= '1';
					excuteResult := tmpRs nor tmpRt;
					
				when "0111" =>		--slt
					excuteStatus(2) <= '1';
					if unsigned(tmpRs) < unsigned(tmpRt) then
						excuteResult := "00000001";
					else
						excuteResult := "00000000";
					end if;
					
				when others =>		--No ins
					excuteStatus(2) <= '0';
			end case;
			
			--Instruction decode
			tmpIns2 := tmpIns1;
			
			if not (getOpcode(tmpIns2) = "1111") then
				excuteStatus(1) <= '1';
				
				if (tmpIns3(3 downto 2) = tmpIns2(3 downto 2)) or (tmpIns3(3 downto 2) = tmpIns2(1 downto 0)) then
					HazardDetection <= '1';
					
					tmpRs := excuteResult;
				else
					HazardDetection <= '0';
					
					case tmpIns2(3 downto 2) is
						when "00" => tmpRs := r0;
						when "01" => tmpRs := r1;
						when "10" => tmpRs := r2;
						when others => tmpRs := r3;
					end case;
				end if;
				
				case tmpIns2(1 downto 0) is
					when "00" => tmpRt := r0;
					when "01" => tmpRt := r1;
					when "10" => tmpRt := r2;
					when others => tmpRt := r3;
				end case;
				
				tmpData2 := tmpData1;
			else
				HazardDetection <= '0';
				excuteStatus(1) <= '0';
			end if;
			
			--Instruction fetch
			if not (getOpcode(Instruction) = "1111") then
				excuteStatus(0) <= '1';
				
				tmpData1 := Data;
				
				tmpIns1 := Instruction;
			else
				excuteStatus(0) <= '0';
				
				tmpIns1 := "11110000";
			end if;
		end if;
	end process;
end PCPU_arch;