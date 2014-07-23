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

module shifts_s1(
    input [55:0] Din,
    output [55:0] Dout
    );

parameter shift_count = 1;

wire [27:0] L;
wire [27:0] R;
wire [55:0] Dtmp;

assign L = Din[55:28];
assign R = Din[27:0];

assign Dtmp = {(L << shift_count) | (L >> (28-shift_count)), (R << shift_count) | (R >> (28-shift_count))};

assign Dout = Dtmp;

endmodule


module shifts_s2(
    input [55:0] Din,
    output [55:0] Dout
    );

parameter shift_count = 2;

wire [27:0] L;
wire [27:0] R;

assign L = Din[55:28];
assign R = Din[27:0];

assign Dout = {(L << shift_count) | (L >> (28-shift_count)), (R << shift_count) | (R >> (28-shift_count))};

endmodule
