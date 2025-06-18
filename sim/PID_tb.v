module PID_tb;

reg clk,reset,clk_enable;
reg signed [11:0] Sensor;
reg signed [31:0] SetPoint;
wire ce_out;
wire signed [31:0] out;

PIDforVerilog uut(
	.clk(clk),
	.reset(reset),
	.clk_enable(clk_enable),
	.Sensor(Sensor),
	.SetPoint(SetPoint),
	.ce_out(ce_out),
	.out(out)
);

initial begin 
clk=0;
forever #10 clk=~clk;
end


initial begin
	clk_enable=1;
	reset=1;
	@(negedge clk) reset=0;
	Sensor=12'd1000;
	SetPoint=32'd2000;
	SetPoint=SetPoint<<16;
	#20 clk_enable=0;
	#80 clk_enable=1;
	#10000;
	$stop;	

end

endmodule
