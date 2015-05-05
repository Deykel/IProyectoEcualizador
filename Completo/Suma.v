`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:35 04/23/2015 
// Design Name: 
// Module Name:    Suma 
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
module Suma#(parameter ancho = 20)(

//input wire reset,
input wire signed [ancho-1:0] X,
input wire signed [ancho-1:0] Z,
output wire signed [ancho-1:0] Y

    );
	 
reg signed [ancho-1:0]suma;


always@*
	begin
	suma=X+Z;
	//overflow
	if((~X[ancho-1])&(~Z[ancho-1])&(suma[ancho-1]))
		suma={1'b0,{(ancho-1){1'b1}}};
	//underflow
	
	else if((X[ancho-1])&(Z[ancho-1])&(~suma[ancho-1]))
		
		suma={1'b1,{(ancho-1){1'b0}}};
		
	end

assign Y=suma;
endmodule
