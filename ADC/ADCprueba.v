`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:01 04/06/2015 
// Design Name: 
// Module Name:    ADCprueba 
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
module ADCprueba( input wire [15:0] datos, input wire sck, inicie, output reg miso, output reg siguiente 
    );


wire [0:15] data;
reg [3:0] contador;



assign data=datos;





		always@(negedge sck) 
		begin
		if (inicie) begin
				if(contador==4'd15) 
					begin
					contador=0;
					siguiente=1;
					end
				else begin
				miso=data[contador];
				contador=contador+1'b1;
				siguiente=0;
		     end
			  
		end
		else begin 
		       miso=0;
				contador=0;
				siguiente=0;
		end

		end 
	






endmodule 