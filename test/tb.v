`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg [7:0] ui_in;
  wire [7:0] uo_out;
  reg [1:0] uio_in;
  wire [1:0] uio_out;
  wire [1:0] uio_oe;

  // A micro tile with 2 uio pins:
  tt_um_micro_c5r2_d0a user_project (
      .ui_in (ui_in),   // Dedicated inputs
      .uo_out(uo_out),  // Dedicated outputs
      .uio_in(uio_in),  // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe(uio_oe),  // IOs: Enable path
      .clk   (clk),     // clock
      .rst_n (rst_n)    // not reset
  );

endmodule
