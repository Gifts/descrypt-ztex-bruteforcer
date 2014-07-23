This design uses some default IP cores of Xilinx ISE. You should add them yourself (Menu -> Project -> New Source -> IP) with following characteristics:

==================================

File Name: clock_generator
Function: Clocking Wizard
Page 1: Input Freq - 48.000
Page 2: CLK_OUT1 Output Freq - 48.000, CLK_OUT2 Output Freq - 240.000

==================================

File Name: io_queue
Function: FIFO Generator
Page 2: Independent Clocks - Distributed RAM
Page 3: First-Word Fall-Through, Write Width - 8, Write Depth - 256

==================================

File Name: queue64_to_8
Function: FIFO Generator
Page 2: Independent Clocks - Block RAM
Page 3: First-Word Fall-Through, Write Width - 64, Write Depth - 16, Read Width - 8

==================================

After adding IP cores design should be fully functional. You can check formal correctness with behavioral testbench main_test4.v. It is self-testing, you should skip till 7 ms, if there is no error - everything is fine.

Select main.v from Design Panel and create bitstream. There would be plenty of warnings of unconnected pins, but that is ok. 
