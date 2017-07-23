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

entity BitError is 
	Port (
		Clock : in std_logic;
		Reset : in std_logic;
		Codeword_in : in std_logic_vector(1 downto 0);
		Codeword_out : out std_logic_vector(1 downto 0)
	);
end entity BitError;

architecture RTL of BitError is
	signal done_flag : std_logic := '0';
	signal Codeword_out_buf : std_logic_vector(1 downto 0);
	signal clock_counter : integer := 0;
	signal done : std_logic := '0';
	signal output_buf : std_logic_vector(1 downto 0);
begin
	with Codeword_in select Codeword_out <=
		(not Codeword_in(1)) & Codeword_in(0)   when "00",
		Codeword_in when others;
--	process(Clock,Reset)is begin
--		if(rising_edge(Clock))then
--			clock_counter <= clock_counter + 1;
--			if(clock_counter = 3)then
--				output_buf <= (not Codeword_in(1)) & Codeword_in(0);
--				--clock_counter <= 0;
--				done <= '1';
--			else
--				output_buf <= Codeword_in;
--			end if;
--		end if;
--	end process;
--	Codeword_out <= output_buf;

end architecture RTL;