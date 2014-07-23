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

module crypt_shift_salt_1(
    input [31:0] L,
    input [31:0] R,
    input [67:0] K,
    output [67:0] Kout,
    input CLK,
    output [31:0] L_out,
    output [31:0] R_out
);

wire [55:0] Ktmp;
wire [47:0] Ktmp_in;

shifts_s1 shifts_s1_instance1(K[55:0], Ktmp);
Delay3_salt delay3_instance_s1({K[67:56], Ktmp}, Kout, CLK);

pc2 pc2_instance(Ktmp, Ktmp_in);

crypt_step_salt crypt_step_instance1(
    L,
    R,
    {K[67:56], Ktmp_in},
    CLK,
    L_out,
    R_out
);

endmodule
module crypt_shift_salt_2(
    input [31:0] L,
    input [31:0] R,
    input [67:0] K,
    output [67:0] Kout,
    input CLK,
    output [31:0] L_out,
    output [31:0] R_out
);

wire [55:0] Ktmp;
wire [47:0] Ktmp_in;

shifts_s2 shifts_s2_instance2(K[55:0], Ktmp);
Delay3_salt delay3_instance_s2({K[67:56], Ktmp}, Kout, CLK);

pc2 pc2_instance2(Ktmp, Ktmp_in);

crypt_step_salt crypt_step_instance2(
    L,
    R,
    {K[67:56], Ktmp_in},
    CLK,
    L_out,
    R_out
);

endmodule
