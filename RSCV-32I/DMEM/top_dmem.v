module top_dmem (addr, dataIn, clk, rst, rW, en, dataOut);
input[31:0] addr, dataIn;
input clk, rst, en, rW;
output reg [31:0] dataOut;

//Instantiating each dmem's indiviual wires
reg en0, en1, en2, en3, en4, en5, en6, en7;
wire [31:0]dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7;

//Instantiating each dmem chip
Dmem dm0 (addr[9:0], rW, en0, dataIn, dataOut0, clk, rst);
Dmem dm1 (addr[9:0], rW, en1, dataIn, dataOut1, clk, rst);
Dmem dm2 (addr[9:0], rW, en2, dataIn, dataOut2, clk, rst);
Dmem dm3 (addr[9:0], rW, en3, dataIn, dataOut3, clk, rst);
Dmem dm4 (addr[9:0], rW, en4, dataIn, dataOut4, clk, rst);
Dmem dm5 (addr[9:0], rW, en5, dataIn, dataOut5, clk, rst);
Dmem dm6 (addr[9:0], rW, en6, dataIn, dataOut6, clk, rst);
Dmem dm7 (addr[9:0], rW, en7, dataIn, dataOut7, clk, rst);

//Case statement for setting enable pins and Output
always @(posedge clk) begin

	case(addr[12:10])
	3'b000:begin 
				en0 <= en;
				en1 <= 0;
				en2 <= 0;
				en3 <= 0;
				en4 <= 0;
				en5 <= 0;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut0;
			 end
	3'b001:begin 
				en0 <= 0;
				en1 <= en;
				en2 <= 0;
				en3 <= 0;
				en4 <= 0;
				en5 <= 0;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut1;
			 end
	3'b010:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= en;
				en3 <= 0;
				en4 <= 0;
				en5 <= 0;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut2;
			 end
	3'b011:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= 0;
				en3 <= en;
				en4 <= 0;
				en5 <= 0;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut3;
			 end
	3'b100:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= 0;
				en3 <= 0;
				en4 <= en;
				en5 <= 0;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut4;
			 end
	3'b101:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= 0;
				en3 <= 0;
				en4 <= 0;
				en5 <= en;
				en6 <= 0;
				en7 <= 0;
				dataOut <= dataOut5;
			 end
	3'b110:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= 0;
				en3 <= 0;
				en4 <= 0;
				en5 <= 0;
				en6 <= en;
				en7 <= 0;
				dataOut <= dataOut6;
			 end
	3'b111:begin 
				en0 <= 0;
				en1 <= 0;
				en2 <= 0;
				en3 <= 0;
				en4 <= 0;
				en5 <= 0;
				en6 <= 0;
				en7 <= en;
				dataOut <= dataOut7;
			 end
	endcase
	
end

endmodule