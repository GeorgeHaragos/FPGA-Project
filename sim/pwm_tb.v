module pwm_tb;
  reg clk,rst;
  reg [7:0] duty;
  reg pwm_out;
  
  pwm uut(
    .clk(clk),
    .rst(rst),
    .duty(duty),
    .pwm_out(pwm_out)
  );
  
//Clock
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
//test
  initial begin
    rst=1;
    duty=0;
    #20 rst=1'b0;
    duty=8'd128;
    #10000;
    duty=8'd255;
    #10000
    $finish;
  end
  
  initial begin
    $dumpfile("pwm.vcd");
    $dumpvars(0, pwm_tb);
  end
  
endmodule
