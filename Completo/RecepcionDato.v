`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:21 03/14/2015 
// Design Name: 
// Module Name:    RecepcionDato 
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
module RecepcionDato(input wire clk, reset,
input wire ps2d, ps2c, rx_en,
output wire [7:0] dataout

    ); 
	  
wire s,s1; 
wire [7:0] data;
  


ps2_rx ps2receiver(.clk(clk),.reset(reset),.ps2d(ps2d), .ps2c(ps2c), .rx_en(rx_en), .rx_done_tick(s),.dout(data));
ObtenerDato obtenciondato( .ready(s), .clk(clk),.reset(reset), .datain(data), .dataout(dataout));


endmodule
