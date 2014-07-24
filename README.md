descrypt-ztex-bruteforcer
=========================

This project is proof of concept for idea, that old FPGA boards can be reused for hashcracking purposes. Especially this one shows result overperforming those of GPUs. For now it is a bit ugly, and interfaces can be changed without prior notice.

Building the bitstream
----------------------

Please refer to BUILD file. Please be aware that building bitstream takes about 40 minutes.

Implementation details
----------------------

Design is splitted in two clock domains. External for IO which frequency is 48 MHz, and internal with frequency 240 MHz. That gives possible speed of 960 MH/s per ZTEX board with consumption of 40W. For comparison, AMD R290x performs at 120.1 MH/s with consumtion 300W.

Unfortunately IO is VERY slow. Whithout using harware queues in FX2 microcontroller it takes 4 cycles per instruction, and there are plenty assembly instructions for sending single byte.