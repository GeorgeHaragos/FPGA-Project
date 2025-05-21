module pwm
#(
    parameter PWM_FREQ=25000, 
	parameter CLK_FREQ=500000, //am pus mica frecventa ca sa se poata vedea pe simulare 
	parameter MAX_COUNT=(CLK_FREQ/PWM_FREQ)-1
)  
(
input clk, // Clock 50 MHz sau 25 MHz
input rst,
input [7:0] duty, // Duty cycle 0–255
output reg pwm_out
);

reg [15:0] cnt_reg,cnt_nxt;
reg pwm_reg,pwm_nxt;
  
//Secvential
always @(posedge clk) begin
if(rst)begin
	cnt_reg<=0;
	pwm_reg<=0;
end else begin
	cnt_reg<=cnt_nxt;
  	pwm_reg<=pwm_nxt;
	end
end
  
//Combinational

  always @(*) begin
    cnt_nxt=cnt_reg;
    pwm_nxt=pwm_reg;
    if(cnt_reg==MAX_COUNT)
		cnt_nxt=0;
	else
		cnt_nxt=cnt_reg+1;
    if(cnt_reg<(duty*MAX_COUNT)/255)
		pwm_nxt=1;
    else
      	pwm_nxt=0;
  end
  assign pwm_out=pwm_reg;
endmodule
