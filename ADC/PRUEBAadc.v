`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:33 04/14/2015 
// Design Name: 
// Module Name:    PRUEBAadc 
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
module PRUEBAadc(input wire clk, rst, miso, output sck_out, output [11:0]leds, output wire CS,busy, output wire [3:0] anodos, output wire [6:0] segmentos
    );
	 
	 
	 
wire [15:0] data;
//control para 7 segmentos 
Control7segmentos control( .clk(clk), .rst(rst), .entrada(leds), .anodos(anodos),.seg(segmentos));

//master 
CSgenerator#(.N(12),.Divisor(2268),.N1(8),.PULSED(138)) GENERADOR_cs (.clk(clk),.rst(rst),.clk_out(CS) );

MASTER3 master( .clk(clk), .rst(rst),.inicie(CS), .miso(miso), .ready1(ready1), .busy(busy), .sck_out(sck_out), .data_out1(data));
	 
Registro_3 registro (.clk(clk),.enable(ready1) ,.dd(data[11:0]) , .qq(leds));

endmodule
