// -------------------------------------------------------------
// 
// File Name: hdlsrc/PIDforVerilog/Sum.v
// Created: 2025-06-05 14:36:24
// 
// Generated by MATLAB 24.2, HDL Coder 24.2, and Simulink 24.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Sum
// Source Path: PIDforVerilog/Discrete PID Controller/Sum
// Hierarchy Level: 2
// Model version: 1.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Sum
          (P,
           I,
           D,
           Out1);


  input   signed [31:0] P;  // sfix32_En16
  input   signed [31:0] I;  // sfix32_En16
  input   signed [31:0] D;  // sfix32_En16
  output  signed [31:0] Out1;  // sfix32_En16


  wire signed [31:0] Sum_PID_out1;  // sfix32_En16


  Sum_PID u_Sum_PID (.P(P),  // sfix32_En16
                     .I(I),  // sfix32_En16
                     .D(D),  // sfix32_En16
                     .Out1(Sum_PID_out1)  // sfix32_En16
                     );

  assign Out1 = Sum_PID_out1;

endmodule  // Sum

