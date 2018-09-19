library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity sequence_detector is
 port (
  clk: in STD_LOGIC;
  rst: in STD_LOGIC;
  x: in STD_LOGIC;
  z: out STD_LOGIC);
end sequence_detector;

architecture sequence_detector_arch of sequence_detector is

type seq_detect_type is (
    S1, S2, S3, S4
);

signal seq_detect: seq_detect_type;

begin

seq_detect_machine: process (clk)
begin
 if clk'event and clk = '1' then
  if rst='1' then 
   seq_detect <= S1;

  else

   case seq_detect is
    when S1 =>
     if x = '1' then 
      seq_detect <= S2;
     elsif x = '0' then 
      seq_detect <= S1;
     end if;
    when S2 =>
     if x = '1' then 
      seq_detect <= S3;
     elsif x = '0' then 
      seq_detect <= S1;
     end if;
    when S3 =>
     if x = '1' then 
      seq_detect <= S3;
     elsif x = '0' then 
      seq_detect <= S4;
     end if;
    when S4 =>
     if x = '1' then 
      seq_detect <= S2;
     elsif x = '0' then 
      seq_detect <= S1;
     end if;
     
    when others =>
     null;

   end case;
  end if;
 end if;
end process;

z_assignment:
z <= '0' when (seq_detect = S1 and x = '1') else
     '0' when (seq_detect = S1 and (x = '0' and not (x = '1'))) else
     '0' when (seq_detect = S2 and x = '1') else
     '0' when (seq_detect = S2 and (x = '0' and not (x = '1'))) else
     '0' when (seq_detect = S3 and x = '1') else
     '0' when (seq_detect = S3 and (x = '0' and not (x = '1'))) else
     '1' when (seq_detect = S4 and x = '1') else
     '0' when (seq_detect = S4 and (x = '0' and not (x = '1'))) else
     '0';

end sequence_detector_arch;