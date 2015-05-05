`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    22:02:22 03/14/2015 
// Design Name: 
// Module Name:    FSM1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  máquina de estados para control del PS2 y Mux de salidas 
// Dependencies: 
//
// Revision:  
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM1(
input wire clk, input rst, valida,iniciar,terminar,
output reg ready

    );

//declaración de la señal 

localparam [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;
reg [2:0] estado, est_sig;
reg ready_sig;

//registro de estado

always @(posedge clk)
if (rst) begin
estado <= A;
ready<=0; 
end
else begin
estado <= est_sig;
ready<=ready_sig; 
end
//lógica estado siguiente
initial begin 
estado=0;
end 



always @(*)
begin
est_sig = estado;
ready_sig=0;

case (estado)

 A : 
	begin
		if (iniciar)
			est_sig = B;
		else 
			est_sig = A;
	end
 
 B : 
	begin 
		if (valida)
			begin
				ready_sig = 1'b1;
				est_sig = C;
			end
		else 
		
			est_sig = B;
	end
	
 C: 
	begin
		if (terminar) 
			begin
				ready_sig = 1'b0;
				est_sig = A;
			end 
		else 
			est_sig = C;
	end
 
 endcase
 end
 endmodule
