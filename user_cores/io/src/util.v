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

module slower(
input CLK,
input SLOWCLK,
input RESET,
output EN_OUT
    );
	reg internal_rst;
	reg cur;

	always @(posedge CLK)
	begin
		if (RESET == 1'b1)
		begin
			cur <= 1'b0;
			internal_rst <= 1'b0;
		end
		else
		begin
			if (SLOWCLK == cur) 
			begin
				cur <= ~cur;
				internal_rst <= 1'b1;
			end
			else if (internal_rst == 1'b1)
			begin
				internal_rst <= 1'b0;
			end
		end
	end

	assign EN_OUT = internal_rst;

endmodule


(* FSM_ENCODING="gray" *)
(* FSM_STYLE="bram" *)
module srl8_to_64(clk, enable, reset, dataIn, ready, result); 
	input clk, enable, reset; 
	input [7:0] dataIn; 

	output ready; 
	output [63:0] result; 
	reg [7:0] regBank[7:0]; 
	reg [3:0] status_int;

	integer i; 

	parameter s1=0, s2=1, s3=2, s4=3, s5=4, s6=5, s7=6, s8=7, s9=8; 

	always @(posedge clk)
	begin
		if (reset == 1)
		begin
			status_int <= s1;
		end else 
		if (enable == 0)
		begin
			regBank[0] <= dataIn; 
			for (i=7; i>0; i=i-1) begin 
				regBank[i] <= regBank[i-1]; 
			end 
		end
		case (status_int)
			s1: if (enable == 0)status_int <= s2;
			s2: if (enable == 0)status_int <= s3;
			s3: if (enable == 0)status_int <= s4;
			s4: if (enable == 0)status_int <= s5;
			s5: if (enable == 0)status_int <= s6;
			s6: if (enable == 0)status_int <= s7;
			s7: if (enable == 0)status_int <= s8;
			s8: if (enable == 0)status_int <= s9;
			s9: begin
				if (enable == 0) 
					status_int <= s2;
				else
					status_int <= s1;
				end
			default: status_int <= s1;
		endcase
	end
	
	assign result = (status_int == s9) ? {regBank[7], regBank[6], regBank[5], regBank[4], regBank[3], regBank[2], regBank[1], regBank[0]} : 64'h0; 
	assign ready = (status_int == s9) ? 1'b0 : 1'b1;
endmodule
