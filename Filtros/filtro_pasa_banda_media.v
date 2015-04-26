`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:49 04/18/2015 
// Design Name: 
// Module Name:    filtro_pasa_banda_media 
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
module filtro_pasa_banda_media #(parameter ancho = 25,signo=1,magnitud=8,fraccion=16, 
a1H=25'b1111111111111111111111111,a2H=25'b0000000000000000000000000,b0H=25'b1111111111111111111111111,b1H=25'b1111110000011111111111111,b2H=25'b0000000000000000000000010,
a1B=25'b0000000000000000000000000,a2B=25'b0000000000000000000000001,b0B=25'b0000000000000000000000000,b1B=25'b1111111111111111111111111,b2B=25'b0000000000000000000000000

)


( 

input wire clk, reset, en,
input wire signed [ancho-1:0]func_entrada,
output wire signed [ancho-1:0]func_salida

    );
	 

wire signed [ancho-1:0] cab1;

filtro1 #(.a1(a1H), .a2(a2H), 
			.b0(b0H), .b1(b1H), .b2(b2H), 
			.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) paso_alto_med(.clk(clk), .reset(reset),.en(en) ,.func_ent(cab1) ,.func_sal(func_salida));
			 
			 
filtro1 #(.a1(a1B), .a2(a2B), 
			.b0(b0B), .b1(b1B), .b2(b2B), 
			.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) paso_bajo_med(.clk(clk), .reset(reset) ,.en(en),.func_ent(func_entrada) ,.func_sal(cab1));

endmodule
