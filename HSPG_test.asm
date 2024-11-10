; Final Project Program
ORG 0
loop:
	In Switches
	JPos done
	
	load M1Pos1
	out HSPG
	loadi 1
	out LEDs
	
	call delayOne
	
	load M1Pos2
	out HSPG
	
	call delayOne
	
	load M4Pos1
	out HSPG
	loadi 8
	out LEDs
	
	call delayOne
	
	load M4Pos2
	out HSPG
	
	call delayOne

	load M2Pos1
	out HSPG
	loadi 2
	
	call delayOne
	
	out LEDS
	load M2Pos2
	out HSPG
	
	call delayOne
	
	jump loop
	
done:
	In Switches
	JZero doneTwo
	
	load M1Pos1
	out HSPG
	loadi 1
	out LEDs
	
	call delayTwo
	
	load M1Pos2
	out HSPG
	
	call delayTwo
	
	load M4Pos1
	out HSPG
	loadi 8
	out LEDs
	
	call delayTwo
	
	load M4Pos2
	out HSPG
	
	call delayTwo

	load M2Pos1
	out HSPG
	loadi 2
	
	call delayTwo
	
	out LEDS
	load M2Pos2
	out HSPG
	
	call delayTwo

	Jump done
	
	
doneTwo:
	In Switches
	JPos doneThree
	
	load M1Pos1
	out HSPG
	loadi 1
	out LEDs
	
	call delayFive
	
	load M1Pos2
	out HSPG
	
	call delayFive
	
	load M4Pos1
	out HSPG
	loadi 8
	out LEDs
	
	call delayFive
	
	load M4Pos2
	out HSPG
	
	call delayFive

	load M2Pos1
	out HSPG
	loadi 2
	
	call delayFive
	
	out LEDS
	load M2Pos2
	out HSPG
	
	call delayFive

	Jump doneTwo

doneThree:
	In switches
	Jzero doneFour
	load M1Pos1
	out HSPG
	loadi 1
	out LEDs
	
	call delayTen
	
	load M1Pos2
	out HSPG
	
	call delayTen
	
	load M4Pos1
	out HSPG
	loadi 8
	out LEDs
	
	call delayTen
	
	load M4Pos2
	out HSPG
	
	call delayTen

	load M2Pos1
	out HSPG
	loadi 2
	
	call delayTen
	
	out LEDS
	load M2Pos2
	out HSPG
	
	call delayTen

	Jump doneThree

doneFour:
	In switches
	JPos SwitchControl
	
	load M1Pos1
	out HSPG
	loadi 1
	out LEDs
	
	call delayTwenty
	
	load M1Pos2
	out HSPG
	
	call delayTwenty
	
	load M4Pos1
	out HSPG
	loadi 8
	out LEDs
	
	call delayTwenty
	
	load M4Pos2
	out HSPG
	
	call delayTwenty

	load M2Pos1
	out HSPG
	loadi 2
	
	call delayTwenty
	
	out LEDS
	load M2Pos2
	out HSPG
	
	call delayTwenty

	Jump doneFour
	
	
	
SwitchControl:
	IN		Switches
	JZERO	Slow
	In 		switches
	sub 	three
	Jzero 	positionDemo
	
Fast:
	LOAD	M1Pos8F
	OUT		HSPG
	CALL	DelayFive
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayFive
	JUMP	SwitchControl
Slow:
	LOAD	M1Pos8S
	OUT		HSPG
	CALL	DelayThirty
	LOAD	M1Pos0S
	OUT		HSPG
	CALL	DelayThirty
	JUMP	Medium
Medium:
	Load 	M1Pos8M
	Out		HSPG
	Call	DelayTwenty
	Load	M1Pos0M
	Out 	HSPG
	Call	DelayTwenty
	Jump	SwitchControl
	
positionDemo:
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos7F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayTwo
	CALL	DelayThirty
	
VeloDemo:
	CALL	Count3
VeloDemoLoop:
	LOAD	Count
	JZERO	MultiMotorDemo
	LOAD	M1Pos0S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M2Pos0S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M3Pos0S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M4Pos0S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M1Pos8S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M2Pos8S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M3Pos8S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M4Pos8S
	OUT		HSPG
	CALL	DelayTen
	
	LOAD	M1Pos0M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M2Pos0M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M3Pos0M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M4Pos0M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M1Pos8M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M2Pos8M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M3Pos8M
	OUT		HSPG
	CALL	DelayFive
	LOAD	M4Pos8M
	OUT		HSPG
	CALL	DelayFive
	
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos8F
	OUT		HSPG
	CALL	DelayTwo
	CALL	DecCount
	JUMP	VeloDemoLoop
	
	
