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

-- (2,1,4 ViterbiDecoder)
entity ViterbiDecoder is
	Generic (
	   CONSTRAINT_LENGTH: integer := 4;
		TIME_WINDOW : integer := 7;
		TOTAL_PARITY_BITS : integer := 2;
		TOTAL_PATHS : integer := 128;
		IS_THERE_BIT_ERROR : std_logic := '0';
		BIT_ERROR_POSITION : integer := 0
    );
	Port (
		ParityIn : in std_logic_vector ( TOTAL_PARITY_BITS-1 downto 0);
		Output: out std_logic_vector(0 to TIME_WINDOW-1);
		Output_Valid : out std_logic;
		Reset : in std_logic;
		Clock : in std_logic
	);
end entity ViterbiDecoder;

architecture Behavioral of ViterbiDecoder is
	--States for the decoder 
	type state is (s000, s001, s010, s011, s100, s101, s110, s111); --idle: Noninitialized
	signal starting_state : state := s000;
	
	type path is array (0 to TIME_WINDOW-1) of std_logic_vector(TOTAL_PARITY_BITS-1 downto 0);
	type paths is array (0 to TOTAL_PATHS-1) of path;
	
	type path_metrics is array (0 to TOTAL_PATHS-1) of integer;
	signal path_metric : path_metrics := (others => 0);
	
	signal sig_min_path_idx : integer := TOTAL_PATHS;
	signal sig_input_buffer : path := (others => "00");
	
	
	signal path_out : path := (others => "00");
	
	--constant path_reg : paths :=(others => (others => "11"));
	constant path_reg : paths :=(("00","00","00","00","00","00","00"),
										("00","00","00","00","00","00","11"),
										("00","00","00","00","00","11","11"),
										("00","00","00","00","00","11","00"),
										("00","00","00","00","11","11","10"),
										("00","00","00","00","11","11","01"),
										("00","00","00","00","11","00","01"),
										("00","00","00","00","11","00","10"),
										("00","00","00","11","11","10","11"),
										("00","00","00","11","11","10","00"),

										("00","00","00","11","11","01","00"),
										("00","00","00","11","11","01","11"),
										("00","00","00","11","00","01","01"),
										("00","00","00","11","00","01","10"),
										("00","00","00","11","00","10","10"),
										("00","00","00","11","00","10","01"),
										("00","00","11","11","10","11","00"),
										("00","00","11","11","10","11","11"),
										("00","00","11","11","10","00","11"),
										("00","00","11","11","10","00","00"),
										("00","00","11","11","01","00","10"),
										("00","00","11","11","01","00","01"),
										("00","00","11","11","01","11","01"),
										("00","00","11","11","01","11","10"),

										("00","00","11","00","01","01","11"),
										("00","00","11","00","01","01","00"),
										("00","00","11","00","01","10","00"),
										("00","00","11","00","01","10","11"),
										("00","00","11","00","10","10","01"),
										("00","00","11","00","10","10","10"),
										("00","00","11","00","10","01","10"),
										("00","00","11","00","10","01","01"),
										("00","11","11","10","11","00","00"),
										("00","11","11","10","11","00","11"),
										("00","11","11","10","11","11","11"),
										("00","11","11","10","11","11","00"),
										("00","11","11","10","00","11","10"),
										("00","11","11","10","00","11","01"),

										("00","11","11","10","00","00","01"),
										("00","11","11","10","00","00","10"),
										("00","11","11","01","00","10","11"),
										("00","11","11","01","00","10","00"),
										("00","11","11","01","00","01","00"),
										("00","11","11","01","00","01","11"),
										("00","11","11","01","11","01","01"),
										("00","11","11","01","11","01","10"),
										("00","11","11","01","11","10","10"),
										("00","11","11","01","11","10","01"),
										("00","11","00","01","01","11","00"),
										("00","11","00","01","01","11","11"),
										("00","11","00","01","01","00","11"),
										("00","11","00","01","01","00","00"),

										("00","11","00","01","10","00","10"),
										("00","11","00","01","10","00","01"),
										("00","11","00","01","10","11","01"),
										("00","11","00","01","10","11","10"),
										("00","11","00","10","10","01","11"),
										("00","11","00","10","10","01","00"),
										("00","11","00","10","10","10","00"),
										("00","11","00","10","10","10","11"),
										("00","11","00","10","01","10","01"),
										("00","11","00","10","01","10","10"),
										("00","11","00","10","01","01","10"),
										("00","11","00","10","01","01","01"),
										("11","11","10","11","00","00","00"),
										("11","11","10","11","00","00","11"),

										("11","11","10","11","00","11","11"),
										("11","11","10","11","00","11","00"),
										("11","11","10","11","11","11","10"),
										("11","11","10","11","11","11","01"),
										("11","11","10","11","11","00","01"),
										("11","11","10","11","11","00","10"),
										("11","11","10","00","11","10","11"),
										("11","11","10","00","11","10","00"),
										("11","11","10","00","11","01","00"),
										("11","11","10","00","11","01","11"),
										("11","11","10","00","00","01","01"),
										("11","11","10","00","00","01","10"),
										("11","11","10","00","00","10","10"),
										("11","11","10","00","00","10","01"),

										("11","11","01","00","10","11","00"),
										("11","11","01","00","10","11","11"),
										("11","11","01","00","10","00","11"),
										("11","11","01","00","10","00","00"),
										("11","11","01","00","01","00","10"),
										("11","11","01","00","01","00","01"),
										("11","11","01","00","01","11","01"),
										("11","11","01","00","01","11","10"),
										("11","11","01","11","01","01","11"),
										("11","11","01","11","01","01","00"),
										("11","11","01","11","01","10","00"),
										("11","11","01","11","01","10","11"),
										("11","11","01","11","10","10","01"),
										("11","11","01","11","10","10","10"),

										("11","11","01","11","10","01","10"),
										("11","11","01","11","10","01","01"),
										("11","00","01","01","11","00","00"),
										("11","00","01","01","11","00","11"),
										("11","00","01","01","11","11","11"),
										("11","00","01","01","11","11","00"),
										("11","00","01","01","00","11","10"),
										("11","00","01","01","00","11","01"),
										("11","00","01","01","00","00","01"),
										("11","00","01","01","00","00","10"),
										("11","00","01","10","00","10","11"),
										("11","00","01","10","00","10","00"),
										("11","00","01","10","00","01","00"),
										("11","00","01","10","00","01","11"),

										("11","00","01","10","11","01","01"),
										("11","00","01","10","11","01","10"),
										("11","00","01","10","11","10","10"),
										("11","00","01","10","11","10","01"),
										("11","00","10","10","01","11","00"),
										("11","00","10","10","01","11","11"),
										("11","00","10","10","01","00","11"),
										("11","00","10","10","01","00","00"),
										("11","00","10","10","10","00","10"),
										("11","00","10","10","10","00","01"),
										("11","00","10","10","10","11","01"),
										("11","00","10","10","10","11","10"),
										("11","00","10","01","10","01","11"),
										("11","00","10","01","10","01","00"),

										("11","00","10","01","10","10","00"),
										("11","00","10","01","10","10","11"),
										("11","00","10","01","01","10","01"),
										("11","00","10","01","01","10","10"),
										("11","00","10","01","01","01","10"),
										("11","00","10","01","01","01","01"));

	
	function FuncHammingDistance (x : std_logic_vector(TOTAL_PARITY_BITS-1 downto 0);
											y : std_logic_vector(TOTAL_PARITY_BITS-1 downto 0))
											return integer is
		variable d : integer := 0;
	begin
		for i in x'range loop
			if ( x(i) /= y(i) )then
				d := d + 1;
			end if;
		end loop;
		return d;
	end FuncHammingDistance;
	
	function FuncSelectMinPathIndex (path_metric : path_metrics) return integer is
		variable min_idx : integer := 0;
		variable min_pm : integer := path_metric(0); -- Assign a value to avoid garbage
	begin
		for j in 0 to TOTAL_PATHS-1 loop
			if (path_metric(j) < min_pm)then
				min_pm := path_metric(j);
				min_idx := j;
			end if;
		end loop;
		return min_idx;
	end FuncSelectMinPathIndex;
	
	function FuncCalculatePathMetric (path_index : integer;
												 input_buffer : path)
												return integer is
		variable output : integer := 0;
	begin
		for x in 0 to TIME_WINDOW-1 loop
			output := output + FuncHammingDistance(path_reg(path_index)(x), input_buffer(x));
		end loop;
		return output;
	end FuncCalculatePathMetric;
	
	function FuncGetOutputBitFromPath (current_state : state;
													   codeword : std_logic_vector(TOTAL_PARITY_BITS-1 downto 0) )
														return std_logic is
	begin
		case current_state is
			when s000 =>
				if (codeword = "00") then
					return '0';
				else
					return '1';
				end if;
			when s001 =>
				if (codeword = "11")then
					return '0';
				else
					return '1';
				end if;
			when s010 =>
				if (codeword = "10")then
					return '0';
				else
					return '1';
				end if;
			when s011 =>
				if (codeword = "01")then
					return '0';
				else
					return '1';
				end if;
			when s100 =>
				if (codeword = "11")then
					return '0';
				else
					return '1';
				end if;
			when s101 =>
				if(codeword = "00")then
					return '0';
				else
					return '1';
				end if;
			when s110 =>
				if(codeword = "01")then
					return '0';
				else
					return '1';
				end if;
			when s111 =>
				if (codeword = "10")then
					return '0';
				else
					return '1';
				end if;
			when others => null;
		end case;
	end FuncGetOutputBitFromPath;
	
	function FuncGetNextStateFromPath (current_state : state;
												  codeword : std_logic_vector(TOTAL_PARITY_BITS-1 downto 0) )
														return state is
	begin
		case current_state is
			when s000 =>
				if (codeword = "00") then
					return s000;
				else
					return s100;
				end if;
			when s001 =>
				if (codeword = "11")then
					return s000;
				else
					return s100;
				end if;
			when s010 =>
				if (codeword = "10")then
					return s001;
				else
					return s101;
				end if;
			when s011 =>
				if (codeword = "01")then
					return s001;
				else
					return s101;
				end if;
			when s100 =>
				if (codeword = "11")then
					return s010;
				else
					return s110;
				end if;
			when s101 =>
				if(codeword = "00")then
					return s010;
				else
					return s110;
				end if;
			when s110 =>
				if(codeword = "01")then
					return s011;
				else
					return s111;
				end if;
			when s111 =>
				if (codeword = "10")then
					return s011;
				else
					return s111;
				end if;
			when others => null;
		end case;
	end FuncGetNextStateFromPath;
	
	function FuncGenerateOutputFromPath (pathx : path) return std_logic_vector is
		variable next_state : state := s000;
		variable  out_buf : std_logic_vector(0 to TIME_WINDOW-1);
	begin
		for n in 0 to TIME_WINDOW-1 loop
			out_buf(n) := FuncGetOutputBitFromPath(next_state, pathx(n));
			
			next_state := FuncGetNextStateFromPath(next_state, pathx(n));
		end loop;
		return out_buf;
	end FuncGenerateOutputFromPath;

