module Imem_tb ();
reg en, clk;
reg [31:0] addr;
wire [31:0] data;

Imem imem(addr, en, clk, data);

initial begin
en<=1;
clk<=0;
addr<=32'd0;
end

always #5 clk <= ~clk;

integer i;

initial begin
for(i=0; i<16; i=i+1)
#10
addr<=addr+32'd1;
$stop;
end

endmodule