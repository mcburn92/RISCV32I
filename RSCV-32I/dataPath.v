module dataPath(clk, en, rst);
input clk, en, rst;

wire [31:0] Inst, reg_rs1, reg_rs2, result, dmemData, signOut;
wire BrEq, BrLT;
wire [3:0] ALUOp;
wire wEn, immSel, ASel, BSel, SSel, ISel, PCSel, BrUn, wBSel, memRW, memEn;

reg [31:0]pc, dataInR, opA, opB;
reg [11:0]signIn, s;


ControlUnit ConUni (Inst, clk, BrEq, BrLT, ALUOp, wEn, immSel, ASel, BSel, SSel, ISel, PCSel, BrUn, wBSel, memRW, memEn);

Imem imem (pc, en, clk, Inst);

regFile regfile (Inst[11:7], Inst[19:15], Inst[24:20], rst, clk, wEn, dataInR, reg_rs1, reg_rs2);

branchComp compare (reg_rs1, reg_rs2, BrUn, BrLT, BrEq);

alu alu (opA, opB, ALUOp, clk, result);

top_dmem dmem (result, reg_rs2, clk, rst, memRW, memEn, dmemData);

signExtender signextend (signIn, signOut);

always @(posedge clk) begin //Creation of muxes using if statements
	if(PCSel) pc<=result;
	else pc<=pc+4;
	
	if(wBSel) dataInR <= result;
	else dataInR <= dmemData;
	
	if(ASel) opA <= pc;
	else opA <= reg_rs1;
	
	if(BSel) opB <= signOut;
	else opB <= reg_rs2;
	
	if(ISel) signIn <= s;
	else signIn <= Inst[31:20];
	
	if(SSel) s <= {Inst[31:25],Inst[11:7]};
	else s <= {Inst[31], Inst[7], Inst[30:25], Inst[11:8]};
	
end

endmodule