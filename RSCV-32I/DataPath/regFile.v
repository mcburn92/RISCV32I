module regFile (rd, rs1, rs2, rst, clk, wEn, dataIn, reg_rs1, reg_rs2);

input wire [4:0] rd, rs1, rs2;
input wire rst, clk, wEn;
input wire [31:0] dataIn;
output reg [31:0] reg_rs1, reg_rs2;

reg [31:0]reg_content[31:0];
integer i;

always @(posedge clk) begin

if (rst) begin
	for(i=0; i<31; i=i+1) begin
	reg_content[i]<=32'b0;
	end
end
else if (wEn) begin
	reg_content[rd]<=dataIn;

end
else begin
	reg_rs1 <= reg_content[rs1];
	reg_rs2 <= reg_content[rs2];
	

end
end
endmodule