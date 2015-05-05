`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    13:03:40 03/14/2015 
// Design Name: 
// Module Name:    Rec_Val_Trad 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  módulo de recepción PS2 (tomado de proyecto anterior )
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Rec_Val_Trad(input wire clk, reset,
input wire ps2d, ps2c, rx_en,
output wire valida, iniciar,terminar,
output wire [1:0] sel
 
    );
	 
	 
wire [7:0] datos;
wire s;
RecepcionDato recepciondato(.clk(clk), .reset(reset),.ps2d(ps2d), .ps2c(ps2c), .rx_en(rx_en),.dataout(datos)); 
Validacion validar (.datain(datos),.valida(valida),.iniciar(iniciar),.terminar(terminar));
Traduccion traducir( .datain(datos), .sel(sel));
	 

 

endmodule
