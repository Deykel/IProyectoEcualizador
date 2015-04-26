`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:05 03/02/2015 
// Design Name: 
// Module Name:    ContadorNbits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



module Contador_2_Bits(
	input wire clk_reloj,
	input wire rst_reset,
	//input wire en_enable,
	output reg [1:0] q
    );

initial begin q <= 2'd0; end
always@(posedge clk_reloj)
	if(rst_reset)
		q <= 2'd0;
	else //if(en_enable)
		q <= q + 1'b1;

endmodule
