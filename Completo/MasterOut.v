`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Estudiantes: 
// Deykel Hernández Araya & Kennet Gonzales Nájera
// Create Date:    14:55:51 04/28/2015 
// Design Name: 
// Module Name:    MasterOut 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  modulo master para control del DAC(modificación del módulo del control del ADC )
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MasterOut( input wire clk, rst,start, input wire[15:0] datain,  output wire  sck_out, output  mosi1
    );                                               //16 bits 12 de datos 4 ceros 


	 

	 
// señales a usar 

reg [1:0] estado, estado_sig; // registros para los estados
//reg [15:0] data_out, data_out_sig; // registros para las datos de salida 16bits
reg [3:0] contador,contador_sig;//contador para obtener los 16 datos provenientes del adc
reg [3:0]  i, i_sig; 
//reg ready, ready_sig; // registros que indican si los datos están listos o no 
reg [2:0]  sck,sck_sig; //para contar hasta 4
reg  mosi,mosi_sig; // registros para guardar el dato que viene del ADC




localparam 	IDLE = 2'b00, //nombres para los estados de la máquina
            ESPERA = 2'b01,
            TRANSFERENCIA = 2'b10;

// asignaciones a las salidas 
   
	 //assign busy= estado!=IDLE; // bandera que indica cuando la máquina esta realizando algun conteo 
	 assign sck_out= (estado==TRANSFERENCIA) & (~sck[2]) & ~start ; /* reloj de salida a 12.5MHz, si la máquina se encuentra en el estado para transferir
	 dependera del conteo que se realize con sck el cual cuenta 4 ciclos del reloj general 100MHz para cambiar de estado y así despues de 8 ciclos se genera el reloj que se desea*/
   // assign ready1=ready&~start; //indica cuando el dato completo esta listo 
	// assign data_out1 = data_out; // asignación de los datos de salida 
	 assign mosi1=mosi_sig & ~start;
	 
//initial begin i=4'd15;end
	 

//lógica para FSM
   always @(posedge clk or posedge rst) begin
        if (rst) begin
				estado = IDLE;
				//data_out = 16'b0;
            contador= 4'b0;
				//ready=0;
				
				mosi=0;
				sck=0;
				i=4'd15;
				
				 
        end else begin
				//ready=ready_sig;
				//data_out=data_out_sig;
            estado =estado_sig;
				contador=contador_sig ;
				sck=sck_sig;
				mosi=mosi_sig;
				i=i_sig;
          
        end
    end


// logica

always @(*) begin
      i_sig=i;
		mosi_sig=mosi;
      estado_sig = estado;
      //data_out_sig = data_out;
		contador_sig =contador;
		//ready_sig=ready;
		sck_sig=sck;
        case (estado)
            IDLE: begin
					 sck_sig=0;
			//		 ready_sig = 1'b0;
                contador_sig = 4'b0;
						if (start == 1'b0) 
							begin
								estado_sig = ESPERA;
									i_sig=4'd15;
							end
						
						end
           ESPERA: begin
				
                sck_sig=sck+1'b1;
                if (sck == 3'd2) // tiempo de espera para iniciar el reloj  12.5MHz
						begin
                    sck_sig = 2'b0;
                    estado_sig = TRANSFERENCIA;
						  i_sig=4'd15;
						end
					
            end
            TRANSFERENCIA: begin	
					 sck_sig=sck+1'b1;
                
                if (sck == 3'd4) // espera 4 ciclos de reloj general para cambiar de estado el sck, flanco de bajada 
						begin					
								mosi_sig=datain[i]; // toma el dato en el flanco de bajada CPOL = 0 y CPHA = 1
								
						end
                else if (sck == 3'd7) // espera otros 4 ciclos y cambia de estado el sck, flanco de subida 
						begin
						
						contador_sig = contador + 1'b1;
						i_sig=i-1'b1;
						
						//data_out_sig = {data_out[14:0], miso1}; // concatena el dato en flanco de subida CPOL = 0 y CPHA = 1
						
						if(contador==4'd15)begin // cuenta l6 ciclos para obtener todos los datos que suministra el ADC 
						estado_sig = IDLE;
						contador_sig=0;
						i_sig=4'd15;
				//		ready_sig = 1'b1; //indica que el dato ya esta listo 
						end
						  
                    end
                end
           
        endcase
    end
     
   






endmodule 