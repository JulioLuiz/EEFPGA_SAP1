// Quartus Prime Verilog Template
// Binary counter

module PC
(
	//declaração de ports
	input CLK_N, RST_N, LOAD, // o clock do PC é barrado para que ele disponibilize o endereço de memória previamente aos outros modulos
	output [7:0] COUNT
);

	//declaração de tipos de dados
	reg [3:0] out_count; 	//registrador que será modificado (incrementado) referente ao endereço da memória.
	
	
	
	//funcionamento do circuito
	always @ (posedge CLK_N or negedge RST_N)
	begin
	
		if(RST_N == 0)
			out_count <= 0; 	//Reseta o contador para o endereço 0x0000
			
		else if (LOAD == 1) 	
			out_count <= out_count + 1'b0001;    //Caso L_PC = 1, pula para o próximo endereço
	end
	
	assign COUNT = {4'b0000, out_count};    // os 4 LSB são o endereço
		
endmodule
	
