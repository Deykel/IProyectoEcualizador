`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:01 04/07/2015 
// Design Name: 
// Module Name:    PruebaSPI 
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
module PruebaSPI( input wire clk, rst, input wire [15:0] datos, output  ready1, output wire busy, siguiente , output [15:0] data_out1
    );


MASTER3 master ( .clk(clk), .rst(rst), .miso(x), .ready1(ready1), .busy(busy), .sck_out(y), .data_out1(data_out1));
ADCprueba ADC( .datos(datos), .sck(y), .inicie(busy), .miso(x), .siguiente(siguiente) );


endmodule
