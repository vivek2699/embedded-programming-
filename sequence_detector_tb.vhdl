library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity sequence_detector_tb is
end sequence_detector_tb;

architecture TB_ARCHITECTURE of sequence_detector_tb is

 component sequence_detector
 port(
  clk : in STD_LOGIC;
  rst : in STD_LOGIC;
  x : in STD_LOGIC;
  z : out STD_LOGIC );
 end component;

 signal clk : STD_LOGIC;
 signal rst : STD_LOGIC;
 signal x : STD_LOGIC;
 signal z : STD_LOGIC;

begin

 UUT : sequence_detector
  port map (
   clk => clk,
   rst => rst,
   x => x,
   z => z
  );
 
 clk_process : process
 begin
  clk <= '0';
  wait for 5 ns;
  
  clk <= '1';
  wait for 5 ns;
  
 end process;
 
 sti_process: process  
 begin
  x <= '0';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;   
  
  x <= '1';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns; 
  
  x <= '0';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '1';
  wait for 10 ns;
  
  x <= '0';
  wait for 10 ns;
 
 end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sequence_detector of sequence_detector_tb is
 for TB_ARCHITECTURE
  for UUT : sequence_detector
   use entity work.sequence_detector(sequence_detector_arch);
  end for;
 end for;
end TESTBENCH_FOR_sequence_detector;
