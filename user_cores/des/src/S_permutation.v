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

module S_combined(
    input [47:0] Din,
    output [31:0] S_B
    );

wire [31:0] Dtmp;
reg [31:0] Dout;

S1 S1_instance(Din[47:42], Dtmp[31:28]);
S2 S2_instance(Din[41:36], Dtmp[27:24]);
S3 S3_instance(Din[35:30], Dtmp[23:20]);
S4 S4_instance(Din[29:24], Dtmp[19:16]);
S5 S5_instance(Din[23:18], Dtmp[15:12]);
S6 S6_instance(Din[17:12], Dtmp[11:8]);
S7 S7_instance(Din[11:6], Dtmp[7:4]);
S8 S8_instance(Din[5:0], Dtmp[3:0]);

assign S_B = Dtmp;
endmodule

module S_permutation(
    input [0:31] S,
    output [31:0] P_S
	 //, 	 input CLK
    );
/*
reg [0:31] S;

always @(posedge CLK)
begin
    S <= Sin;
end*/
assign P_S = {S[15], S[6], S[19], S[20], S[28], S[11], S[27], S[16], S[0], S[14], S[22], S[25], S[4], S[17], S[30], S[9], S[1], S[7], S[23], S[13], S[31], S[26], S[2], S[8], S[18], S[12], S[29], S[5], S[21], S[10], S[3], S[24]};
endmodule
