`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:45 04/27/2015 
// Design Name: 
// Module Name:    Ecualizador 
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
module Ecualizador#(parameter ancho = 23,signo=1,magnitud=8,fraccion=14)(input wire clk, reset, ps2d, ps2c, rx_en, miso, output wire CS, CS2, sckADC, mosi, sckDAC, busy );


wire [15:0] data;
wire [11:0] datares; // entrada del restador // salida de registro
wire [22:0] resout; //salida del restador //entrada de los filtros 
//Protocolo SPI entrada
CSgenerator#(.N(12),.Divisor(2268),.N1(8),.PULSED(138)) Generador(.clk(clk),.rst(reset),.clk_out(CS) ); //generador de CS para el ADC
Master2    Master ( .clk(clk), .rst(reset),.start(CS),.miso(miso), .ready1(ready1), .busy(busy), .sck_out(sckADC), .data_out1(data)); //master para control del ADC
RegistroNbits#(.bits(12)) registro1(.clk(clk), .reset(reset) ,.en(ready1) ,.dd(data[11:0]) ,.qq(datares)); //Registro donde entra los 12 bits necesarios del adc y se le da enable cada vez que haya un dato nuevo con la bandera de ready1 que genera el master 
                                               
																
																			 											
//Modulo de resta offset                                                                              //-0.5 resta     
ResOffset#(.anchosalida(23),.ancho(23))  RestaOffset(.X({{(9){1'b0}},{datares},2'b0}),.Z(23'b11111111110000000000000),.Y(resout)); // resta del offset que con la que viene la onda desde el exterior
														
//Falta Modulo de resta de offset su salida ira a los filtros y al d del mux
wire [ancho-1:0] muxa,muxb,muxc;
wire [1:0] sel,sel1;

//filtros
FILTROS#(.ancho(ancho),.signo(signo),.magnitud(magnitud),.fraccion(fraccion))  Filtros
(.clk(clk),.reset(reset),.en(ready1), .func_entrada(resout), .ykbajos(muxa),.ykmedios(muxb),.ykaltos(muxc)); // módulo que contiene los 6 filtros necesarios 
                         //habilitacion de registros con cada nuevo dato 
wire [ancho-1:0] amux,bmux,cmux,dmux;
//registros salida de filtros               //habilita cuando hay un dato nuevo



wire [ancho-1:0] sumando,sumafinal;
//mux de salida                                                       //corregir va el muxd
MuxOut#(.ancho(23),.selector(2))  MUX(.a(resout),.b(muxa),.c(muxb),.d(muxc),.sel(sel1),.Out(sumando));

// suma de offset
                                                                  //0.5       /1 
SumaOffset#(.anchosalida(23),.ancho(23)) SumaFinal(.X(sumando),.Z(23'b00000000010000000000000),.Y(sumafinal)); //suma del offset necesario para el DAC 
//salida al DAC
PruebaDAC   MasterSlida ( .clk(clk), .rst(reset)/*, .CS(CS)*/, .datain(sumafinal[fraccion-1:2]),.CS2(CS2),  .sck_out(sckDAC), .mosi1(mosi) ); //Módulo para control del DAC
//MasterOut MasterSalida( .clk(clk),.rst(reset),.start(CS), .datain({4'b0000,sumafinal[fraccion-1:2]}),.sck_out(sckDAC), .mosi1(mosi));


//recepcion ps2
Rec_Val_Trad ModuloRecepcion(.clk(clk),.reset(reset),.ps2d(ps2d),.ps2c(ps2c),.rx_en(rx_en),.valida(valida),.iniciar(iniciar),.terminar(terminar),.sel(sel) ); //Módulo para recepcion del PS2

//registro hacia el mux
Registro_2   Registro (.clk(clk),.reset(reset),.en(pase),.dd(sel),.qq(sel1));//registro para mantener una selección en el mux de salida 

//maquina de estados
FSM1  FSM(.clk(clk),.rst(reset),.valida(valida),.iniciar(iniciar),.terminar(terminar),.ready(pase)); //máquina de estados para control de ps2 y multiplexor





endmodule
