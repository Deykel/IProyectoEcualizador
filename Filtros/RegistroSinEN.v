`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:11 04/28/2015 
// Design Name: 
// Module Name:    RegistroSinEN 
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
module RegistroSinEN#(parameter bits=12)(

input wire clk, reset ,
input wire [bits-1:0] dd ,
output reg [bits-1:0] qq
);

always @(posedge clk, posedge reset)
begin
if (reset)
qq <= 0;
else 
qq <= dd ;
end
endmodule