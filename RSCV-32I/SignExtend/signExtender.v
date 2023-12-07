module signExtender (in, out);
input [11:0] in;
output reg [31:0] out;

always begin
	if (in[11])
		out <= {20'b11111111111111111111,in};
	else
		out <= {20'b00000000000000000000,in};
end

endmodule