begin

	process	(Clock, Reset, ParityIn) is 
		variable t: integer := 0;
		variable path_index: integer := 0;
		variable pm_calc_done: std_logic := '0'; --PM Calculation done signal
		variable input_buffer : path := (others => "00");
		variable min_path_idx : integer := TOTAL_PATHS;
		variable decoder_out : std_logic_vector(0 to TIME_WINDOW-1) := (others => '0');
		variable min_select_done : std_logic := '0';
		variable Output_valid_flag : std_logic := '0';
		variable first_time_execution : std_logic := '1';
	begin
		if	( Reset = '1' ) then --Asynchronous Reset
			t := 0;
			path_metric <= (others => 0);
			input_buffer := (others => "00");
			Output_valid_flag := '0';
			path_out <= (others => "00");
			pm_calc_done := '0';
		else
			if	(Clock'EVENT and Clock = '1') then --Rising edge					
				if (t = TIME_WINDOW) then --Calculate path metric, select path, output
					sig_input_buffer <= input_buffer; --Just for seeing in simulation
					if(IS_THERE_BIT_ERROR = '1' and first_time_execution='1')then
						input_buffer(BIT_ERROR_POSITION) := input_buffer(BIT_ERROR_POSITION)(1) & (not input_buffer(BIT_ERROR_POSITION)(0));
						first_time_execution := '0';
						sig_input_buffer <= input_buffer;
					end if;
					for path_index in 0 to TOTAL_PATHS-1 loop --Calculate path metric for every possible path
						path_metric(path_index) <= FuncCalculatePathMetric(path_index, input_buffer);
						if(path_index = TOTAL_PATHS-1) then
							pm_calc_done := '1';
						end if;
					end loop;
					if(pm_calc_done = '1') then
						min_path_idx := FuncSelectMinPathIndex(path_metric); -- If the PM calculation is done, select the min path index
						sig_min_path_idx <= min_path_idx;
						pm_calc_done := '0';
						min_select_done := '1';
					end if;
					if(min_select_done = '1')then
						decoder_out := FuncGenerateOutputFromPath(path_reg(min_path_idx)); -- Generate output bits from resulting path using truth table of encoder.
						min_select_done := '0';
						if (decoder_out /= "0000000")then
							Output_valid_flag := '1';
						end if;
					end if;
				else
					input_buffer(t) :=  ParityIn; --Add the input to input_buffer
					t := t + 1; -- Increase the time variable by 1
				end if;
			end if;
		end if;
		Output_Valid <= Output_valid_flag;
		Output <= decoder_out;
	end process;
end architecture;