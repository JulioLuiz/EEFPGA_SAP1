/*
SAP1
*/


module SAP1(

	//declaração de ports
	input clk, mr,	//sinais em comum 
	output [7:0] display,
	
	output [7:0]  	debug_bus,
	output [11:0]  debug_cw
);

	//declaração de tipos de dados
	wire [11:0] cw; //palavra de controle da arquitetura
	wire [7:0] main_bus, mux_bus[5], br_bus; 
	wire [7:0] mar_bus;
	
	//instanciação de módulos do SAP
	
	ULA ula(.ADD_SUB(cw[1]), .AR(mux_bus[3]), .BR(br_bus), .OUT(mux_bus[0]));
	

	REG ir  (	.CLK(clk),  .RST_N(!mr),  .LOAD(cw[7]),  .DATA_IN(main_bus),  .DATA_OUT(mux_bus[1]));

	REG mar (	.CLK(clk),	.RST_N(!mr),  .LOAD(cw[9]),  .DATA_IN(main_bus),  .DATA_OUT(mar_bus));
	
	REG ar  (	.CLK(clk),  .RST_N(!mr),  .LOAD(cw[2]),  .DATA_IN(main_bus),  .DATA_OUT(mux_bus[3]));

	REG br  (	.CLK(clk),  .RST_N(!mr),  .LOAD(cw[5]),  .DATA_IN(main_bus),  .DATA_OUT(br_bus));
	
	REG outr(	.CLK(clk),  .RST_N(!mr),  .LOAD(cw[4]),  .DATA_IN(main_bus),  .DATA_OUT(display));

	MUX mux  (	
	.CW (cw),
	.ULA_BUS (mux_bus [0]),
   .IR_BUS	(mux_bus [1]), 
	.AR_BUS  (mux_bus [3]),
	.PC_BUS	(mux_bus [2]),
	.MEM_BUS (mux_bus [4]),
	.OUT_BUS (main_bus  ));
	
	PC pc( .CLK_N(!clk), .RST_N(!mr), .LOAD(cw[11]), .COUNT(mux_bus[2]));
	
	MEM 
	//#(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4)
	
	mem (.ADDR(mar_bus[3:0]), .MEM_OUT(mux_bus[4]));


	UC uc(.CLK_N(!clk), .RST(mr), .INST(mux_bus[1][7:4]), .CW(cw) );

	assign debug_bus = main_bus;
	assign debug_cw = cw;
	
endmodule

/*  		Control Word

			[0]	EN_ALU
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
