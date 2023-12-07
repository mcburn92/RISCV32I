module Imem (addr, en, clk, data);
	input en, clk;
	input [31:0] addr;
	output reg [31:0] data;

	reg[7:0] storage[1023:0];
	

	always @(posedge clk) 
	begin
		if (en) 
		begin
		data <= {storage[addr+3], storage[addr+2], storage[addr+1], storage[addr]};
		end
	end
	
	integer i;
	integer x;
	
	initial 
	begin
	
		x=1;
		for (i=0; i<16; i=i+1)
		begin
		storage[i] <= x;
		x=x+1;
		end
		
	end
endmodule