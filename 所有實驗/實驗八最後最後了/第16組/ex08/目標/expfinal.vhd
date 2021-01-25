library ieee;
use ieee.std_logic_1164.all;


entity expfinal is
	port( Data: in std_logic_vector(7 downto 0);
			Instruction: in std_logic_vector(7 downto 0);
			Clock: in std_logic;
			Data_HEX1, Data_HEX0: out std_logic_vector(6 downto 0);
			Rs_HEX1, Rs_HEX0: out std_logic_vector(6 downto 0);
			Rt_HEX1, Rt_HEX0: out std_logic_vector(6 downto 0);
			HazardDetection: out std_logic;
			ExcuteStatus: out std_logic_vector(3 downto 0));
end expfinal;

architecture expfinal_arch of expfinal is
	component PipelineCPU
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
	end component;
	
	component SevenSegmentDriver
		port(h3, h2, h1, h0: in std_logic;
			  a, b, c, d, e, f, g: out std_logic);
	end component;
	
	signal tmpRs, tmpRt: std_logic_vector(7 downto 0);

begin
	PCPU: PipelineCPU
		port map(Data, Instruction, Clock, tmpRs, tmpRt, HazardDetection, ExcuteStatus);
	
	HEX1_Data: SevenSegmentDriver
		port map(Data(7), Data(6), Data(5), Data(4), Data_HEX1(0), Data_HEX1(1), Data_HEX1(2), Data_HEX1(3), Data_HEX1(4), Data_HEX1(5), Data_HEX1(6));
	HEX0_Data: SevenSegmentDriver
		port map(Data(3), Data(2), Data(1), Data(0), Data_HEX0(0), Data_HEX0(1), Data_HEX0(2), Data_HEX0(3), Data_HEX0(4), Data_HEX0(5), Data_HEX0(6));

	HEX1_Rs: SevenSegmentDriver
		port map(tmpRs(7), tmpRs(6), tmpRs(5), tmpRs(4), Rs_HEX1(0), Rs_HEX1(1), Rs_HEX1(2), Rs_HEX1(3), Rs_HEX1(4), Rs_HEX1(5), Rs_HEX1(6));
	HEX0_Rs: SevenSegmentDriver
		port map(tmpRs(3), tmpRs(2), tmpRs(1), tmpRs(0), Rs_HEX0(0), Rs_HEX0(1), Rs_HEX0(2), Rs_HEX0(3), Rs_HEX0(4), Rs_HEX0(5), Rs_HEX0(6));

	HEX1_Rt: SevenSegmentDriver
		port map(tmpRt(7), tmpRt(6), tmpRt(5), tmpRt(4), Rt_HEX1(0), Rt_HEX1(1), Rt_HEX1(2), Rt_HEX1(3), Rt_HEX1(4), Rt_HEX1(5), Rt_HEX1(6));
	HEX0_Rt: SevenSegmentDriver
		port map(tmpRt(3), tmpRt(2), tmpRt(1), tmpRt(0), Rt_HEX0(0), Rt_HEX0(1), Rt_HEX0(2), Rt_HEX0(3), Rt_HEX0(4), Rt_HEX0(5), Rt_HEX0(6));

end expfinal_arch;