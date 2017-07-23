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

entity ViterbiSystem_withBitError is 
	Port (
		Enc_In : in std_logic;
		Decoder_Out : out std_logic_vector(6 downto 0);
		Decoder_Out_Valid : out std_logic;
		Clock : in std_logic;
		Reset : in std_logic
	);
end entity ViterbiSystem_withBitError;

architecture comb of ViterbiSystem_withBitError is
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
	
	component BitError is 
		Port (
			Clock : in std_logic;
			Reset : in std_logic;
			Codeword_in : in std_logic_vector(1 downto 0);
			Codeword_out : out std_logic_vector(1 downto 0)
		);
	end component BitError;
	

	signal s_output : std_logic_vector(1 downto 0) ;
	signal s_output_with_error : std_logic_vector(1 downto 0) ;
	
begin
	ve : ViterbiEncoder port map (
		Input => Enc_In,
		Output => s_output,
		Reset => Reset,
		Clock => Clock
	);
	
	be : BitError port map (
		Clock => Clock, 
		Reset => Reset,
		Codeword_in => s_output,
		Codeword_out => s_output_with_error
	);
	
	vd : ViterbiDecoder port map (
		ParityIn => s_output_with_error,
		Output => Decoder_Out,
		Output_Valid => Decoder_Out_Valid,
		Reset => Reset,
		Clock => Clock
	);
	
end comb;