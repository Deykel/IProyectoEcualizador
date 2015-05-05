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
parameter
			 ancho_p = 23, signo = 1, magnitud = 8, fraccion = 14)
(
input wire [ancho_p-1:0] a1 , a2, b0 , b1 , b2, 
input wire clk, reset, en,
input wire signed [ancho_p-1:0]func_ent,
output wire signed [ancho_p-1:0]func_sal
    );
 

 

wire signed [ancho_p-1:0] fk,fk1,fk2,xa1,xa2,xb0,xb1,xb2,sum_xa1_xa2,sum_xb1_xb2;
wire signed [ancho_p-1:0] fkr,fk2r,xa1r,xa2r,xb0r,xb1r,xb2r,sum_xa1_xa2r,sum_xb1_xb2r;// r registro
 //Registros pipeline
 
RegistroSinEN#(.bits(ancho_p)) Registrofk (.clk(clk),.reset(reset),.dd(fk) ,.qq(fkr)); 
RegistroSinEN#(.bits(ancho_p)) Registrofk2 (.clk(clk),.reset(reset),.dd(fk2) ,.qq(fk2r)); 
RegistroSinEN#(.bits(ancho_p)) Registroxb0 (.clk(clk),.reset(reset),.dd(xb0) ,.qq(xb0r)); 
RegistroSinEN#(.bits(ancho_p)) Registroa1 (.clk(clk),.reset(reset),.dd(xa1) ,.qq(xa1r)); 
RegistroSinEN#(.bits(ancho_p)) Registroa2 (.clk(clk),.reset(reset),.dd(xa2) ,.qq(xa2r)); 
RegistroSinEN#(.bits(ancho_p)) Registrosumaa1 (.clk(clk),.reset(reset),.dd(sum_xa1_xa2) ,.qq(sum_xa1_xa2r)); 
RegistroSinEN#(.bits(ancho_p)) Registrob1 (.clk(clk),.reset(reset),.dd(xb1) ,.qq(xb1r)); 
RegistroSinEN#(.bits(ancho_p)) Registrob2 (.clk(clk),.reset(reset),.dd(xb2) ,.qq(xb2r)); 
RegistroSinEN#(.bits(ancho_p)) Registrosumab1 (.clk(clk),.reset(reset),.dd(sum_xb1_xb2) ,.qq(sum_xb1_xb2r)); 

//suma
Suma #(.ancho(ancho_p)) suma_1( .X(func_ent), .Z(sum_xa1_xa2r), .Y(fk));//listo
Suma #(.ancho(ancho_p)) suma_2( .X(xa1r), .Z(xa2r), .Y(sum_xa1_xa2));//listo
Suma #(.ancho(ancho_p)) suma_3( .X(xb1r), .Z(xb2r), .Y(sum_xb1_xb2));
Suma #(.ancho(ancho_p)) suma_4( .X(sum_xb1_xb2r), .Z(xb0r), .Y(func_sal));

// multiplicaciones

Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_1( .X(fk1) ,.Z(a1), .Y(xa1));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_2( .X(fk2r) ,.Z(a2), .Y(xa2));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_3( .X(fk2r) ,.Z(b2), .Y(xb2));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_4( .X(fk1) ,.Z(b1), .Y(xb1));
Multipli2 #(.ancho(ancho_p), .signo(signo), .magnitud(magnitud), .precision(fraccion)) mult_5( .X(fkr) ,.Z(b0), .Y(xb0));






//registros
registro_nbits #(.bits(ancho_p)) R1(.clk(clk), .en(en), .reset(reset) ,.entrada(fkr) ,.salida(fk1));
registro_nbits #(.bits(ancho_p)) R2(.clk(clk), .en(en), .reset(reset) ,.entrada(fk1) ,.salida(fk2));

endmodule 