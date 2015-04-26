`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:12 04/01/2015 
// Design Name: 
// Module Name:    CSgenerator 
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

module CSgenerator#(N=12,Divisor=2268,N1=8,PULSED=138)(input wire clk,
input wire rst,
output clk_out );


// para generar reloj de 44.1Khz se necesita divisor de 1134	 
reg [N-1:0] valor,valor_sig;
reg [N1-1:0] pulso,pulso_sig;
reg clk_out_sig, clk_act;
reg estado, estado_sig;

//assign sig_valor=valor+1;


assign clk_out=clk_act;

localparam HIGH=1'b1,LOW=1'b0;



always @(posedge clk or posedge rst)
	begin
		if(rst) 
			begin
			estado=0;
			valor=0; 
			pulso=0;
			clk_act=0;
			end
		else
			begin 
			estado=estado_sig;
			clk_act=clk_out_sig;
			valor=valor_sig;
			pulso=pulso_sig;
			end
	end


always@(*)
begin
clk_out_sig=clk_act;
valor_sig=valor;
pulso_sig=pulso;
estado_sig=estado;


	case(estado) 

	HIGH: 
		begin
			if(valor==(Divisor-1))
			begin
			estado_sig=LOW;
			valor_sig=0;
			
			end
			else begin
			estado_sig=HIGH;
			clk_out_sig=1'b1;
			valor_sig=valor+1'b1;
			end


		
		end
		
		
	LOW: 
		begin

		if(pulso==(PULSED-1))
		begin
		estado_sig=HIGH;
		pulso_sig=0;
		end
			else begin
			estado_sig=LOW;
			clk_out_sig=1'b0;
			pulso_sig=pulso+1'b1;
			end
		
		end

		
		
		
		
	endcase

end




endmodule
