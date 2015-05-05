`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    22:01:34 03/14/2015 
// Design Name: 
// Module Name:    Registro_2 
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
module Registro_2(

input wire clk, reset ,
input wire en ,
input wire [1:0] dd ,
output reg [1:0] qq
);

always @(posedge clk, posedge reset)
if (reset)
qq <= 2'd0;
else if (en)
qq <= dd ;

endmodule
