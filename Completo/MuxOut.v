`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    23:05:21 04/27/2015 
// Design Name: 
// Module Name:    MuxOut 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  Multiplexor para elegir las señales ya sea de bajos,medios,altos o señal completa para enviarla a la salida
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MuxOut#(parameter ancho=23,selector=2)(input wire [ancho-1:0] a,b,c,d, 
input wire [selector-1:0] sel,
output reg [ancho-1:0] Out);
	 

always @* 
	begin
		case(sel) //selección de la entrada que se mostrará en la salida

		2'b00:begin 
			Out<=a;
				end


		2'b01:begin 
			Out<=b;
		
			end

		2'b10:begin 
			Out<=c;
		
			end

		2'b11:begin 
			Out<=d;
		
		end

		endcase
	end

endmodule




