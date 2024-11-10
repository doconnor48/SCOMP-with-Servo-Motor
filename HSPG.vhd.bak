-- HSPG.vhd (hobby servo pulse generator)
-- This starting point generates a pulse between 100 us and something much longer than 2.5 ms.

library IEEE;
library lpm;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use lpm.lpm_components.all;

entity HSPG is
    port(
        CS          : in  std_logic;
        IO_WRITE    : in  std_logic;
        IO_DATA     : in  std_logic_vector(15 downto 0);
        CLOCK       : in  std_logic;
        RESETN      : in  std_logic;
        PULSE       : out std_logic
    );
end HSPG;

architecture a of HSPG is

    signal command : std_logic_vector(15 downto 0);  -- command sent from SCOMP
    signal count   : std_logic_vector(15 downto 0);  -- internal counter

begin

    -- Latch data on rising edge of CS
    process (RESETN, CS) begin
        if RESETN = '0' then
            command <= x"0000";
        elsif IO_WRITE = '1' and rising_edge(CS) then
            command <= IO_DATA;
        end if;
    end process;

    -- This is a VERY SIMPLE way to generate a pulse.  This is not particularly
    -- flexible and it has some issues.  It works, but you need to consider how
    -- to improve this as part of the project.
    process (RESETN, CLOCK)
    begin
        if (RESETN = '0') then
            count <= x"0000";
        elsif rising_edge(CLOCK) then
            -- Each clock cycle, a counter is incremented.
            count <= count + 1;

            -- When the counter reaches the full desired period, start the period over.
            if count = x"00C7" then  -- 20 ms has elapsed
                -- Reset the counter and set the output high.
                count <= x"0000";
                PULSE <= '1';

            -- Within the period, when the counter reaches the "command" value, set the output low.
            -- This will make larger command values produce longer pulses.
            elsif count = command then
                PULSE <= '0';
            end if;
        end if;
    end process;

end a;