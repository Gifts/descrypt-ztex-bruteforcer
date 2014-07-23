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

module SP_block_test;

	// Inputs
	reg [47:0] Din;

	// Outputs
	wire [31:0] P_S;

	// Instantiate the Unit Under Test (UUT)
	SP_block uut (
		.Din(Din), 
		.P_S(P_S)
	);

	initial begin
		// Initialize Inputs
		Din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
Din = 48'b011000010001011110111010100001100110010100100111;
#100;
if(!(P_S == 32'b00100011010010101010100110111011)) $finish; 
	end
      
endmodule

