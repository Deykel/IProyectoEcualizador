`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:52 03/14/2015 
// Design Name: 
// Module Name:    Traduccion 
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
module Traduccion( input wire [7:0] datain, output reg [1:0] sel);
	 
// temp[6:2] puerta[1] presencia[0]	 
always@(datain)
	begin
		
		
				case(datain)
				8'h2C://T
					begin sel<=2'b00; end
			   8'h32://B
					begin sel<=2'b01; end
				 8'h3A: //M
					begin sel<=2'b10; end
				 8'h1C: //A
					begin sel<=2'b11; end
				default: begin 
				sel<=2'b00;	
				
				end
				endcase
		
	
	end

	 
	 



endmodule
