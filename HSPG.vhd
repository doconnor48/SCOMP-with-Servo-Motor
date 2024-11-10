-- HSPG.vhd (hobby servo pulse generator)
-- This starting point generates a pulse between 100 us and something much longer than 2.5 ms.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HSPG is
    port(
        CS          : in  std_logic;
        IO_WRITE    : in  std_logic;
        IO_DATA     : in  std_logic_vector(15 downto 0);
        CLOCK       : in  std_logic;
        RESETN      : in  std_logic;
        PULSE1      : out std_logic;
		  PULSE2		  : out std_logic;
		  PULSE3		  : out std_logic;
		  PULSE4		  : out std_logic
		  );
end HSPG;

architecture a of HSPG is

    signal command    : Std_logic_vector(15 downto 0);  -- command sent from SCOMP
    signal count      : unsigned(17 downto 0);          -- internal counter
    signal PulseWidth1 : unsigned(17 downto 0);          -- pulse width
	 signal PulseWidth2 : unsigned(17 downto 0);
	 signal PulseWidth3 : unsigned(17 downto 0);          -- pulse width
	 signal PulseWidth4 : unsigned(17 downto 0);
	 signal Position1  : unsigned(8 downto 0);
	 signal Position2  : unsigned(8 downto 0);
	 signal Position3  : unsigned(8 downto 0);
	 signal Position4  : unsigned(8 downto 0);
	 signal Motor      : unsigned(1 downto 0);  
	 signal V1  		 : unsigned(2 downto 0);
	 signal V2 			 : unsigned(2 downto 0);
	 signal V3 			 : unsigned(2 downto 0);
	 signal V4 			 : unsigned(2 downto 0);
	 signal A1			 : unsigned(1 downto 0);
	 signal A2 			 : unsigned(1 downto 0);
	 signal A3			 : unsigned(1 downto 0);
	 signal A4 			 : unsigned(1 downto 0);
	 signal currPWM1   : unsigned(17 downto 0) := (to_unsigned(7200, 18));
	 signal currPWM2   : unsigned(17 downto 0) := (to_unsigned(7200, 18));
	 signal currPWM3   : unsigned(17 downto 0) := (to_unsigned(7200, 18));
	 signal currPWM4   : unsigned(17 downto 0) := (to_unsigned(7200, 18));
	 signal delay1		 : std_logic := '0';
	 signal delay2     : std_logic := '0';
	 signal delay3     : std_logic := '0';
	 signal delay4		 : std_logic := '0';
	 signal delayCounter1 : unsigned(16 downto 0) := (others => '0');
	 signal delayCounter2 : unsigned(16 downto 0) := (others => '0');
	 signal delayCounter3 : unsigned(16 downto 0) := (others => '0');
	 signal delayCounter4 : unsigned(16 downto 0) := (others => '0');
	 signal delayCycles1  : unsigned(16 downto 0) := (others => '0');
	 signal delayCycles2  : unsigned(16 downto 0) := (others => '0');
	 signal delayCycles3  : unsigned(16 downto 0) := (others => '0');
	 signal delayCycles4  : unsigned(16 downto 0) := (others => '0');
	 
	
