`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:07 04/16/2015 
// Design Name: 
// Module Name:    registro_nbits 
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
 module registro_nbits #(parameter bits = 20)(

	input wire clk, reset,en,
	input wire [bits-1:0] entrada,
	output wire [bits-1:0] salida

    );

reg [bits-1:0] data_siguiente,data;

assign salida=data; 


always @(posedge clk, posedge reset) 
begin 
  if (reset) begin data =0; end
	else  begin data= data_siguiente;
              	end
end


always @*
	begin
	   data_siguiente=data;
		if(en)
		data_siguiente = entrada;
		
	end
	


endmodule
