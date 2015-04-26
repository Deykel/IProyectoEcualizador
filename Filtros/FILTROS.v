`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:37 04/25/2015 
// Design Name: 
// Module Name:    FILTROS 
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
module FILTROS#(parameter ancho = 25,signo=1,magnitud=8,fraccion=16) 

(input wire clk, reset, en,
 input wire signed [ancho-1:0]func_entrada,
 output wire signed [ancho-1:0]ykbajos,ykmedios,ykaltos
    );


 localparam [ancho-1:0]
 //Paso bajo

//200
a1_LP200=   25'b1111111100000101000111101, // -1.96    20'b00010000100011110110,
a2_LP200=   25'b0000000001111010111100011, // 0.9605  20'b11111010000111011000,
b0_LP200=   25'b0000000000000000000001101,  // 0.000199    
b1_LP200=   25'b0000000000000000000011010, // 0.0003979
b2_LP200=   25'b0000000000000000000001101,  // 0.000199
 

//5k

a1_LP5k=  25'b1111111101111011100001010, // -1.035*/   20'b00010000100011110110,
a2_LP5k=  25'b0000000000101111000101000, //  0.3678*/ 20'b11111010000111011000,
b0_LP5k=  25'b0000000000001010101001010, // 0.08316
b1_LP5k=  25'b0000000000010101010010011, //  0.1663
b2_LP5k=  25'b0000000000001010101001010, // 0.08316

//20k

a1_LP20k=  25'b0000000011001011101001100, // 1.591  */ 20'b11100110100010110100,
a2_LP20k=  25'b0000000001010100101100101, // 0.6617*/  20'b11110101011010011011,
b0_LP20k=  25'b0000000001101000000101110, // 0.8132
b1_LP20k=  25'b0000000011010000001000010, // 1.626
b2_LP20k=  25'b0000000001101000000101110, // 0.8132



//Paso Alto

//20

a1_HP20=  25'b1111111100000000100000110, // -1.996*/   20'b00011111111011111010,
a2_HP20=  25'b0000000001111111011111010, // 0.996*/    20'b11110000000100000110,
b0_HP20=  25'b0000000001111111101111101, // 0.998
b1_HP20=  25'b1111111100000000100000110, // -1.996
b2_HP20=  25'b0000000001111111101111101, // 0.998

//200

a1_HP200=  25'b1111111100000101000111101, //-1.96*/   20'b00011111010111000011,
a2_HP200=  25'b0000000001111010111100011, //0.9605*/  20'b11110000101000011101,
b0_HP200=  25'b0000000010000000000000000, //1
b1_HP200=  25'b1111111100000000000000000, //-2
b2_HP200=  25'b0000000010000000000000000,   //1

//5K

a1_HP5k=  25'b1111111101111011100001010, //-1.035*/  20'b00010000100011110110,
a2_HP5k=  25'b0000000000101111000101000, //0.3678*/  20'b11111010000111011000,
b0_HP5k=  25'b0000000001001100111000111, //0.6007
b1_HP5k=  25'b1111111101100110010001011, //-1.201
b2_HP5k=  25'b0000000001001100111000111; //0.6007



//banda baja 
filtro_pasa_banda_media #(.ancho(ancho),.signo(signo),.magnitud(magnitud),.fraccion(fraccion), 
.a1H(a1_HP20),.a2H(a2_HP20),.b0H(b0_HP20),.b1H(b1_HP20),.b2H(b2_HP20),
.a1B(a1_LP200),.a2B(a2_LP200),.b0B(b0_LP200),.b1B(b1_LP200),.b2B(b2_LP200)

) BandaBaja ( .clk(clk), .reset(reset), .en(en),.func_entrada(func_entrada),.func_salida(ykbajos));

//banda media

filtro_pasa_banda_media #(.ancho(ancho),.signo(signo),.magnitud(magnitud),.fraccion(fraccion), 
.a1H(a1_HP200),.a2H(a2_HP200),.b0H(b0_HP200),.b1H(b1_HP200),.b2H(b2_HP200),
.a1B(a1_LP5k),.a2B(a2_LP5k),.b0B(b0_LP5k),.b1B(b1_LP5k),.b2B(b2_LP5k)

) BandaMedia ( .clk(clk), .reset(reset), .en(en),.func_entrada(func_entrada),.func_salida(ykmedios));

//banda alta


filtro_pasa_banda_media #(.ancho(ancho),.signo(signo),.magnitud(magnitud),.fraccion(fraccion), 
.a1H(a1_HP5k),.a2H(a2_HP5k),.b0H(b0_HP5k),.b1H(b1_HP5k),.b2H(b2_HP5k),
.a1B(a1_LP20k),.a2B(a2_LP20k),.b0B(b0_LP20k),.b1B(b1_LP20k),.b2B(b2_LP20k)

) BandaAlta ( .clk(clk), .reset(reset), .en(en),.func_entrada(func_entrada),.func_salida(ykaltos));
 
 



endmodule
