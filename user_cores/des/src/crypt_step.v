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

module crypt_step_salt(
    input [31:0] L,
    input [31:0] R,
    input [59:0] K,
    input CLK,
    output [31:0] L_out,
    output [31:0] R_out
    );

wire [31:0]tmp_out;
wire [31:0]Ltmp;
wire [31:0]Rtmp;


Fblock_salt	Fblock_instance(R, K, Rtmp, CLK);
Delay2	Delay_1step_instance(L, Ltmp, CLK);
Delay		Delay_2step_instance(R, L_out, CLK);
xor_32	xor_32_instance(Ltmp, Rtmp, R_out, CLK);
 

endmodule
