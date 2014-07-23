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

module IP(
    input [63:0] Din,
    output [63:0] Dout
    );

assign Dout = {Din[6], Din[14], Din[22], Din[30], Din[38], Din[46], Din[54], Din[62], Din[4], Din[12], Din[20], Din[28], Din[36], Din[44], Din[52], Din[60], Din[2], Din[10], Din[18], Din[26], Din[34], Din[42], Din[50], Din[58], Din[0], Din[8], Din[16], Din[24], Din[32], Din[40], Din[48], Din[56], Din[7], Din[15], Din[23], Din[31], Din[39], Din[47], Din[55], Din[63], Din[5], Din[13], Din[21], Din[29], Din[37], Din[45], Din[53], Din[61], Din[3], Din[11], Din[19], Din[27], Din[35], Din[43], Din[51], Din[59], Din[1], Din[9], Din[17], Din[25], Din[33], Din[41], Din[49], Din[57]};

endmodule

module IP_1(
    input [63:0] Din,
    output [63:0] Dout
    );

assign Dout = {Din[24], Din[56], Din[16], Din[48], Din[8], Din[40], Din[0], Din[32], Din[25], Din[57], Din[17], Din[49], Din[9], Din[41], Din[1], Din[33], Din[26], Din[58], Din[18], Din[50], Din[10], Din[42], Din[2], Din[34], Din[27], Din[59], Din[19], Din[51], Din[11], Din[43], Din[3], Din[35], Din[28], Din[60], Din[20], Din[52], Din[12], Din[44], Din[4], Din[36], Din[29], Din[61], Din[21], Din[53], Din[13], Din[45], Din[5], Din[37], Din[30], Din[62], Din[22], Din[54], Din[14], Din[46], Din[6], Din[38], Din[31], Din[63], Din[23], Din[55], Din[15], Din[47], Din[7], Din[39]};

endmodule