MultiMotorDemo:
	CALL	Count3
MultiMotorDemoLoop:
	LOAD	Count
	JZERO	Dominoes
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos2F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos3F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos4F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos5F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos6F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos7F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos7F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos7F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos7F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos8F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos8F
	OUT		HSPG
	CALL	DelayThirty
	LOAD	M1Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos1F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M4Pos1F
	OUT		HSPG
	CALL	DecCount
	CALL	DelayThirty
	JUMP	MultiMotorDemoLoop
	
Dominoes:
	LOAD	M1Pos8S
	OUT		HSPG
	CALL	DelayFive
	LOAD	M2Pos8S
	OUT		HSPG
	CALL	DelayFive
	LOAD	M3Pos8S
	OUT		HSPG
	CALL	DelayFive
	LOAD	M4Pos8S
	OUT		HSPG
	CALL	DelayTen
	LOAD	M4Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M3Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M2Pos0F
	OUT		HSPG
	CALL	DelayTwo
	LOAD	M1Pos0F
	OUT		HSPG
	CALL	DelayTwenty
	JUMP	Dominoes

	
	

	


DelayOne:
	out Timer
InnerLoop:
	In Timer
	sub One
	JNEG InnerLoop
	return
	
DelayTwo:
	out Timer
InnerLoopTwo:
	In Timer
	sub Two
	JNEG InnerLoopTwo
	return
	
DelayFive:
	out Timer
InnerLoopThree:
	In Timer
	sub Five
	JNEG InnerLoopThree
	return

DelayTen:
	out Timer
InnerLoopFour:
	In Timer
	sub Ten
	JNEG InnerLoopFour
	return
	
DelayTwenty:
	out Timer
InnerLoopFive:
	In timer
	sub Twenty
	JNEG InnerLoopFive
	return

DelayThirty:
	out Timer
InnerLoopsix:
	In timer
	sub Thirty
	JNEG InnerLoopsix
	return

;Dec Count
DecCount:
	LOAD	Count
	SUB		One
	STORE	Count
	RETURN
	
;Count 3: put 3 into count
Count3:
	LOADI	3
	STORE	Count
	RETURN



M1Pos1:		DW 		&B0011111111111111
M1Pos2: 	DW		&B0000000000000000
M2Pos1:		DW		&B0100100111111111
M2Pos2:		DW		&B0100100000000000
M3Pos1:		DW		&B1000000111111111
M3Pos2:		DW		&B1101100000000000
M4Pos1:		DW		&B1100000111111111
M4Pos2:		DW		&B1111111000000000

M1Pos0F:		DW	&B0000000000000000
M1Pos1F:		DW	&B0000000001000000
M1Pos2F:		DW	&B0000000010000000
M1Pos3F:		DW	&B0000000011000000
M1Pos4F:		DW	&B0000000100000000
M1Pos5F:		DW	&B0000000101000000
M1Pos6F:		DW	&B0000000110000000
M1Pos7F:		DW	&B0000000111000000
M1Pos8F:		DW	&B0000000111111111

M1Pos0M:		DW	&B0010100000000000
M1Pos1M:		DW	&B0010100001000000
M1Pos2M:		DW	&B0010100010000000
M1Pos3M:		DW	&B0010100011000000
M1Pos4M:		DW	&B0010100100000000
M1Pos5M:		DW	&B0010100101000000
M1Pos6M:		DW	&B0010100110000000
M1Pos7M:		DW	&B0010100111000000
M1Pos8M:		DW	&B0010100111111111

M1Pos0S:		DW	&B0011111000000000
M1Pos1S:		DW	&B0011111001000000
M1Pos2S:		DW	&B0011111010000000
M1Pos3S:		DW	&B0011111011000000
M1Pos4S:		DW	&B0011111100000000
M1Pos5S:		DW	&B0011111101000000
M1Pos6S:		DW	&B0011111110000000
M1Pos7S:		DW	&B0011111111000000
M1Pos8S:		DW	&B0011111111111111

