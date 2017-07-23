--License:
--	ViterbiDecoding_VHDL is free software: you can redistribute it and/or modify
--	it under the terms of the GNU General Public License as published by
--	the Free Software Foundation, either version 3 of the License, or
--	(at your option) any later version.
--
--	ViterbiDecoding_VHDL is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--	GNU General Public License for more details.
--
--	You should have received a copy of the GNU General Public License
--	along with ViterbiDecoding_VHDL.  If not, see <http://www.gnu.org/licenses/>.
--
--Description:
--	This software can be used to encode and decode (2,1,4) convolutional messages.
--	Testing benches and bit error introduction is also included.
--
--Authors: 
--	Mustafa Ozcelikors 
--		thewebblog.net
--		github.com/mozcelikors
--		<mozcelikors@gmail.com>
--	Hassan Qayyum
--	Umair Saleem
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
--To simulate,
--Make UUT (ViterbiEncoder) Top Level entity
--Initially, Assignments > Settings > Add Test bench file
--Then to run simulation, flow > "RTL Simulation"

entity viterbi_encoder_tb is
end entity viterbi_encoder_tb;

architecture stimulus_driver of viterbi_encoder_tb is
	constant CLK_PERIOD : time := 40 ns;
	constant TIME_MARGIN : time := 10 ns;
	component ViterbiEncoder is
		Port (
			Input : in std_logic;
			Output: out std_logic_vector (1 downto 0);
			Reset : in std_logic;
			Clock : in std_logic
		);
	end component ViterbiEncoder;
	signal s_input : std_logic;
	signal s_output : std_logic_vector(1 downto 0) := "00";
	signal s_reset : std_logic := '0';
	signal s_clock : std_logic :='0';
begin
	UnitUnderTest3 : ViterbiEncoder port map (
		Input => s_input,
		Output => s_output,
		Reset => s_reset,
		Clock => s_clock
	);
	
	s_clock <= not s_clock after CLK_PERIOD/2;
					  
	Stimulus: process is begin
		--Initialization
		s_input <= '0';
		s_reset <= '1';
		
		--Waiting
		wait for TIME_MARGIN; --Time margin to avoid inputs changing at clock cycle.
		
		--Write possible inputs
		s_reset <= '0';
		
		wait for 5 ns;
		
		s_input <= '1'; -- 1011000
		wait for CLK_PERIOD;
		
		s_input <= '0';
		wait for CLK_PERIOD;
		
		s_input <= '1';
		wait for CLK_PERIOD;
		
		s_input <= '1';
		wait for CLK_PERIOD;
		
		s_input <= '0';
		wait for CLK_PERIOD;
		
		s_input <= '0';
		wait for CLK_PERIOD;
		
		s_input <= '0';
		wait for CLK_PERIOD;
		
		--Stop simulation
		wait; 
	end process;	
end stimulus_driver;