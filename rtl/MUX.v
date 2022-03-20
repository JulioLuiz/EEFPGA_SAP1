/*
	MUX
*/

module MUX(

	//Declaração de ports
		input [11:0] CW,
		input [7:0] ULA_BUS, IR_BUS, AR_BUS, PC_BUS, MEM_BUS, 		
		output reg[7:0] OUT_BUS
);
	//Delcaração tipos de dados
	
	//Funcionamento do circuito
		always @(*)
		begin
		
			if (CW[0] == 1)
				OUT_BUS <= ULA_BUS;
				
			else if (CW[3] == 1)
				OUT_BUS <= AR_BUS;
			
			else if (CW[6] == 1)
				OUT_BUS <= IR_BUS;
				
			else if (CW[8] == 1)
				OUT_BUS <= MEM_BUS;
			
			else if (CW[10] == 1)
				OUT_BUS <= PC_BUS;
						
		end
		
endmodule

/* CW[11] = [0]	EN_ULA
				[1]	/ADD_SUB
				[2]	L_AR
				[3]	EN_AR
				[4]	L_OUT
				[5]	L_BR
				[6]	EN_IR
				[7]	L_IR
				[8]	EN_MEM
				[9]	L_MAR
				[10]	EN_PC
				[11]	L_PC
*/	


