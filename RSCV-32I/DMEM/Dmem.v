module Dmem (addr, rW, en, dataIn, dataOut, clk, rst);
input rW, en, clk, rst;
input [9:0] addr;
input[31:0] dataIn;
output reg [31:0] dataOut;

reg[7:0] storage[1023:0];

integer i;

always @(posedge clk) begin
	if (en)
	begin
	
		if(rst) //resets all registers
		begin
			for (i=0; i<1024; i=i+1)
			storage[i]<=8'd0;
		end
		
		else if(rW) //write dataIn to bytes
		begin
			storage[addr]<=dataIn[7:0];
			storage[addr+1]<=dataIn[15:8];
			storage[addr+2]<=dataIn[23:16];
			storage[addr+3]<=dataIn[31:24];
		end
		
		else //read full word starting at address addr
		begin
			dataOut<={storage[addr+3],storage[addr+2],storage[addr+1],storage[addr]};
		end
	end
end

endmodule