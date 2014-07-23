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

module descrypt_salt(
    input [63:0] Din,
    input [63:0] K,
	 input [11:0] salt,
    output [67:0] Kout,
    input CLK,
    output [31:0] L_out,
    output [31:0] R_out
);
// TODO: fix bit reversal of salt!!!
wire [31:0] L_out_tmp;
wire [31:0] R_out_tmp;
wire [63:0] D_ip;


wire [31:0] Ltmp [23:0];
wire [31:0] Rtmp [23:0];
wire [67:0] Ktmp [23:0];

wire [55:0] Kcrypt;

PC1 PC1_instance(K, Kcrypt);
IP IP_instance(Din, D_ip);


crypt_cycle_salt crypt_shift_instance1 (D_ip[63:32], 	D_ip[31:0], 			{salt, Kcrypt}, 			Ktmp[0], 	CLK, Ltmp[0], 	Rtmp[0]);

crypt_cycle_salt crypt_shift_instance2 (Ltmp[0], 	Rtmp[0], 	Ktmp[0], 	Ktmp[1], 	CLK, Ltmp[1], 	Rtmp[1]);
crypt_cycle_salt crypt_shift_instance3 (Ltmp[1], 	Rtmp[1], 	Ktmp[1], 	Ktmp[2], 	CLK, Ltmp[2], 	Rtmp[2]);
crypt_cycle_salt crypt_shift_instance4 (Ltmp[2], 	Rtmp[2], 	Ktmp[2], 	Ktmp[3], 	CLK, Ltmp[3], 	Rtmp[3]);
crypt_cycle_salt crypt_shift_instance5 (Ltmp[3], 	Rtmp[3], 	Ktmp[3], 	Ktmp[4], 	CLK, Ltmp[4], 	Rtmp[4]);
crypt_cycle_salt crypt_shift_instance6 (Ltmp[4], 	Rtmp[4], 	Ktmp[4], 	Ktmp[5], 	CLK, Ltmp[5], 	Rtmp[5]);
crypt_cycle_salt crypt_shift_instance7 (Ltmp[5], 	Rtmp[5], 	Ktmp[5], 	Ktmp[6], 	CLK, Ltmp[6], 	Rtmp[6]);
crypt_cycle_salt crypt_shift_instance8 (Ltmp[6], 	Rtmp[6], 	Ktmp[6], 	Ktmp[7], 	CLK, Ltmp[7], 	Rtmp[7]);
crypt_cycle_salt crypt_shift_instance9 (Ltmp[7], 	Rtmp[7], 	Ktmp[7], 	Ktmp[8], 	CLK, Ltmp[8], 	Rtmp[8]);
crypt_cycle_salt crypt_shift_instance10(Ltmp[8], 	Rtmp[8], 	Ktmp[8], 	Ktmp[9], 	CLK, Ltmp[9], 	Rtmp[9]);
crypt_cycle_salt crypt_shift_instance11(Ltmp[9], 	Rtmp[9], 	Ktmp[9], 	Ktmp[10], 	CLK, Ltmp[10], Rtmp[10]);
crypt_cycle_salt crypt_shift_instance12(Ltmp[10], 	Rtmp[10], 	Ktmp[10], 	Ktmp[11], 	CLK, Ltmp[11], Rtmp[11]);
crypt_cycle_salt crypt_shift_instance13(Ltmp[11], 	Rtmp[11], 	Ktmp[11], 	Ktmp[12], 	CLK, Ltmp[12], Rtmp[12]);
crypt_cycle_salt crypt_shift_instance14(Ltmp[12], 	Rtmp[12], 	Ktmp[12], 	Ktmp[13], 	CLK, Ltmp[13], Rtmp[13]);
crypt_cycle_salt crypt_shift_instance15(Ltmp[13], 	Rtmp[13], 	Ktmp[13], 	Ktmp[14], 	CLK, Ltmp[14], Rtmp[14]);
crypt_cycle_salt crypt_shift_instance16(Ltmp[14], 	Rtmp[14], 	Ktmp[14], 	Ktmp[15], 	CLK, Ltmp[15], Rtmp[15]);
crypt_cycle_salt crypt_shift_instance17(Ltmp[15], 	Rtmp[15], 	Ktmp[15], 	Ktmp[16], 	CLK, Ltmp[16], Rtmp[16]);
crypt_cycle_salt crypt_shift_instance18(Ltmp[16], 	Rtmp[16], 	Ktmp[16], 	Ktmp[17], 	CLK, Ltmp[17], Rtmp[17]);
crypt_cycle_salt crypt_shift_instance19(Ltmp[17], 	Rtmp[17], 	Ktmp[17], 	Ktmp[18], 	CLK, Ltmp[18], Rtmp[18]);
crypt_cycle_salt crypt_shift_instance20(Ltmp[18], 	Rtmp[18], 	Ktmp[18], 	Ktmp[19], 	CLK, Ltmp[19], Rtmp[19]);
crypt_cycle_salt crypt_shift_instance21(Ltmp[19], 	Rtmp[19], 	Ktmp[19], 	Ktmp[20], 	CLK, Ltmp[20], Rtmp[20]);
crypt_cycle_salt crypt_shift_instance22(Ltmp[20], 	Rtmp[20], 	Ktmp[20], 	Ktmp[21], 	CLK, Ltmp[21], Rtmp[21]);
crypt_cycle_salt crypt_shift_instance23(Ltmp[21], 	Rtmp[21], 	Ktmp[21], 	Ktmp[22], 	CLK, Ltmp[22], Rtmp[22]);
crypt_cycle_salt crypt_shift_instance24(Ltmp[22], 	Rtmp[22], 	Ktmp[22], 	Ktmp[23], 	CLK, Ltmp[23], Rtmp[23]);

crypt_cycle_salt crypt_shift_instance25(Ltmp[23], 	Rtmp[23], 	Ktmp[23], 	Kout, 	CLK, L_out_tmp, R_out_tmp);

IP_1 IP_1_instance({L_out_tmp, R_out_tmp}, {L_out, R_out});

endmodule