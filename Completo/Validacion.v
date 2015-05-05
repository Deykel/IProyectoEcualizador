`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:30 03/14/2015 
// Design Name: 
// Module Name:    Validacion 
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
module Validacion(  input wire [7:0] datain, output reg valida,iniciar,terminar
    );
	 
	 
always@(datain)
	begin
							valida=1'b0;
							iniciar=1'b0;
							terminar=1'b0;
						
				case(datain)
				8'h2C://T
					begin valida=1'b1; end
			    8'h1C://A
					begin valida=1'b1; end
				 8'h32: //B
					begin valida=1'b1; end
				 8'h3A: //M
					begin valida=1'b1; end
				 8'h5A: //terminar=enter
					begin terminar=1'b1;
							valida=1'b0;
							end
				 8'h15: //iniciar=q
					begin iniciar=1'b1;	
							valida=1'b0; 
							end
		
				default: begin 
							valida=1'b0;
							iniciar=1'b0;
							terminar=1'b0;
							end
				endcase
		
	
	end


endmodule
