`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:43 02/24/2015 
// Design Name: 
// Module Name:    BCD_to_7seg 
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
module BCD_to_7seg(input wire [3:0] d,input wire clk,
output reg [6:0] seg // seg será a,b,c,d,e,f,g,h de los 7 segmentos siendo a el menos significativo
    );
	 

reg [6:0] seg_sig;
//initial begin seg<=0; end	 
always@(posedge clk) 
begin
seg=seg_sig;
end

// body 
always @(*) begin
   seg_sig=seg;
	case (d)         //gfedcba
	4'b0000: seg_sig = 7'b1000000; //0
	4'b0001: seg_sig = 7'b1111001; //1
	4'b0010: seg_sig = 7'b0100100; //2
	4'b0011: seg_sig = 7'b0110000; //3
	4'b0100: seg_sig = 7'b0011001; //4
	4'b0101: seg_sig = 7'b0010010; //5
	4'b0110: seg_sig = 7'b0000010; //6
	4'b0111: seg_sig = 7'b1111000; //7
	4'b1000: seg_sig = 7'b0000000; //8
	4'b1001: seg_sig = 7'b0011000; //9
	4'b1010: seg_sig = 7'b0001000; //A
	4'b1011: seg_sig = 7'b0000011; //B
	4'b1100: seg_sig = 7'b1000110; //C
	4'b1101: seg_sig = 7'b0100001; //D
	4'b1110: seg_sig = 7'b0000110; //E
	4'b1111: seg_sig = 7'b0001110; //F
	
	endcase 
end
endmodule
