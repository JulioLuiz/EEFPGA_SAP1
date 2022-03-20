/*

*/

module REG(

	//declaração de ports
	input 				CLK, RST_N, LOAD,
	input[7:0]			DATA_IN, 
	output reg [7:0]	DATA_OUT
);

	//declaração de tipos de dados

	//funcionamento do circuito
	always @(posedge CLK, negedge RST_N)
	begin
		if(RST_N == 0)
			DATA_OUT <= 0;
		else 
			if(LOAD == 1)
				DATA_OUT <= DATA_IN;
	end
	
	
endmodule