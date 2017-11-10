// -------------------------------------------------------------
//
// Module: filter
// Generated by MATLAB(R) 9.1 and the Filter Design HDL Coder 3.1.
// Generated on: 2017-11-10 15:51:14
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// TargetDirectory: /Users/xiaoboma/Documents/yanjiusheng/p5/biye/code/matlab����/test-matlab
// TargetLanguage: Verilog
// TestBenchStimulus: step ramp chirp 

// Filter Specifications:
//
// Sample Rate       : N/A (normalized frequency)
// Response          : Bandpass
// Specification     : N,F3dB1,F3dB2
// Filter Order      : 6
// Second 3-dB Point : 0.25
// First 3-dB Point  : 0.125
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
// Folding Factor        : 1
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time IIR Filter (real)
// -------------------------------
// Filter Structure    : Direct-Form II, Second-Order Sections
// Number of Sections  : 3
// Stable              : Yes
// Linear Phase        : No
// -------------------------------------------------------------




`timescale 1 ns / 1 ns

module filter
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   [63:0] filter_in; //double
  output  [63:0] filter_out; //double

////////////////////////////////////////////////////////////////
//Module Architecture: filter
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter scaleconst1 = 1.7873827032562439E-01; //double
  parameter coeff_b1_section1 = 1.0000000000000000E+00; //double
  parameter coeff_b2_section1 = 0.0000000000000000E+00; //double
  parameter coeff_b3_section1 = -1.0000000000000000E+00; //double
  parameter coeff_a2_section1 = -1.2969541761387045E+00; //double
  parameter coeff_a3_section1 = 7.8230849810094916E-01; //double
  parameter scaleconst2 = 1.7873827032562439E-01; //double
  parameter coeff_b1_section2 = 1.0000000000000000E+00; //double
  parameter coeff_b2_section2 = 0.0000000000000000E+00; //double
  parameter coeff_b3_section2 = -1.0000000000000000E+00; //double
  parameter coeff_a2_section2 = -1.7134297695432550E+00; //double
  parameter coeff_a3_section2 = 8.6766212965356448E-01; //double
  parameter scaleconst3 = 1.6591068104035048E-01; //double
  parameter coeff_b1_section3 = 1.0000000000000000E+00; //double
  parameter coeff_b2_section3 = 0.0000000000000000E+00; //double
  parameter coeff_b3_section3 = -1.0000000000000000E+00; //double
  parameter coeff_a2_section3 = -1.4142135623730951E+00; //double
  parameter coeff_a3_section3 = 6.6817863791929910E-01; //double
  // Signals
  real input_register; // double
  real scale1; // double
  real scaletypeconvert1; // double
  // Section 1 Signals 
  real a1sum1; // double
  real a2sum1; // double
  real b1sum1; // double
  real delay_section1 [0:1] ; // double
  real inputconv1; // double
  real a2mul1; // double
  real a3mul1; // double
  real b1mul1; // double
  real b3mul1; // double
  real scale2; // double
  real scaletypeconvert2; // double
  // Section 2 Signals 
  real a1sum2; // double
  real a2sum2; // double
  real b1sum2; // double
  real delay_section2 [0:1] ; // double
  real inputconv2; // double
  real a2mul2; // double
  real a3mul2; // double
  real b1mul2; // double
  real b3mul2; // double
  real scale3; // double
  real scaletypeconvert3; // double
  // Section 3 Signals 
  real a1sum3; // double
  real a2sum3; // double
  real b1sum3; // double
  real delay_section3 [0:1] ; // double
  real inputconv3; // double
  real a2mul3; // double
  real a3mul3; // double
  real b1mul3; // double
  real b3mul3; // double
  real output_typeconvert; // double
  real output_register; // double

  // Block Statements
  always @ (posedge clk or posedge reset)
    begin: input_reg_process
      if (reset == 1'b1) begin
        input_register <= 0.0000000000000000E+00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          input_register <= $bitstoreal(filter_in);
        end
      end
    end // input_reg_process

  always @* scale1 <= input_register * scaleconst1;

  always @* scaletypeconvert1 <= scale1;


  //   ------------------ Section 1 ------------------

  always @ (posedge clk or posedge reset)
    begin: delay_process_section1
      if (reset == 1'b1) begin
        delay_section1[0] <= 0.0000000000000000E+00;
        delay_section1[1] <= 0.0000000000000000E+00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section1[1] <= delay_section1[0];
          delay_section1[0] <= a1sum1;
        end
      end
    end // delay_process_section1

  always @* inputconv1 <= scaletypeconvert1;


  always @* a2mul1 <= delay_section1[0] * coeff_a2_section1;

  always @* a3mul1 <= delay_section1[1] * coeff_a3_section1;

  always @* b1mul1 <= a1sum1;


  always @* b3mul1 <= -delay_section1[1];

  always @* a2sum1 <= inputconv1 - a2mul1;

  always @* a1sum1 <= a2sum1 - a3mul1;

  always @* b1sum1 <= b1mul1 + b3mul1;

  always @* scale2 <= b1sum1 * scaleconst2;

  always @* scaletypeconvert2 <= scale2;


  //   ------------------ Section 2 ------------------

  always @ (posedge clk or posedge reset)
    begin: delay_process_section2
      if (reset == 1'b1) begin
        delay_section2[0] <= 0.0000000000000000E+00;
        delay_section2[1] <= 0.0000000000000000E+00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section2[1] <= delay_section2[0];
          delay_section2[0] <= a1sum2;
        end
      end
    end // delay_process_section2

  always @* inputconv2 <= scaletypeconvert2;


  always @* a2mul2 <= delay_section2[0] * coeff_a2_section2;

  always @* a3mul2 <= delay_section2[1] * coeff_a3_section2;

  always @* b1mul2 <= a1sum2;


  always @* b3mul2 <= -delay_section2[1];

  always @* a2sum2 <= inputconv2 - a2mul2;

  always @* a1sum2 <= a2sum2 - a3mul2;

  always @* b1sum2 <= b1mul2 + b3mul2;

  always @* scale3 <= b1sum2 * scaleconst3;

  always @* scaletypeconvert3 <= scale3;


  //   ------------------ Section 3 ------------------

  always @ (posedge clk or posedge reset)
    begin: delay_process_section3
      if (reset == 1'b1) begin
        delay_section3[0] <= 0.0000000000000000E+00;
        delay_section3[1] <= 0.0000000000000000E+00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section3[1] <= delay_section3[0];
          delay_section3[0] <= a1sum3;
        end
      end
    end // delay_process_section3

  always @* inputconv3 <= scaletypeconvert3;


  always @* a2mul3 <= delay_section3[0] * coeff_a2_section3;

  always @* a3mul3 <= delay_section3[1] * coeff_a3_section3;

  always @* b1mul3 <= a1sum3;


  always @* b3mul3 <= -delay_section3[1];

  always @* a2sum3 <= inputconv3 - a2mul3;

  always @* a1sum3 <= a2sum3 - a3mul3;

  always @* b1sum3 <= b1mul3 + b3mul3;

  always @* output_typeconvert <= b1sum3;


  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 0.0000000000000000E+00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out = $realtobits(output_register);
endmodule  // filter