;Motor 2 Positions
M2Pos0F:		DW	&B0100000000000000
M2Pos1F:		DW	&B0100000001000000
M2Pos2F:		DW	&B0100000010000000
M2Pos3F:		DW	&B0100000011000000
M2Pos4F:		DW	&B0100000100000000
M2Pos5F:		DW	&B0100000101000000
M2Pos6F:		DW	&B0100000110000000
M2Pos7F:		DW	&B0100000111000000
M2Pos8F:		DW	&B0100000111111111

M2Pos0M:		DW	&B0110100000000000
M2Pos1M:		DW	&B0110100001000000
M2Pos2M:		DW	&B0110100010000000
M2Pos3M:		DW	&B0110100011000000
M2Pos4M:		DW	&B0110100100000000
M2Pos5M:		DW	&B0110100101000000
M2Pos6M:		DW	&B0110100110000000
M2Pos7M:		DW	&B0110100111000000
M2Pos8M:		DW	&B0110100111111111

M2Pos0S:		DW	&B0111111000000000
M2Pos1S:		DW	&B0111111001000000
M2Pos2S:		DW	&B0111111010000000
M2Pos3S:		DW	&B0111111011000000
M2Pos4S:		DW	&B0111111100000000
M2Pos5S:		DW	&B0111111101000000
M2Pos6S:		DW	&B0111111110000000
M2Pos7S:		DW	&B0111111111000000
M2Pos8S:		DW	&B0111111111111111



;Motor 3 Positions
M3Pos0F:		DW	&B1000000000000000
M3Pos1F:		DW	&B1000000001000000
M3Pos2F:		DW	&B1000000010000000
M3Pos3F:		DW	&B1000000011000000
M3Pos4F:		DW	&B1000000100000000
M3Pos5F:		DW	&B1000000101000000
M3Pos6F:		DW	&B1000000110000000
M3Pos7F:		DW	&B1000000111000000
M3Pos8F:		DW	&B1000000111111111

M3Pos0M:		DW	&B1010100000000000
M3Pos1M:		DW	&B1010100001000000
M3Pos2M:		DW	&B1010100010000000
M3Pos3M:		DW	&B1010100011000000
M3Pos4M:		DW	&B1010100100000000
M3Pos5M:		DW	&B1010100101000000
M3Pos6M:		DW	&B1010100110000000
M3Pos7M:		DW	&B1010100111000000
M3Pos8M:		DW	&B1010100111111111

M3Pos0S:		DW	&B1011111000000000
M3Pos1S:		DW	&B1011111001000000
M3Pos2S:		DW	&B1011111010000000
M3Pos3S:		DW	&B1011111011000000
M3Pos4S:		DW	&B1011111100000000
M3Pos5S:		DW	&B1011111101000000
M3Pos6S:		DW	&B1011111110000000
M3Pos7S:		DW	&B1011111111000000
M3Pos8S:		DW	&B1011111111111111



;Motor 4 Positions
M4Pos0F:		DW	&B1100000000000000
M4Pos1F:		DW	&B1100000001000000
M4Pos2F:		DW	&B1100000010000000
M4Pos3F:		DW	&B1100000011000000
M4Pos4F:		DW	&B1100000100000000
M4Pos5F:		DW	&B1100000101000000
M4Pos6F:		DW	&B1100000110000000
M4Pos7F:		DW	&B1100000111000000
M4Pos8F:		DW	&B1100000111111111

M4Pos0M:		DW	&B1110100000000000
M4Pos1M:		DW	&B1110100001000000
M4Pos2M:		DW	&B1110100010000000
M4Pos3M:		DW	&B1110100011000000
M4Pos4M:		DW	&B1110100100000000
M4Pos5M:		DW	&B1110100101000000
M4Pos6M:		DW	&B1110100110000000
M4Pos7M:		DW	&B1110100111000000
M4Pos8M:		DW	&B1110100111111111

M4Pos0S:		DW	&B1111111000000000
M4Pos1S:		DW	&B1111111001000000
M4Pos2S:		DW	&B1111111010000000
M4Pos3S:		DW	&B1111111011000000
M4Pos4S:		DW	&B1111111100000000
M4Pos5S:		DW	&B1111111101000000
M4Pos6S:		DW	&B1111111110000000
M4Pos7S:		DW	&B1111111111000000
M4Pos8S:		DW	&B1111111111111111



Thirty:		DW		30
Twenty:		DW		20
Ten: 		DW		10
eight:		DW		8
Five:		DW		5
three: 		DW		3
Two:		DW		2
One:		DW		1
count:		DW		3

; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
HSPG:      EQU &H50

