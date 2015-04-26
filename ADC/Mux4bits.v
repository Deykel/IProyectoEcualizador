`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:11 03/02/2015 
// Design Name: 
// Module Name:    Mux4bits 
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
module Mux4bits(input wire [6:0] a,b,c,d, input wire clk,
input wire [1:0] sel,
output reg [3:0] anodos,output reg [6:0] seg
    );
	 

always @(posedge clk) begin
case(sel)

2'b00:begin 
      seg<=a;
		anodos<=4'b1110;
end


2'b01:begin 
      seg<=b;
		anodos<=4'b1101;
end

2'b10:begin 
      seg<=c;
		anodos<=4'b1011;
end

2'b11:begin 
      seg<=d;
		anodos<=4'b1111;
end




endcase





end





endmodule



