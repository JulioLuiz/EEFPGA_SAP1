/*
	ULA
*/

module ULA(

	//Declaração de ports
		input ADD_SUB,
		input [7:0] AR, BR,
		output reg[7:0] OUT
);
	//Delcaração tipos de dados
	
	//Funcionamento do circuito
		always @(*)
		begin
			if (ADD_SUB == 0)
				OUT <= AR+BR;
			else
				OUT <= AR-BR;
		end
		
endmodule

