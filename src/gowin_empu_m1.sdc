//Copyright (C)2014-2021 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8 Beta
//Created Time: 2021-07-15 17:03:19
create_clock -name JTAG_9 -period 200 -waveform {0 100} [get_ports {JTAG_9}] -add
