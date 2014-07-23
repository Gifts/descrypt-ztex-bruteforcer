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

module main_test4;

	// Inputs
	reg [7:0] pc;
	reg CS;
	reg CLK;
	reg RESET;
	reg RESET2;
	reg WR;
	reg RD;
	reg SLOWCLK;
	reg [1:0] fpgaID;

	// Outputs
	wire [7:0] pb;
	wire [7:0] pd;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.pc(pc), 
		.pb(pb), 
		.pd(pd), 
		.CS(CS), 
		.CLK(CLK), 
		.RESET(RESET), 
		.RESET2(RESET2), 
		.WR(WR), 
		.RD(RD), 
		.SLOWCLK(SLOWCLK), 
		.fpgaID(fpgaID)
	);

	initial begin
		// Initialize Inputs
		pc = 0;
		CS = 0;
		CLK = 0;
		RESET = 0;
		RESET2 = 0;
		WR = 0;
		RD = 0;
		SLOWCLK = 0;
		fpgaID = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #300;  
		// Add stimulus here
		CS <= 1;
		WR <= 1;
		
		pc <= 8'h32;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h31;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		
		
		pc <= 8'h61; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h62; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h63; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h64; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h65; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h66; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h67; SLOWCLK <= ~SLOWCLK; #50;
		pc <= 8'h68; SLOWCLK <= ~SLOWCLK; #50;


		WR <= 0;
		#8000;
		WR <= 0;
		RD <= 1;
		#50;
		
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;

		#100;
		
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		SLOWCLK <= ~SLOWCLK; #50;
		






		
		
		
	end
	initial begin		
		#100;
		
		while (1)
		begin
			CLK <= ~CLK;
			#5;
		end
	
	end
	initial begin
		#100;
		#20;
		RESET <= 1;
		#70;
		//#20;
		RESET <= 0;
	end 
	initial begin
		#100;
		#190;
		RESET2 <= 1;
		#70;
		RESET2 <= 0;
	end 
/*
	initial begin
		#1000;
		
		while (1)
		begin
			SLOWCLK <= ~SLOWCLK; #10;
		end
	end      
*/
endmodule

