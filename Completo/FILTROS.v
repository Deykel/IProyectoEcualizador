`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    22:59:37 04/25/2015 
// Design Name: 
// Module Name:    FILTROS 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  Módulo donde se encuentran los filtros pasabanda bajos,medios,altos
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FILTROS#(parameter ancho = 23,signo=1,magnitud=8,fraccion=14) 

(input wire clk, reset, en,
 input wire signed [ancho-1:0]func_entrada,
 output wire signed [ancho-1:0]ykbajos,ykmedios,ykaltos
    );

wire signed [ancho-1:0] cab1;

filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PHL //filtro pasa alto de frecuencia 20
(.a1(23'b00000000111111110111110), .a2(23'b11111111100000001000010),.b0(23'b00000000011111111011111),
 .b1(23'b11111111000000001000010), .b2(23'b00000000011111111011111), .clk(clk), .reset(reset),.en(en) ,.func_ent(cab1) ,.func_sal(ykbajos));
						 
filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PLL //filtro pasa bajo de frecuencia 200
(.a1(23'b00000000111110101110001), .a2(23'b11111111100001010000111),.b0(23'b00000000000000000000011), 
 .b1(23'b00000000000000000000111), .b2(23'b00000000000000000000011), .clk(clk), .reset(reset) ,.en(en),.func_ent(func_entrada) ,.func_sal(cab1));


wire signed [ancho-1:0] cab2;

filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PHM   //filtro pasa alto de frecuencia 200
(.a1(23'b00000000111110101110001), .a2(23'b11111111100001010000111),.b0(23'b00000000100000000000000),
 .b1(23'b11111111000000000000000), .b2(23'b00000000100000000000000), .clk(clk), .reset(reset),.en(en) ,.func_ent(cab2) ,.func_sal(ykmedios));
			 
		 
filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PLM   //filtro pasa bajo de frecuencia 5K
(.a1(23'b00000000100001000111101), .a2(23'b11111111110100001110110),.b0(23'b00000000000010101010010), 
 .b1(23'b00000000000101010100101), .b2(23'b00000000000010101010010), .clk(clk), .reset(reset) ,.en(en),.func_ent(func_entrada) ,.func_sal(cab2));



wire signed [ancho-1:0] cab3;

filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PHH  //filtro pasa alto de frecuencia 5K
(.a1(23'b00000000100001000111101), .a2(23'b11111111110100001110110),.b0(23'b00000000010011001110010),
 .b1(23'b11111111011001100100011), .b2(23'b00000000010011001110010), .clk(clk), .reset(reset),.en(en) ,.func_ent(cab3) ,.func_sal(ykaltos));
			 
		 
filtro1 #(.ancho_p(ancho), .signo(signo), .magnitud(magnitud), .fraccion(fraccion)) PLH  //filtro pasa bajo de frecuencia 20K
(.a1(23'b11111111001101000101101), .a2(23'b11111111101010110100111),.b0(23'b00000000011010000001011), 
 .b1(23'b00000000110100000010000), .b2(23'b00000000011010000001011), .clk(clk), .reset(reset) ,.en(en),.func_ent(func_entrada) ,.func_sal(cab3));


 



endmodule
