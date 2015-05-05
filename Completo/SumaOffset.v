`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    21:06:38 04/28/2015 
// Design Name: 
// Module Name:    SumaOffset 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  Módulo para sumar el offset para que dac lo pueda interpretear 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SumaOffset#(parameter anchosalida = 12, ancho=23)(

//input wire reset,
input wire signed [ancho-1:0] X, 
input wire signed [ancho-1:0] Z,
output wire signed [anchosalida-1:0] Y

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

assign Y=suma[anchosalida-1:0];
endmodule
