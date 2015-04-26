`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:26 04/22/2015 
// Design Name: 
// Module Name:    Multipli2 
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
module Multipli2#( parameter ancho = 20, signo = 1, magnitud = 5, precision = 14)(

input wire signed [ancho-1:0] X,
input wire signed [ancho-1:0] Z,
output wire signed [ancho-1:0] Y
    );
	 
//se crea una variable multipiclación que va a ser el doble de del ancho de palaba menos 1.
reg signed [2*ancho-1:0] multi;
reg signed [ancho-1:0] multi2;




 

//Lógica

always @*

	begin
multi = X*Z;
multi2 = {multi[2*ancho-1],multi[(2*precision+magnitud-1):precision]};

 if(X==({(ancho){1'b0}}) || (Z=={(ancho){1'b0}}) ) //caso 0
		begin
			multi2={(ancho){1'b0}};
		end
 else 
	begin
	//overflow
		
		if((X[ancho-1]==Z[ancho-1])&&  (|multi[2*ancho-1:2*precision+magnitud]))//caso +*+ o -*- =-
			
			multi2={1'b0,{(ancho-1){1'b1}}};
			
			
			
	//underflow

   	
		else if((X[ancho-1]!=Z[ancho-1])&&  ~(&multi[2*ancho-1:2*precision+magnitud]))//caso -*+ +*- =-
			
		   multi2={1'b1,{(ancho-1){1'b0}}};
			
			
			
		/*else if( ~(|multi[(2*precision+magnitud-1):2*precision]) && ~(|multi[(2*precision-1):precision+5]) ) //caso 0
		
			multi2={(ancho){1'b0}};
		*/
			
			
	end
			
			
end	
assign Y=multi2;


endmodule
