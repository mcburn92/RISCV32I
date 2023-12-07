module alu (opA, opB, ALUOp, clk, result);
input [31:0] opA, opB;
input [3:0] ALUOp;
input clk;
output reg [31:0] result;

always @(posedge clk) begin
	case (ALUOp)
		4'b0000: result<=opA + opB; //add
		4'b1000: result<=opA - opB; //sub
		4'b0111: result<=opA & opB; //and
		4'b0110: result<=opA | opB; //or
		4'b0100: result<=opA ^ opB; //xor
		4'b0001: result<=opA << opB; //sll
		4'b0101: result<=opA >> opB; //srl
		default: result<=opA;
	endcase
end


endmodule
		
	 