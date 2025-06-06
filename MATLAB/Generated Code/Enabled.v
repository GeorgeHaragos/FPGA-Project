// -------------------------------------------------------------
// 
// File Name: hdlsrc/PIDforVerilog/Enabled.v
// Created: 2025-06-05 14:36:24
// 
// Generated by MATLAB 24.2, HDL Coder 24.2, and Simulink 24.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Enabled
// Source Path: PIDforVerilog/Discrete PID Controller/Anti-windup/Disc. Clamping Parallel/Dead Zone/Enabled
// Hierarchy Level: 5
// Model version: 1.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Enabled
          (preSat,
           DZ_out);


  input   signed [31:0] preSat;  // sfix32_En16
  output  signed [31:0] DZ_out;  // sfix32_En16


  wire signed [31:0] DeadZone_out1;  // sfix32_En16


  assign DeadZone_out1 = (preSat >= 32'sb00001111111111110000000000000000 ? preSat - 32'sb00001111111111110000000000000000 :
              (preSat <= 32'sb11110000000000010000000000000000 ? preSat - 32'sb11110000000000010000000000000000 :
              32'sb00000000000000000000000000000000));

  assign DZ_out = DeadZone_out1;

endmodule  // Enabled

