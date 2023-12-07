module regFile_tb ();

//instantiating variables reg is an "input" to the regfile while wire is the "outputs"
reg [31:0] data;
wire [31:0] out1, out2;
reg clk, reset, wEn;
reg [4:0] rs1, rs2, rd;

regFile bob (rd, rs1, rs2, reset, clk, wEn, data, out1, out2); //intantiating regfile

initial //initial values
begin
clk = 0;
reset = 1;
wEn = 1;
data = 32'd2;
rs1 = 5'b00001;
rs2 = 5'b00010;
rd  = 5'b00001;
end

always #5 clk = ~clk; //intantiating clock

initial begin
#10 //allowing time for registers to clear
reset = 0;
#10 //Starting writing to the registers
rd = 5'b00010;
data = 32'd4;
#10
rd = 5'b00011;
data = 32'd8;
#10
rd = 5'b00100;
data = 32'd16;
#10
rd = 5'b00101;
data = 32'd32;
#10
wEn=0; //changing to reading from the regfile
#10
rs1 = 5'b00011;
rs2 = 5'b00100;
#10
rs1 = 5'b00101;
rs2 = 5'b00110;
#20 $stop; //stopping the sim

end
endmodule