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

module Fblock_salt(
    input [31:0] R,
    input [59:0] K,
    output [31:0] F_RK,
	 input CLK
    );
	 
wire [47:0] RE;
wire [47:0] RE_x;


Eblock Eblock_instance(R, RE);
xor_48_salt xor_48_instance(RE, K, RE_x, CLK);
SP_block SP_block_instance(RE_x, F_RK);

endmodule
