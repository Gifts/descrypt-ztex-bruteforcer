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

module Delay(
    input [31:0] Din,
    output [31:0] Dout,
	 input CLK
);

reg [31:0]tmp_out [1:0];
reg CE;

always @(posedge CLK)
begin
	tmp_out[0] <= Din;
	tmp_out[1] <= tmp_out[0];
end

assign Dout = tmp_out[1];

endmodule

module Delay2(
    input [31:0] Din,
    output [31:0] Dout,
	 input CLK
);

reg [31:0]tmp_out ;

always @(posedge CLK)
begin
	tmp_out <= Din;
end

assign Dout = tmp_out;

endmodule

// ============================================================

module Delay3_salt(
    input [67:0] Din,
    output [67:0] Dout,
	 input CLK
);

reg [67:0]tmp_out [1:0];

always @(posedge CLK)
begin
	tmp_out[0] <= Din;
	tmp_out[1] <= tmp_out[0];
end

assign Dout = tmp_out[1];

endmodule

