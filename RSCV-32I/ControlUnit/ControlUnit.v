module ControlUnit(	Inst, clk, BrEq, BrLT,
							ALUOp, wEn, immSel, ASel, BSel, SSel, ISel, PCSel, BrUn, wBSel, memRW, memEn);
input [31:0] Inst;
input clk, BrEq, BrLT;
output reg [3:0] ALUOp;
output reg wEn, immSel, ASel, BSel, SSel, ISel, PCSel, BrUn, wBSel, memRW, memEn;

initial begin
	BrUn 		<= 0;
	ALUOp 	<= 4'b0000;
	wEn 		<= 0;
	immSel 	<= 0;
	ASel		<= 0;
	BSel		<= 0;
	SSel 		<= 0;
	ISel		<= 0;
	PCSel		<= 0;
	wBSel 	<= 0;
	memRW		<= 0;
	memEn		<= 0;
		
end

always @(posedge clk) begin
	if (Inst[6:0]==7'b0110011) begin //R-Type
		ALUOp <= {Inst[30],Inst[14:12]};
		wEn 		<= 1;
		immSel 	<= 0;
		ASel		<= 0;
		BSel		<= 0;
		PCSel		<= 0;
		wBSel 	<= 1;	
		memEn		<= 0;
	end
	else if (Inst[6:0]==7'b0010011) begin //I-Type
		ALUOp <= {1'b0,Inst[14:12]};
		wEn 		<= 1;
		immSel 	<= 1;
		ASel		<= 0;
		BSel		<= 1;
		ISel		<= 0;
		PCSel		<= 0;
		wBSel 	<= 1;	
		memEn		<= 0;
	end
	
	else if (Inst[6:0]==7'b0000011) begin //Load from Dmem
		ALUOp <= 4'b0000;
		wEn 		<= 1;
		immSel 	<= 1;
		ASel		<= 0;
		BSel		<= 1;
		ISel		<= 0;
		PCSel		<= 0;
		wBSel 	<= 0;
		memRW		<= 0;
		memEn		<= 1;
	end
	
	else if (Inst[6:0]==7'b0100011) begin //Store in Dmem
		ALUOp <= 4'b0000;
		wEn 		<= 0;
		immSel 	<= 1;
		ASel		<= 0;
		BSel		<= 1;
		ISel		<= 1;
		SSel		<= 1;
		PCSel		<= 0;
		wBSel 	<= 1;
		memRW		<= 1;
		memEn		<= 1;
	
	end
	
	else if (Inst[6:0]==7'b1100011) begin //B-Type
		ALUOp <= 4'b0000;
		immSel 	<= 1;
		ASel 		<= 1;
		BSel 		<= 1;
		memEn		<= 0;
		SSel		<= 0;
		ISel		<= 1;
		
		
		if (Inst[14:12] == 3'b000) //BEQ
			PCSel <= BrEq;
		else if (Inst[14:12] == 3'b001) //BNE
			PCSel <= ~BrEq;
		else if (Inst[14:12] == 3'b100) //BLT
			PCSel <= BrLT;
		else if (Inst[14:12] == 3'b101) //BGE
			PCSel <= ~BrLT;
	end
	

end


endmodule