module branchComp(rs1, rs2, BrUn, BrLT, BrEq);
input [31:0] rs1, rs2;
input BrUn;
output BrLT, BrEq;

assign BrLT = rs1 < rs2;
assign BrEq = rs1 == rs2;

endmodule