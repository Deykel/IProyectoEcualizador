`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:11 03/16/2015 
// Design Name: 
// Module Name:    Registro_3 
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
module Registro_3(input wire clk, enable ,input wire [11:0] dd , output  reg [11:0] qq);
	 
reg [11:0] datain;

 
always@(posedge clk)
begin

	if (enable) begin 
	
	datain=dd;
	qq = datain; end
   else begin qq = qq; end 
end

endmodule
