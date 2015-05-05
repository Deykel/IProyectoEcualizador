`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    21:29:25 04/28/2015 
// Design Name: 
// Module Name:    RegistroNbits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Registro 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RegistroNbits#(parameter bits=23)(

input wire clk, reset ,
input wire en ,
input wire [bits-1:0] dd ,
output reg [bits-1:0] qq
);

always @(posedge clk, posedge reset)
if (reset)
qq = 0;
else if (en)
qq = dd ;

endmodule
