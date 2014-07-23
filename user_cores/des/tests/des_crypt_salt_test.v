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

module des_crypt_salt_test;

	// Inputs
	reg [63:0] Din;
	reg [63:0] K;
	reg [11:0] salt;
	reg CLK;

	// Outputs
	wire [67:0] Kout;
	wire [31:0] L_out;
	wire [31:0] R_out;

	// Instantiate the Unit Under Test (UUT)
	descrypt_salt uut (
		.Din(Din), 
		.K(K), 
		.salt(salt), 
		.Kout(Kout), 
		.CLK(CLK), 
		.L_out(L_out), 
		.R_out(R_out)
	);

	initial begin
		// Initialize Inputs
		Din = 0;
		K = 0;
		salt = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		
		// Hash: abcdefgh Salt: AA
		Din = 64'h00;
		K = 64'b1100001011000100110001101100100011001010110011001100111011010000;
		salt = 12'b001100001100;
		
		#19000;
		
		if(!(L_out === 32'h18df29dc)) $finish; 
		if(!(R_out === 32'hdbab5b10)) $finish; 

	end
	initial
	begin
		#100;
		while (1)	
		begin
			CLK = ~CLK;
			#10;

		end;
	end  
	
endmodule

