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

module Eblock(
    input [0:31] R,
    output [0:47] Rout
	 //, input CLK
    );
assign Rout = {R[31], R[0], R[1], R[2], R[3], R[4], R[3], R[4], R[5], R[6], R[7], R[8], R[7], R[8], R[9], R[10], R[11], R[12], R[11], R[12], R[13], R[14], R[15], R[16], R[15], R[16], R[17], R[18], R[19], R[20], R[19], R[20], R[21], R[22], R[23], R[24], R[23], R[24], R[25], R[26], R[27], R[28], R[27], R[28], R[29], R[30], R[31], R[0]};

endmodule
