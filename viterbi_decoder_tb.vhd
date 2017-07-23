------------------------------------------------------------------------
--   2,1,4 Convolutional Coder / Viterbi Decoder on VHDL              --
--   @author Mustafa Ozcelikors,  Hassan Qayyum,  Umair Saleem        --
--                                                                    --
--   Master-ESM                                                       --
--   Microelectronics & Hw-Sw Co-Design Course                        --
--   FH Dortmund                                                      --
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
--To simulate,
--Make UUT (ViterbiDecoder) Top Level entity
--Initially, Assignments > Settings > Add Test bench file
--Then to run simulation, flow > "RTL Simulation"

entity viterbi_decoder_tb is
end entity viterbi_decoder_tb;

architecture stimulus_driver of viterbi_decoder_tb is
	constant CLK_PERIOD : time := 40 ns;
	constant TIME_MARGIN : time := 10 ns;
	component ViterbiDecoder is
		Generic (
			CONSTRAINT_LENGTH: integer := 4;
			TIME_WINDOW : integer := 7;
			TOTAL_PARITY_BITS : integer := 2;
			TOTAL_PATHS : integer := 128
		 );
		Port (
			ParityIn : in std_logic_vector (1 downto 0);
			Output: out std_logic_vector(6 downto 0);
			Output_Valid : out std_logic;
			Reset : in std_logic;
			Clock : in std_logic
		);
	end component ViterbiDecoder;
	signal s_parityin : std_logic_vector (1 downto 0) := "00";
	signal s_output : std_logic_vector(6 downto 0);
	signal s_output_valid : std_logic := '0';
	signal s_reset, s_clock : std_logic := '0';
begin
	UnitUnderTest7 : ViterbiDecoder port map (
		ParityIn => s_parityin,
		Output => s_output,
		Output_Valid => s_output_valid,
		Reset => s_reset,
		Clock => s_clock
	);
	
	s_clock <= not s_clock after CLK_PERIOD/2;
					  
					  
	Stimulus: process is begin
		--Initialization
		s_parityin <= "00";
		s_reset <= '1';
		
		--Waiting
		wait for 10 ns; --Time margin to avoid inputs changing at clock cycle.
		
		--Write possible inputs
		s_reset <= '0';
		
		wait for 5 ns;
		
		s_parityin <= "11"; --Expected decoder out: 1011000
		wait for CLK_PERIOD;
		
		s_parityin <= "11";
		wait for CLK_PERIOD;
		
		s_parityin <= "01";
		wait for CLK_PERIOD;
		
		s_parityin <= "11";
		wait for CLK_PERIOD;
		
		s_parityin <= "01";
		wait for CLK_PERIOD;
		
		s_parityin <= "01";
		wait for CLK_PERIOD;
		
		s_parityin <= "11";
		wait for CLK_PERIOD;
		
				
		wait for 5*CLK_PERIOD;
		
		if(s_output_valid ='1')then
			assert s_output = "1011000" report "Expected result does not match the output!" severity WARNING;
		end if;
		
		--Stop simulation
		wait;
	end process;	
end stimulus_driver;