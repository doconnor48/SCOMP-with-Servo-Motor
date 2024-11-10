-- SafePulse.vhd
-- Created 2023
--
-- This device repeats an input pulse, but ensures that the output
-- always has a high time within an expected range.

library IEEE;
library lpm;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use lpm.lpm_components.all;

entity SafePulse is
	port(
		P_IN        : in  std_logic;
		CLOCK       : in  std_logic;
		P_OUT       : out std_logic
	);
end SafePulse;

architecture a of SafePulse is

	signal count  : std_logic_vector(15 downto 0);
	signal trig   : std_logic;
	signal reset  : std_logic;
	signal forceH : std_logic;
	signal forceL : std_logic;
	
begin

	process begin
		wait until rising_edge(CLOCK);
		if trig = '1' then
			-- acknowledge the trigger
			reset <= '1';
			-- beginning of pulse; force output active
			forceH <= '1';
			forceL <= '0';
			-- start ~5ms count
			count <= x"FFFF";
		else
			if count = x"0000" then
				-- enough time has elapsed to restart if requested
				reset <= '0';
				-- can allow passthrough if input has gone low
				if P_IN = '0' then
					forceL <= '0';
					forceH <= '0';
				end if;
			else
				count <= count - 1;
				if count = x"E3E0" then -- don't have to force anymore
					forceH <= '0';
				end if;
				if count = x"8F80" then -- timed out; cut off any longer pulse
					forceL <= '1';
				end if;
			end if;
		end if;		
	end process;

	process (P_IN, reset) begin
		if reset='1' then
			trig <= '0';
		elsif rising_edge(P_IN) then
			trig <= '1';
		end if;
	end process;
	
	P_OUT <= (P_IN OR forceH) AND (NOT forceL);
	
end a;