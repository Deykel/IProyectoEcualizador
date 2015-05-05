`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// 
// Create Date:    16:40:18 04/29/2015 
// Design Name: 
// Module Name:    PruebaDAC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Módulo para el control del DAC
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PruebaDAC( input wire clk, rst,  input wire[11:0] datain,  output wire  CS2,sck_out, output reg  mosi1
    );

 
wire x;

CSgenerator#(.N(12),.Divisor(2268),.N1(8),.PULSED(138)) generador(.clk(clk),.rst(rst),.clk_out(CS2) ); //generador de CS para el DAC
MasterOut   salida( .clk(clk),.rst(rst),.start(CS2), .datain({3'b0,datain,1'b0}), .sck_out(sck_out),.mosi1(x));                                               //16 bits 12 de datos 4 ceros 

always@(posedge clk) begin
if(rst) mosi1=0; 
else 
mosi1=x;

end


endmodule
