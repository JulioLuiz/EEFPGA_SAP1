// Quartus Prime Verilog Template
// Single Port ROM

module MEM
//#(parameter opcode = "opcode.txt" )
(
	input  [3:0] ADDR,    //são 4 bits de endereço 
	output [7:0] MEM_OUT  //São 8 bits de dados
);

	// Declare the ROM variable
	reg [7:0] rom[0:15]; // Cria-se vetor ROM tipo reg com 8 bits para dados, e ROM    

	// Initialize the ROM with $readmemh.  Put the memory contents
	// in the file MEMORIA_X.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.

	initial
	begin
		$readmemh("opcode.txt", rom);
	end

	assign MEM_OUT = rom[ADDR];

endmodule


