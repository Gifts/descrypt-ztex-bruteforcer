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

module xor_48_salt(
    input [47:0] X,
    input [59:0] Y,
    output reg [47:0] Dout,
    input CLK
    );

wire [47:0] Xtmp;

always @(posedge CLK)
begin
	Dout <= Xtmp ^ Y[47:0];
end

assign Xtmp = {(X[47:36] & (~Y[59:48])) | (Y[59:48] & X[23:12]), X[35:24], (X[23:12] & (~Y[59:48])) | (Y[59:48] & X[47:36]), X[11:0]};

endmodule
