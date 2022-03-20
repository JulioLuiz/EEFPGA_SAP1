//Unidade de controle

module UC
#(parameter microprog_1 = "EEPROM_1.txt", microprog_2 = "EEPROM_2.txt")
(
	input	CLK_N, RST,
	input 	[3:0] 	INST,
	output   [11:0] 	CW

);

	//Criadas duas memórias 127X8
	reg [7:0] rom_1[0:2**7];
	reg [7:0] rom_2[0:2**7];
	
	//Contador para sincronizar o o ciclo de clock
	reg [2:0] count;
	wire[7:0] addr;
	
	
	initial 
	begin
	//leitura dos dados para as memórias criadas
	$readmemh(microprog_1, rom_1);
	$readmemh(microprog_2, rom_2);
	
	end
	
	
	always @ (posedge CLK_N or posedge RST)
	begin
		if( RST == 1 )
			count <= 0;
			
		else if (count == 4)
			count <= 0;
		
		else
			count <= count + 1;
	end
	
	assign addr = {INST[3:0], 1'b0, count[2:0]};
	
	assign CW = {rom_2[addr][3:0], rom_1[addr][7:0]};
	
endmodule
