// -------------------------------------------------------------
// 
// File Name: hdlsrc/PIDforVerilog/Internal_PreInt.v
// Created: 2025-06-05 14:36:24
// 
// Generated by MATLAB 24.2, HDL Coder 24.2, and Simulink 24.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Internal_PreInt
// Source Path: PIDforVerilog/Discrete PID Controller/preInt Signal/Internal PreInt
// Hierarchy Level: 3
// Model version: 1.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Internal_PreInt
          (preInt,
           Out1);


  input   signed [31:0] preInt;  // sfix32_En16
  output  signed [31:0] Out1;  // sfix32_En16




  assign Out1 = preInt;

endmodule  // Internal_PreInt

