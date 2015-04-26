`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:59 02/27/2015 
// Design Name: 
// Module Name:    divisorclk 
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

 module divisorclk(input wire clk,output reg clk_out);
   
    reg rst;
    reg [17:0] counter;

initial begin
rst<=1;
counter<=18'd0;
clk_out <=1'b0;
end

    always @(posedge clk )
    begin
      if(!rst)
       begin
       rst=1; 
       counter<=20'd0;
       clk_out <= 1'b0;
       end
     else
       if(counter==18'd262143) //va convertir un clk de 100mhz a un hz
         begin
         counter<=18'd0;
         clk_out <= ~clk_out;
         end
      else
       begin
       counter<=counter+1'b1;
       end
   end


endmodule


