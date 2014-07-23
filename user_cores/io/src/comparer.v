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

module comparer #(parameter width=63)(
	input [width:0] Din,
	input [width:0] test,
	input CLK,
	input reset,
	output [width:0] Dout,
	output good
);

reg [width:0] Dtmp;
reg tmpgood;


always @(posedge CLK)
begin
	if (reset == 1)
	begin
		Dtmp <= 64'b0;
		tmpgood <= 1;
	end
	else
	begin
		Dtmp <= Din;
		if (test != 64'b0)
			tmpgood <= 1;
		else
			tmpgood <= 0;
	end
end

assign Dout = Dtmp;
assign good = ~tmpgood;

endmodule
