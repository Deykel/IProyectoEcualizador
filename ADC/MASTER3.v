`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:33 04/01/2015 
// Design Name: 
// Module Name:    MASTER3 
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
module MASTER3( input wire clk, rst, miso, inicie, output  ready1, output wire busy, sck_out, output [15:0] data_out1
    );
	 
	 
	 

//CSgenerator#(.N(12),.Divisor(2268),.N1(8),.PULSED(138)) GENERADOR_cs (.clk(clk),.rst(rst),.clk_out(x) );

Master2    Master ( .clk(clk), .rst(rst),.start(inicie),.miso(miso), .ready1(ready1), .busy(busy), .sck_out(sck_out), .data_out1(data_out1));


endmodule
