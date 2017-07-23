-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 243 01/31/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/18/2016 13:35:21"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ViterbiDecoder IS
    PORT (
	ParityIn : IN std_logic_vector(1 DOWNTO 0);
	Output : OUT std_logic_vector(6 DOWNTO 0);
	Output_Valid : OUT std_logic;
	Reset : IN std_logic;
	Clock : IN std_logic
	);
END ViterbiDecoder;

-- Design Ports Information
-- Output[0]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[1]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[2]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[3]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[4]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[5]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output[6]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_Valid	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ParityIn[1]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ParityIn[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ViterbiDecoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ParityIn : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Output : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Output_Valid : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add13~6_combout\ : std_logic;
SIGNAL \Add13~30_combout\ : std_logic;
SIGNAL \Add13~38_combout\ : std_logic;
SIGNAL \Add13~44_combout\ : std_logic;
SIGNAL \Add13~54_combout\ : std_logic;
SIGNAL \Add13~61\ : std_logic;
SIGNAL \Add13~62_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \t~0_combout\ : std_logic;
SIGNAL \ParityIn[1]~input_o\ : std_logic;
SIGNAL \ParityIn[0]~input_o\ : std_logic;
SIGNAL \Output[0]~output_o\ : std_logic;
SIGNAL \Output[1]~output_o\ : std_logic;
SIGNAL \Output[2]~output_o\ : std_logic;
SIGNAL \Output[3]~output_o\ : std_logic;
SIGNAL \Output[4]~output_o\ : std_logic;
SIGNAL \Output[5]~output_o\ : std_logic;
SIGNAL \Output[6]~output_o\ : std_logic;
SIGNAL \Output_Valid~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \decoder_out[0]~feeder_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Add13~0_combout\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add13~1\ : std_logic;
SIGNAL \Add13~2_combout\ : std_logic;
SIGNAL \Add13~3\ : std_logic;
SIGNAL \Add13~4_combout\ : std_logic;
SIGNAL \Add13~5\ : std_logic;
SIGNAL \Add13~7\ : std_logic;
SIGNAL \Add13~8_combout\ : std_logic;
SIGNAL \Add13~9\ : std_logic;
SIGNAL \Add13~11\ : std_logic;
SIGNAL \Add13~12_combout\ : std_logic;
SIGNAL \Add13~10_combout\ : std_logic;
SIGNAL \Add13~13\ : std_logic;
SIGNAL \Add13~14_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Add13~15\ : std_logic;
SIGNAL \Add13~16_combout\ : std_logic;
SIGNAL \Add13~17\ : std_logic;
SIGNAL \Add13~18_combout\ : std_logic;
SIGNAL \Add13~19\ : std_logic;
SIGNAL \Add13~20_combout\ : std_logic;
SIGNAL \Add13~21\ : std_logic;
SIGNAL \Add13~22_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Add13~23\ : std_logic;
SIGNAL \Add13~24_combout\ : std_logic;
SIGNAL \Add13~25\ : std_logic;
SIGNAL \Add13~27\ : std_logic;
SIGNAL \Add13~28_combout\ : std_logic;
SIGNAL \Add13~26_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Add13~29\ : std_logic;
SIGNAL \Add13~31\ : std_logic;
SIGNAL \Add13~32_combout\ : std_logic;
SIGNAL \Add13~33\ : std_logic;
SIGNAL \Add13~34_combout\ : std_logic;
SIGNAL \Add13~35\ : std_logic;
SIGNAL \Add13~36_combout\ : std_logic;
SIGNAL \Add13~37\ : std_logic;
SIGNAL \Add13~39\ : std_logic;
SIGNAL \Add13~40_combout\ : std_logic;
SIGNAL \Add13~41\ : std_logic;
SIGNAL \Add13~43\ : std_logic;
SIGNAL \Add13~45\ : std_logic;
SIGNAL \Add13~46_combout\ : std_logic;
SIGNAL \Add13~47\ : std_logic;
SIGNAL \Add13~48_combout\ : std_logic;
SIGNAL \Add13~49\ : std_logic;
SIGNAL \Add13~50_combout\ : std_logic;
SIGNAL \Add13~51\ : std_logic;
SIGNAL \Add13~52_combout\ : std_logic;
SIGNAL \Add13~53\ : std_logic;
SIGNAL \Add13~55\ : std_logic;
SIGNAL \Add13~56_combout\ : std_logic;
SIGNAL \Add13~57\ : std_logic;
SIGNAL \Add13~59\ : std_logic;
SIGNAL \Add13~60_combout\ : std_logic;
SIGNAL \Add13~58_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Add13~42_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \min_path_idx[7]~0_combout\ : std_logic;
SIGNAL \decoder_out[0]~0_combout\ : std_logic;
SIGNAL \decoder_out[2]~feeder_combout\ : std_logic;
SIGNAL \decoder_out[3]~feeder_combout\ : std_logic;
SIGNAL \decoder_out[4]~feeder_combout\ : std_logic;
SIGNAL \decoder_out[5]~feeder_combout\ : std_logic;
SIGNAL \decoder_out[6]~feeder_combout\ : std_logic;
SIGNAL \Output_Valid~0_combout\ : std_logic;
SIGNAL \Output_Valid~reg0_q\ : std_logic;
SIGNAL t : std_logic_vector(31 DOWNTO 0);
SIGNAL min_path_idx : std_logic_vector(31 DOWNTO 0);
SIGNAL decoder_out : std_logic_vector(6 DOWNTO 0);
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_ParityIn <= ParityIn;
Output <= ww_Output;
Output_Valid <= ww_Output_Valid;
ww_Reset <= Reset;
ww_Clock <= Clock;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;

-- Location: LCCOMB_X3_Y4_N6
\Add13~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~6_combout\ = (t(3) & (!\Add13~5\)) # (!t(3) & ((\Add13~5\) # (GND)))
-- \Add13~7\ = CARRY((!\Add13~5\) # (!t(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(3),
	datad => VCC,
	cin => \Add13~5\,
	combout => \Add13~6_combout\,
	cout => \Add13~7\);

-- Location: LCCOMB_X3_Y4_N30
\Add13~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~30_combout\ = (t(15) & (!\Add13~29\)) # (!t(15) & ((\Add13~29\) # (GND)))
-- \Add13~31\ = CARRY((!\Add13~29\) # (!t(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(15),
	datad => VCC,
	cin => \Add13~29\,
	combout => \Add13~30_combout\,
	cout => \Add13~31\);

-- Location: LCCOMB_X3_Y3_N6
\Add13~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~38_combout\ = (t(19) & (!\Add13~37\)) # (!t(19) & ((\Add13~37\) # (GND)))
-- \Add13~39\ = CARRY((!\Add13~37\) # (!t(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(19),
	datad => VCC,
	cin => \Add13~37\,
	combout => \Add13~38_combout\,
	cout => \Add13~39\);

-- Location: LCCOMB_X3_Y3_N12
\Add13~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~44_combout\ = (t(22) & (\Add13~43\ $ (GND))) # (!t(22) & (!\Add13~43\ & VCC))
-- \Add13~45\ = CARRY((t(22) & !\Add13~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(22),
	datad => VCC,
	cin => \Add13~43\,
	combout => \Add13~44_combout\,
	cout => \Add13~45\);

-- Location: LCCOMB_X3_Y3_N22
\Add13~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~54_combout\ = (t(27) & (!\Add13~53\)) # (!t(27) & ((\Add13~53\) # (GND)))
-- \Add13~55\ = CARRY((!\Add13~53\) # (!t(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(27),
	datad => VCC,
	cin => \Add13~53\,
	combout => \Add13~54_combout\,
	cout => \Add13~55\);

-- Location: LCCOMB_X3_Y3_N28
\Add13~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~60_combout\ = (t(30) & (\Add13~59\ $ (GND))) # (!t(30) & (!\Add13~59\ & VCC))
-- \Add13~61\ = CARRY((t(30) & !\Add13~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(30),
	datad => VCC,
	cin => \Add13~59\,
	combout => \Add13~60_combout\,
	cout => \Add13~61\);

-- Location: LCCOMB_X3_Y3_N30
\Add13~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~62_combout\ = t(31) $ (\Add13~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(31),
	cin => \Add13~61\,
	combout => \Add13~62_combout\);

-- Location: FF_X3_Y3_N31
\t[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~62_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(31));

-- Location: FF_X3_Y3_N23
\t[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~54_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(27));

-- Location: LCCOMB_X2_Y3_N30
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!t(26) & (!t(24) & (!t(27) & !t(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(26),
	datab => t(24),
	datac => t(27),
	datad => t(25),
	combout => \Equal0~1_combout\);

-- Location: FF_X3_Y3_N13
\t[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~44_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(22));

-- Location: FF_X3_Y3_N7
\t[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~38_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(19));

-- Location: FF_X3_Y4_N31
\t[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~30_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(15));

-- Location: FF_X4_Y4_N21
\t[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \t~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(3));

-- Location: LCCOMB_X4_Y4_N22
\Equal0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (t(0) & (!t(3) & (t(2) & t(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(0),
	datab => t(3),
	datac => t(2),
	datad => t(1),
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X4_Y4_N20
\t~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \t~0_combout\ = (\Add13~6_combout\ & !\Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add13~6_combout\,
	datad => \Equal0~10_combout\,
	combout => \t~0_combout\);

-- Location: IOOBUF_X0_Y4_N16
\Output[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(0),
	devoe => ww_devoe,
	o => \Output[0]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\Output[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Output[1]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\Output[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(2),
	devoe => ww_devoe,
	o => \Output[2]~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\Output[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(3),
	devoe => ww_devoe,
	o => \Output[3]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\Output[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(4),
	devoe => ww_devoe,
	o => \Output[4]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\Output[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(5),
	devoe => ww_devoe,
	o => \Output[5]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\Output[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => decoder_out(6),
	devoe => ww_devoe,
	o => \Output[6]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\Output_Valid~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Output_Valid~reg0_q\,
	devoe => ww_devoe,
	o => \Output_Valid~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\Clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G4
\Clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X2_Y4_N16
\decoder_out[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[0]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[0]~feeder_combout\);

-- Location: IOIBUF_X0_Y14_N8
\Reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: LCCOMB_X3_Y4_N0
\Add13~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~0_combout\ = t(0) $ (VCC)
-- \Add13~1\ = CARRY(t(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => t(0),
	datad => VCC,
	combout => \Add13~0_combout\,
	cout => \Add13~1\);

-- Location: CLKCTRL_G2
\Reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X3_Y4_N1
\t[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(0));

-- Location: LCCOMB_X3_Y4_N2
\Add13~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~2_combout\ = (t(1) & (!\Add13~1\)) # (!t(1) & ((\Add13~1\) # (GND)))
-- \Add13~3\ = CARRY((!\Add13~1\) # (!t(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(1),
	datad => VCC,
	cin => \Add13~1\,
	combout => \Add13~2_combout\,
	cout => \Add13~3\);

-- Location: FF_X3_Y4_N3
\t[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~2_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(1));

-- Location: LCCOMB_X3_Y4_N4
\Add13~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~4_combout\ = (t(2) & (\Add13~3\ $ (GND))) # (!t(2) & (!\Add13~3\ & VCC))
-- \Add13~5\ = CARRY((t(2) & !\Add13~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(2),
	datad => VCC,
	cin => \Add13~3\,
	combout => \Add13~4_combout\,
	cout => \Add13~5\);

-- Location: FF_X3_Y4_N5
\t[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~4_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(2));

-- Location: LCCOMB_X3_Y4_N8
\Add13~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~8_combout\ = (t(4) & (\Add13~7\ $ (GND))) # (!t(4) & (!\Add13~7\ & VCC))
-- \Add13~9\ = CARRY((t(4) & !\Add13~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(4),
	datad => VCC,
	cin => \Add13~7\,
	combout => \Add13~8_combout\,
	cout => \Add13~9\);

-- Location: FF_X3_Y4_N9
\t[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~8_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(4));

-- Location: LCCOMB_X3_Y4_N10
\Add13~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~10_combout\ = (t(5) & (!\Add13~9\)) # (!t(5) & ((\Add13~9\) # (GND)))
-- \Add13~11\ = CARRY((!\Add13~9\) # (!t(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(5),
	datad => VCC,
	cin => \Add13~9\,
	combout => \Add13~10_combout\,
	cout => \Add13~11\);

-- Location: LCCOMB_X3_Y4_N12
\Add13~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~12_combout\ = (t(6) & (\Add13~11\ $ (GND))) # (!t(6) & (!\Add13~11\ & VCC))
-- \Add13~13\ = CARRY((t(6) & !\Add13~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(6),
	datad => VCC,
	cin => \Add13~11\,
	combout => \Add13~12_combout\,
	cout => \Add13~13\);

-- Location: FF_X3_Y4_N13
\t[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~12_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(6));

-- Location: FF_X3_Y4_N11
\t[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~10_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(5));

-- Location: LCCOMB_X3_Y4_N14
\Add13~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~14_combout\ = (t(7) & (!\Add13~13\)) # (!t(7) & ((\Add13~13\) # (GND)))
-- \Add13~15\ = CARRY((!\Add13~13\) # (!t(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(7),
	datad => VCC,
	cin => \Add13~13\,
	combout => \Add13~14_combout\,
	cout => \Add13~15\);

-- Location: FF_X3_Y4_N15
\t[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~14_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(7));

-- Location: LCCOMB_X2_Y4_N28
\Equal0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!t(4) & (!t(6) & (!t(5) & !t(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(4),
	datab => t(6),
	datac => t(5),
	datad => t(7),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X3_Y4_N16
\Add13~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~16_combout\ = (t(8) & (\Add13~15\ $ (GND))) # (!t(8) & (!\Add13~15\ & VCC))
-- \Add13~17\ = CARRY((t(8) & !\Add13~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(8),
	datad => VCC,
	cin => \Add13~15\,
	combout => \Add13~16_combout\,
	cout => \Add13~17\);

-- Location: FF_X3_Y4_N17
\t[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~16_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(8));

-- Location: LCCOMB_X3_Y4_N18
\Add13~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~18_combout\ = (t(9) & (!\Add13~17\)) # (!t(9) & ((\Add13~17\) # (GND)))
-- \Add13~19\ = CARRY((!\Add13~17\) # (!t(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(9),
	datad => VCC,
	cin => \Add13~17\,
	combout => \Add13~18_combout\,
	cout => \Add13~19\);

-- Location: FF_X3_Y4_N19
\t[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~18_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(9));

-- Location: LCCOMB_X3_Y4_N20
\Add13~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~20_combout\ = (t(10) & (\Add13~19\ $ (GND))) # (!t(10) & (!\Add13~19\ & VCC))
-- \Add13~21\ = CARRY((t(10) & !\Add13~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(10),
	datad => VCC,
	cin => \Add13~19\,
	combout => \Add13~20_combout\,
	cout => \Add13~21\);

-- Location: FF_X3_Y4_N21
\t[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~20_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(10));

-- Location: LCCOMB_X3_Y4_N22
\Add13~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~22_combout\ = (t(11) & (!\Add13~21\)) # (!t(11) & ((\Add13~21\) # (GND)))
-- \Add13~23\ = CARRY((!\Add13~21\) # (!t(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(11),
	datad => VCC,
	cin => \Add13~21\,
	combout => \Add13~22_combout\,
	cout => \Add13~23\);

-- Location: FF_X3_Y4_N23
\t[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~22_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(11));

-- Location: LCCOMB_X2_Y4_N8
\Equal0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!t(10) & !t(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => t(10),
	datad => t(11),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X3_Y4_N24
\Add13~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~24_combout\ = (t(12) & (\Add13~23\ $ (GND))) # (!t(12) & (!\Add13~23\ & VCC))
-- \Add13~25\ = CARRY((t(12) & !\Add13~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(12),
	datad => VCC,
	cin => \Add13~23\,
	combout => \Add13~24_combout\,
	cout => \Add13~25\);

-- Location: FF_X3_Y4_N25
\t[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~24_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(12));

-- Location: LCCOMB_X3_Y4_N26
\Add13~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~26_combout\ = (t(13) & (!\Add13~25\)) # (!t(13) & ((\Add13~25\) # (GND)))
-- \Add13~27\ = CARRY((!\Add13~25\) # (!t(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(13),
	datad => VCC,
	cin => \Add13~25\,
	combout => \Add13~26_combout\,
	cout => \Add13~27\);

-- Location: LCCOMB_X3_Y4_N28
\Add13~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~28_combout\ = (t(14) & (\Add13~27\ $ (GND))) # (!t(14) & (!\Add13~27\ & VCC))
-- \Add13~29\ = CARRY((t(14) & !\Add13~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(14),
	datad => VCC,
	cin => \Add13~27\,
	combout => \Add13~28_combout\,
	cout => \Add13~29\);

-- Location: FF_X3_Y4_N29
\t[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~28_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(14));

-- Location: FF_X3_Y4_N27
\t[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~26_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(13));

-- Location: LCCOMB_X2_Y4_N18
\Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!t(15) & (!t(14) & (!t(13) & !t(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(15),
	datab => t(14),
	datac => t(13),
	datad => t(12),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X2_Y4_N22
\Equal0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!t(8) & (!t(9) & (\Equal0~6_combout\ & \Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(8),
	datab => t(9),
	datac => \Equal0~6_combout\,
	datad => \Equal0~5_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X3_Y3_N0
\Add13~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~32_combout\ = (t(16) & (\Add13~31\ $ (GND))) # (!t(16) & (!\Add13~31\ & VCC))
-- \Add13~33\ = CARRY((t(16) & !\Add13~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(16),
	datad => VCC,
	cin => \Add13~31\,
	combout => \Add13~32_combout\,
	cout => \Add13~33\);

-- Location: FF_X3_Y3_N1
\t[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~32_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(16));

-- Location: LCCOMB_X3_Y3_N2
\Add13~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~34_combout\ = (t(17) & (!\Add13~33\)) # (!t(17) & ((\Add13~33\) # (GND)))
-- \Add13~35\ = CARRY((!\Add13~33\) # (!t(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(17),
	datad => VCC,
	cin => \Add13~33\,
	combout => \Add13~34_combout\,
	cout => \Add13~35\);

-- Location: FF_X3_Y3_N3
\t[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~34_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(17));

-- Location: LCCOMB_X3_Y3_N4
\Add13~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~36_combout\ = (t(18) & (\Add13~35\ $ (GND))) # (!t(18) & (!\Add13~35\ & VCC))
-- \Add13~37\ = CARRY((t(18) & !\Add13~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(18),
	datad => VCC,
	cin => \Add13~35\,
	combout => \Add13~36_combout\,
	cout => \Add13~37\);

-- Location: FF_X3_Y3_N5
\t[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~36_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(18));

-- Location: LCCOMB_X3_Y3_N8
\Add13~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~40_combout\ = (t(20) & (\Add13~39\ $ (GND))) # (!t(20) & (!\Add13~39\ & VCC))
-- \Add13~41\ = CARRY((t(20) & !\Add13~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(20),
	datad => VCC,
	cin => \Add13~39\,
	combout => \Add13~40_combout\,
	cout => \Add13~41\);

-- Location: FF_X3_Y3_N9
\t[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~40_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(20));

-- Location: LCCOMB_X3_Y3_N10
\Add13~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~42_combout\ = (t(21) & (!\Add13~41\)) # (!t(21) & ((\Add13~41\) # (GND)))
-- \Add13~43\ = CARRY((!\Add13~41\) # (!t(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(21),
	datad => VCC,
	cin => \Add13~41\,
	combout => \Add13~42_combout\,
	cout => \Add13~43\);

-- Location: LCCOMB_X3_Y3_N14
\Add13~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~46_combout\ = (t(23) & (!\Add13~45\)) # (!t(23) & ((\Add13~45\) # (GND)))
-- \Add13~47\ = CARRY((!\Add13~45\) # (!t(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(23),
	datad => VCC,
	cin => \Add13~45\,
	combout => \Add13~46_combout\,
	cout => \Add13~47\);

-- Location: FF_X3_Y3_N15
\t[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~46_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(23));

-- Location: LCCOMB_X3_Y3_N16
\Add13~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~48_combout\ = (t(24) & (\Add13~47\ $ (GND))) # (!t(24) & (!\Add13~47\ & VCC))
-- \Add13~49\ = CARRY((t(24) & !\Add13~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(24),
	datad => VCC,
	cin => \Add13~47\,
	combout => \Add13~48_combout\,
	cout => \Add13~49\);

-- Location: FF_X3_Y3_N17
\t[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~48_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(24));

-- Location: LCCOMB_X3_Y3_N18
\Add13~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~50_combout\ = (t(25) & (!\Add13~49\)) # (!t(25) & ((\Add13~49\) # (GND)))
-- \Add13~51\ = CARRY((!\Add13~49\) # (!t(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(25),
	datad => VCC,
	cin => \Add13~49\,
	combout => \Add13~50_combout\,
	cout => \Add13~51\);

-- Location: FF_X3_Y3_N19
\t[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~50_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(25));

-- Location: LCCOMB_X3_Y3_N20
\Add13~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~52_combout\ = (t(26) & (\Add13~51\ $ (GND))) # (!t(26) & (!\Add13~51\ & VCC))
-- \Add13~53\ = CARRY((t(26) & !\Add13~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(26),
	datad => VCC,
	cin => \Add13~51\,
	combout => \Add13~52_combout\,
	cout => \Add13~53\);

-- Location: FF_X3_Y3_N21
\t[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~52_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(26));

-- Location: LCCOMB_X3_Y3_N24
\Add13~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~56_combout\ = (t(28) & (\Add13~55\ $ (GND))) # (!t(28) & (!\Add13~55\ & VCC))
-- \Add13~57\ = CARRY((t(28) & !\Add13~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => t(28),
	datad => VCC,
	cin => \Add13~55\,
	combout => \Add13~56_combout\,
	cout => \Add13~57\);

-- Location: FF_X3_Y3_N25
\t[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~56_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(28));

-- Location: LCCOMB_X3_Y3_N26
\Add13~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add13~58_combout\ = (t(29) & (!\Add13~57\)) # (!t(29) & ((\Add13~57\) # (GND)))
-- \Add13~59\ = CARRY((!\Add13~57\) # (!t(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => t(29),
	datad => VCC,
	cin => \Add13~57\,
	combout => \Add13~58_combout\,
	cout => \Add13~59\);

-- Location: FF_X3_Y3_N29
\t[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~60_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(30));

-- Location: FF_X3_Y3_N27
\t[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~58_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(29));

-- Location: LCCOMB_X2_Y3_N0
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!t(31) & (!t(30) & (!t(28) & !t(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(31),
	datab => t(30),
	datac => t(28),
	datad => t(29),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X2_Y3_N10
\Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!t(19) & (!t(16) & (!t(17) & !t(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(19),
	datab => t(16),
	datac => t(17),
	datad => t(18),
	combout => \Equal0~3_combout\);

-- Location: FF_X3_Y3_N11
\t[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Add13~42_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => t(21));

-- Location: LCCOMB_X2_Y3_N8
\Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!t(22) & (!t(23) & (!t(21) & !t(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => t(22),
	datab => t(23),
	datac => t(21),
	datad => t(20),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X2_Y4_N24
\Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\Equal0~3_combout\ & \Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~3_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X2_Y4_N10
\Equal0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (\Equal0~9_combout\ & (\Equal0~8_combout\ & (\Equal0~7_combout\ & \Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~9_combout\,
	datab => \Equal0~8_combout\,
	datac => \Equal0~7_combout\,
	datad => \Equal0~4_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X2_Y4_N14
\min_path_idx[7]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \min_path_idx[7]~0_combout\ = (min_path_idx(7)) # ((!\Reset~input_o\ & \Equal0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => min_path_idx(7),
	datad => \Equal0~10_combout\,
	combout => \min_path_idx[7]~0_combout\);

-- Location: FF_X2_Y4_N15
\min_path_idx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \min_path_idx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => min_path_idx(7));

-- Location: LCCOMB_X2_Y4_N0
\decoder_out[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[0]~0_combout\ = (min_path_idx(7) & (!\Reset~input_o\ & \Equal0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => min_path_idx(7),
	datac => \Reset~input_o\,
	datad => \Equal0~10_combout\,
	combout => \decoder_out[0]~0_combout\);

-- Location: FF_X2_Y4_N17
\decoder_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[0]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(0));

-- Location: LCCOMB_X2_Y4_N26
\decoder_out[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[2]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[2]~feeder_combout\);

-- Location: FF_X2_Y4_N27
\decoder_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[2]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(2));

-- Location: LCCOMB_X2_Y4_N12
\decoder_out[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[3]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[3]~feeder_combout\);

-- Location: FF_X2_Y4_N13
\decoder_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[3]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(3));

-- Location: LCCOMB_X2_Y4_N30
\decoder_out[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[4]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[4]~feeder_combout\);

-- Location: FF_X2_Y4_N31
\decoder_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[4]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(4));

-- Location: LCCOMB_X2_Y4_N4
\decoder_out[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[5]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[5]~feeder_combout\);

-- Location: FF_X2_Y4_N5
\decoder_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[5]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(5));

-- Location: LCCOMB_X2_Y4_N6
\decoder_out[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_out[6]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \decoder_out[6]~feeder_combout\);

-- Location: FF_X2_Y4_N7
\decoder_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \decoder_out[6]~feeder_combout\,
	ena => \decoder_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => decoder_out(6));

-- Location: LCCOMB_X2_Y4_N20
\Output_Valid~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Output_Valid~0_combout\ = (\Output_Valid~reg0_q\) # ((min_path_idx(7) & \Equal0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => min_path_idx(7),
	datac => \Output_Valid~reg0_q\,
	datad => \Equal0~10_combout\,
	combout => \Output_Valid~0_combout\);

-- Location: FF_X2_Y4_N21
\Output_Valid~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Output_Valid~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Output_Valid~reg0_q\);

-- Location: IOIBUF_X1_Y29_N15
\ParityIn[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ParityIn(1),
	o => \ParityIn[1]~input_o\);

-- Location: IOIBUF_X28_Y29_N8
\ParityIn[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ParityIn(0),
	o => \ParityIn[0]~input_o\);

ww_Output(0) <= \Output[0]~output_o\;

ww_Output(1) <= \Output[1]~output_o\;

ww_Output(2) <= \Output[2]~output_o\;

ww_Output(3) <= \Output[3]~output_o\;

ww_Output(4) <= \Output[4]~output_o\;

ww_Output(5) <= \Output[5]~output_o\;

ww_Output(6) <= \Output[6]~output_o\;

ww_Output_Valid <= \Output_Valid~output_o\;
END structure;


