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
--Make UUT (ViterbiSystem) Top Level entity
--Initially, Assignments > Settings > Add Test bench file
--Then to run simulation, flow > "RTL Simulation"

entity bit_error_tb is
end entity bit_error_tb;

architecture stimulus_driver of bit_error_tb is
	constant CLK_PERIOD : time := 40 ns;
	constant TIME_MARGIN : time := 10 ns;
	
	
	component BitError is 
		Port (
			Clock : in std_logic;
			Reset : in std_logic;
			Codeword_in : in std_logic_vector(1 downto 0);
			Codeword_out : out std_logic_vector(1 downto 0)
		);
	end component BitError;
	
	signal s_clock : std_logic := '0';
	signal s_reset : std_logic;
	signal s_codeword_in : std_logic_vector(1 downto 0);
	signal s_codeword_out : std_logic_vector(1 downto 0);
	
	
begin
	UnitUnderTest5 : BitError port map (
		Clock => s_clock,
		Reset => s_reset,
		Codeword_in => s_codeword_in,
		Codeword_out => s_codeword_out
	);
	
	
	s_clock <= not s_clock after CLK_PERIOD/2;
					  
	Stimulus: process is begin
		--Initialization
		s_codeword_in <= "11";
		s_reset <= '1';
		
		--Waiting
		wait for 10 ns; --Time margin to avoid inputs changing at clock cycle.
		
		--Write possible inputs
		s_reset <= '0';
		
		wait for 5 ns;
		
		s_codeword_in <= "11";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "11";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "11";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "00";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "00";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "11";
		wait for CLK_PERIOD;
		
		s_codeword_in <= "11";
		wait for CLK_PERIOD;
		
		--Stop simulation
		wait for 10 ms; 
		wait ;
	end process;	
end stimulus_driver;