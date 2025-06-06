// -------------------------------------------------------------
// 
// File Name: hdlsrc/PIDforVerilog/Filter.v
// Created: 2025-06-05 14:36:24
// 
// Generated by MATLAB 24.2, HDL Coder 24.2, and Simulink 24.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Filter
// Source Path: PIDforVerilog/Discrete PID Controller/Filter
// Hierarchy Level: 2
// Model version: 1.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Filter
          (clk,
           reset,
           enb,
           U,
           Nout,
           Y);


  input   clk;
  input   reset;
  input   enb;
  input   signed [31:0] U;  // sfix32_En16
  input   signed [31:0] Nout;  // sfix32_En16
  output  signed [31:0] Y;  // sfix32_En16


  wire signed [31:0] Disc_Forward_Euler_Filter_out1;  // sfix32_En16


  Disc_Forward_Euler_Filter u_Disc_Forward_Euler_Filter (.clk(clk),
                                                         .reset(reset),
                                                         .enb(enb),
                                                         .U(U),  // sfix32_En16
                                                         .Nout(Nout),  // sfix32_En16
                                                         .Y(Disc_Forward_Euler_Filter_out1)  // sfix32_En16
                                                         );

  assign Y = Disc_Forward_Euler_Filter_out1;

endmodule  // Filter

