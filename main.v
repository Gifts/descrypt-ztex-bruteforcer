`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////
//
//  This file is part of Descrypt Ztex Bruteforcer
//  Copyright (C) 2014 Alexey Osipov <giftsungiv3n at gmail dot com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program. If not, see <http://www.gnu.org/licenses/>.
//
////////////////////////////////////////////////////////////////////////

module main(
    input [7:0] pc,
    output [7:0] pb,
    output [7:0] pd,
    input CS,
    input CLK,
	 input RESET,
	 input RESET2,
	 input WR,
	 input RD,
	 input SLOWCLK,
	 
	 input [1:0] fpgaID	// Can be used to differentiate between FPGA's on single board
);

wire CLK1_internal;
wire CLK2_internal;

wire [7:0] pc_internal;
wire [7:0] pb_internal;
wire [7:0] pb_out;
wire [7:0] pd_internal;
wire [7:0] pb_out_delayed;
wire [7:0] pd_out;

wire input_full;
wire input_empty;
wire output_full;
wire output_empty;
wire locked;
wire input_empty_delay;
wire SLOW;

clock_generator clock_generator_instance
(// Clock in ports
 .CLK_IN1(CLK),      // IN
 // Clock out ports
 .CLK_OUT1(CLK1_internal),     // OUT
 .CLK_OUT2(CLK2_internal),     // OUT
 // Status and control signals
 .RESET(RESET),	// IN
 .LOCKED(locked)	// OUT
 );    
 
slower slower_instance
(
	.CLK(CLK1_internal),	//input CLK,
	.SLOWCLK(SLOWCLK),	//input SLOWCLK,
	.RESET(RESET2),	//input RESET,
	.EN_OUT(SLOW)	//output EN_OUT
);

io_queue input_queue (
  .rst(RESET2), // input rst
  .wr_clk(CLK1_internal), // input wr_clk
  .rd_clk(CLK2_internal), // input rd_clk
  .din(pc), // input [7 : 0] din
//  .wr_en(CS && WR && SLOW), // input wr_en
  .wr_en(WR && SLOW), // input wr_en
  .rd_en(1'b1), // input rd_en
  .dout(pc_internal), // output [7 : 0] dout
  .full(input_full), // output full
  .empty(input_empty) // output empty
);

wire [63:0] pc_internal_64;
wire [63:0] pb_internal_64;
wire [63:0] pb_internal_64_out;
wire srl_ready;

srl8_to_64 srl8_to_64_instance(
	.clk(CLK2_internal), .enable(input_empty), .reset(RESET2), .dataIn(pc_internal), .ready(srl_ready), .result(pc_internal_64)
);

wire [67:0] Ktest;

descrypt_salt des_core(
    .Din(64'h0),
    .K(pc_internal_64 << 1),
	 .salt(12'b111001101111), // Static salt for now
    .Kout(Ktest),
    .CLK(CLK2_internal),
    .L_out(pb_internal_64[63:32]),
    .R_out(pb_internal_64[31:0])
);

wire converter_empty;
wire converter_empty_delay;

// For now tests only against non-zero key
// Exchanging pb_internal_64 and test value will create bruter

comparer comparer_instance(
	//.Din({8'b0, Ktest[55:0]}),//	input [width:0] Din,
	//.test(pb_internal_64),
	.Din(pb_internal_64),//	input [width:0] Din,
	.test({8'b0, Ktest[55:0]}),
	.CLK(CLK2_internal),//	input CLK,
	.reset(RESET2),//	input reset,
	.Dout(pb_internal_64_out), //	output [width:0] Dout,
	.good(input_empty_delay)//	output good
);

queue64_to_8 size_conversion (
  .rst(RESET2), // input rst
  .wr_clk(CLK2_internal), // input wr_clk
  .rd_clk(CLK2_internal), // input rd_clk
  .din(pb_internal_64_out), // input [63 : 0] din
  .wr_en(~input_empty_delay), // input wr_en
  .rd_en(1'b1), // input rd_en
  .dout(pb_internal), // output [7 : 0] dout
  .full(), // output full
  .empty(converter_empty) // output empty
);

//srl Delay2_instance(
//	CLK2_internal, 1'b1, input_empty, input_empty_delay, 4'b0001
//	CLK2_internal, 1'b1, converter_empty, converter_empty_delay, 4'b0000
//);


io_queue output_queue (
  .rst(RESET2), // input rst
  .wr_clk(CLK2_internal), // input wr_clk
  .rd_clk(CLK1_internal), // input rd_clk
  .din(pb_internal), // input [7 : 0] din
  .wr_en(~converter_empty), // input wr_en
  .rd_en((CS && RD && SLOW)), // input rd_en
  .dout(pb_out), // output [7 : 0] dout
  .full(output_full), // output full
  .empty(output_empty) // output empty
//  .rd_data_count(pd_out)
);

///*
assign pd_out[7] = input_full;
assign pd_out[6] = input_empty;
assign pd_out[5] = output_full;
assign pd_out[4] = output_empty;

assign pd_out[3] = 1'b0;
assign pd_out[2] = 1'b0;
assign pd_out[1] = 1'b0;
assign pd_out[0] = locked;
//*/


assign pb = (CS==1) ? pb_out : 8'bZ;
assign pd = (CS==1) ? pd_out : 8'bZ;

endmodule
