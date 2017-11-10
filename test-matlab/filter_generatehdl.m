function filter_generatehdl(filtobj)
%  FILTER_GENERATEHDL   Function to generate HDL for filter object.
%  Generated by MATLAB(R) 9.1 and the Filter Design HDL Coder 3.1.
%  Generated on: 2017-11-10 15:51:30
%  -------------------------------------------------------------
%  HDL Code Generation Options:
%  TargetDirectory: /Users/xiaoboma/Documents/yanjiusheng/p5/biye/code/matlab����/test-matlab
%  TargetLanguage: Verilog
%  TestBenchStimulus: step ramp chirp 
%  GenerateHDLTestbench: on
% 
%  Filter Settings:
%  Discrete-Time IIR Filter (real)
%  -------------------------------
%  Filter Structure    : Direct-Form II, Second-Order Sections
%  Number of Sections  : 3
%  Stable              : Yes
%  Linear Phase        : No

%  -------------------------------------------------------------

% Generating HDL code
generatehdl(filtobj, 'TargetDirectory', '/Users/xiaoboma/Documents/yanjiusheng/p5/biye/code/matlab����/test-matlab',... 
               'TargetLanguage', 'Verilog',... 
               'TestBenchStimulus',  {'step', 'ramp', 'chirp'},... 
               'GenerateHDLTestbench', 'on');

% [EOF]