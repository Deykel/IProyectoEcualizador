`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:42:50 04/18/2015 
// Design Name: 
// Module Name:    filtro1 
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
module filtro1 #(
parameter a1 = 25'b0000000000000000000000000, a2 = 25'b0000000000000000000000000, b0 = 25'b1111111111111111111111111,
          b1 = 25'b0000000000000010000000000, b2 = 25'b1111111111111111111111111, 
			 ancho_p = 20, signo = 1, magnitud = 5, fraccion = 14)
(
input wire clk, reset, en,
input wire signed [ancho_p-1:0]func_ent,
output wire signed [ancho_p-1:0]func_sal
    );
//func_sal=yk 
//func_ent=uk	 
//filtro paso alto 3.5	 

wire signed [ancho_p-1:0] fk,fk1,fk2,xa1,xa2,xb0,xb1,xb2,sum_xa1_xa2,sum_xb1_xb2;
// sumas 
Suma #(.ancho(ancho_p)) suma_1( .X(func_ent), .Z(sum_xa1_xa2), .Y(fk));
Suma #(.ancho(ancho_p)) suma_2( .X(xa1), .Z(xa2), .Y(sum_xa1_xa2));
Suma #(.ancho(ancho_p)) suma_3( .X(xb1), .Z(xb2), .Y(sum_xb1_xb2));
Suma #(.ancho(ancho_p)) suma_4( .X(sum_xb1_xb2), .Z(xb0), .Y(func_sal));

// multiplicaciones

Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_1( .X(fk1) ,.Z(-a1), .Y(xa1));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_2( .X(fk2) ,.Z(-a2), .Y(xa2));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_3( .X(fk2) ,.Z(b2), .Y(xb2));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_4( .X(fk1) ,.Z(b1), .Y(xb1));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_5( .X(fk) ,.Z(b0), .Y(xb0));


//registros
registro_nbits #(.bits(ancho_p)) R1(.clk(clk), .en(en), .reset(reset) ,.entrada(fk) ,.salida(fk1));
registro_nbits #(.bits(ancho_p)) R2(.clk(clk), .en(en), .reset(reset) ,.entrada(fk1) ,.salida(fk2));

endmodule 