begin

    -- Latch data on rising edge of CS
    process (RESETN, CS) begin
        if RESETN = '0' then
            command <= (others => '0');
				PulseWidth1 <= (others => '0');
				PulseWidth2 <= (others => '0');
				PulseWidth3 <= (others => '0');
				PulseWidth4 <= (others => '0');
				Position1 <= (others => '0');
				Position2 <= (others => '0');
				Position3 <= (others => '0');
				Position4 <= (others => '0');
				V1 <= (others => '0');
				V2 <= (others => '0');
				V3 <= (others => '0');
				V4 <= (others => '0');
				A1 <= (others => '0');
				A2 <= (others => '0');
				A3 <= (others => '0');
				A4 <= (others => '0');
        elsif IO_WRITE = '1' and rising_edge(CS) then
            command <= IO_DATA;
				Motor <= unsigned(command(15 downto 14));
				case Motor is
					when "00" => 
						Position1 <= unsigned(command(8 downto 0));
						A1 <= unsigned(command(13 downto 12));
						V1 <= unsigned(command(11 downto 9));
						PulseWidth1 <= to_unsigned(((to_Integer(Position1) * 42) + 7200), 18);
						
					when "01" =>
						Position2 <= unsigned(command(8 downto 0));
						A2 <= unsigned(command(13 downto 12));
						V2 <= unsigned(command(11 downto 9));
						PulseWidth2 <= to_unsigned(((to_Integer(Position2) * 42) + 7200), 18);
						
					when "10" => 
						Position3 <= unsigned(command(8 downto 0));
						A3 <= unsigned(command(13 downto 12));
						V3 <= unsigned(command(11 downto 9));
						PulseWidth3 <= to_unsigned(((to_Integer(Position3) * 42) + 7200), 18);
						
					when "11" =>
						Position4 <= unsigned(command(8 downto 0));
						A4 <= unsigned(command(13 downto 12));
						V4 <= unsigned(command(11 downto 9));
						PulseWidth4 <= to_unsigned(((to_Integer(Position4) * 42) + 7200), 18);
						
					end case;
        end if;
    end process;

    -- Determine PulseWidth based on command

    -- Generate pulse based on PulseWidth
    process (RESETN, CLOCK)
    begin
        if (RESETN = '0') then
            count <= (others => '1');
            PULSE1 <= '0';
				Pulse2 <= '0';
				Pulse3 <= '0';
				Pulse4 <= '0';
				currPWM1 <= to_unsigned(7200, 18);
				currPWM2 <= to_unsigned(7200, 18);
				currPWM3 <= to_unsigned(7200, 18);
				currPWM4 <= to_unsigned(7200, 18);
        elsif rising_edge(CLOCK) then
					
					if delay1 = '1' then
						if delayCounter1 = delayCycles1 then
							delay1 <= '0';
							delayCounter1 <= (others => '0');
						else
							delayCounter1 <= delayCounter1 + 1;
						end if;
					else
						if currPWM1 < PulseWidth1 then
							delayCycles1 <= to_unsigned(to_integer(v1 *count + a1 * count * count/2), 17);
							delay1 <= '1';
							currPWM1 <= currPWM1 + 42;
							if currPWM1 >= PulseWidth1 then
								currPWM1 <= Pulsewidth1;
							end if;
							
						elsif currPWM1 > PulseWidth1 then
							delayCycles1 <= to_unsigned(to_integer(v1 * count + a1 * count* count/2),17);
							delay1 <= '1';
							currPWM1 <= currPWM1 - 42;
							if currPWM1 <= PulseWidth1 then
								currPWM1 <= PulseWidth1;
							end if;
							
						end if;
						if delayCycles1 < 0 then
							delayCycles1 <= to_unsigned(0, 17);
							delay1 <= '0';
						end if;
					end if;
					
					if count < currPWM1 then
						Pulse1 <= '1';
					else
						Pulse1 <= '0';
					end if;
				
				
				
					if delay2 = '1' then
						if delayCounter2 = delayCycles2 then
							delay2 <= '0';
							delayCounter2 <= (others => '0');
						else
							delayCounter2 <= delayCounter2 + 1;
						end if;
					else
						if currPWM2 < PulseWidth2 then
							delayCycles2 <= to_unsigned(to_integer(v2 * count + a2 * count*count/2), 17);
							delay2 <= '1';
							currPWM2 <= currPWM2 + 42;
							if currPWM2 >= PulseWidth2 then
								currPWM2 <= PulseWidth2;
							end if;
						elsif currPWM2 > PulseWidth2 then
							delayCycles2 <= to_unsigned(to_integer(v2* count + a2* count* count/2), 17);
							delay2 <= '1';
							currPWM2 <= currPWM2 - 42;
							if currPWM2 <= PulseWidth2 then
								currPWM2 <= PulseWidth2;
							end if;
							
						end if;
						if delayCycles2 < 0 then
							delayCycles2 <= to_unsigned(0, 17);
							delay2 <= '0';
						end if;
					end if;
					
					if count < currPWM2 then
						Pulse2 <= '1';
					else
						Pulse2 <= '0';
					end if;
				
					if delay3 = '1' then
						if delayCounter3 = delayCycles3 then
							delay3 <= '0';
							delayCounter3 <= (others => '0');
						else
							delayCounter3 <= delayCounter3 + 1;
						end if;
					else
						if currPWM3 < PulseWidth3 then
							delayCycles3 <= to_unsigned(to_integer(v3* count + a3* count*count/2), 17);
							delay3 <= '1';
							currPWM3 <= currPWM3 + 42;
							if currPWM3 >= PulseWidth3 then
								currPWM3 <= PulseWidth3;
							end if;
						elsif currPWM3 > PulseWidth3 then
							delayCycles3 <= to_unsigned(to_integer(v3* count + a3*count * count/2), 17);
							delay3 <= '1';
							currPWM3 <= currPWM3 - 42;
							if currPWM3 <= PulseWidth3 then
								currPWM3 <= PulseWidth3;
							end if;
							
						end if;
						if delayCycles3 < 0 then
							delayCycles3 <= to_unsigned(0, 17);
							delay3 <= '0';
						end if;
					end if;
					
					if count < currPWM3 then
						Pulse3 <= '1';
					else
						Pulse3 <= '0';
					end if;
				
			
					if delay4 = '1' then
						if delayCounter4 = delayCycles4 then
							delay4 <= '0';
							delayCounter4 <= (others => '0');
						else
							delayCounter4 <= delayCounter4 + 1;
						end if;
					else
						if currPWM4 < PulseWidth4 then
							delayCycles4 <= to_unsigned(to_integer(v4* count + a4* count* count/2), 17);
							delay4 <= '1';
							currPWM4 <= currPWM4 + 42;
							if currPWM4 >= PulseWidth4 then
								currPWM4 <= PulseWidth4;
							end if;
						elsif currPWM4 > PulseWidth4 then
							delayCycles4 <= to_unsigned(to_integer(v4* count + a4* count * count/2), 17);
							delay4 <= '1';
							currPWM4 <= currPWM4 - 42;
							if currPWM4 <= PulseWidth4 then
								currPWM4 <= PulseWidth4;
							end if;
							
						end if;
						if delayCycles4 < 0 then
							delayCycles4 <= to_unsigned(0, 17);
							delay4 <= '0';
						end if;
							
					end if;
					
					if count < currPWM4 then
						Pulse4 <= '1';
					else
						Pulse4 <= '0';
					end if;
				

            if count = to_unsigned(240000, 18) then  -- Max count value
                count <= (others => '1');
            else
                count <= count + 1;
            end if;
        end if;
    end process;

end a;


