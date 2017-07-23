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
use IEEE.NUMERIC_STD.ALL;

entity ViterbiEncoder is
	Port (
		Input : in std_logic;
		Output: out std_logic_vector (1 downto 0);
		Reset : in std_logic;
		Clock : in std_logic
	);
end entity ViterbiEncoder;

architecture RTL of ViterbiEncoder is
	signal MEMORY : std_logic_vector (2 downto 0) := "000";
	signal V1 : std_logic;
	signal V2 : std_logic;
begin
	ShiftRegister: 
		process (Clock, Reset) is begin
			if (rising_edge(Clock)) then	 --Synchronous Reset
				if (Reset = '1') then
					MEMORY <= (others => '0');
				else
					MEMORY(0) <= MEMORY(1);
					MEMORY(1) <= MEMORY(2);
					MEMORY(2) <=  Input;
				end if;
			end if;
		end process;
		-- In order not to miss any parity value on clocks, these are asynchronous,
		-- To test the Viterbi Encoder, these can be made synchronous
		V1 <= (Input xor MEMORY(2) xor MEMORY(1) xor MEMORY(0));
		V2 <= (Input xor MEMORY(2) xor MEMORY(0));
		Output(0) <= V2;
		Output(1) <= V1;
end architecture;

