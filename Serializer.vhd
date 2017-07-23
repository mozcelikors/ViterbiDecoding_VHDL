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

entity Serializer is 
	Port (
		Input : in std_logic_vector (6 downto 0);
		Input_valid : in std_logic;
		Clock : in std_logic;
		Output : out std_logic
	);
end entity Serializer;

architecture behavioral_ser of Serializer is 
	signal k : integer := 7;
begin
	process(Clock,Input_valid)is 
		variable start_serializing : std_logic := '0';
		
	begin
		if(Clock'EVENT and Clock='1')then
			if(Input_valid = '1')then
				if(k>0)then
					k <= k - 1;
				else
					k <= 0;
				end if;
			end if;
		end if;
	end process;
	Output <= Input(k);
end behavioral_ser;