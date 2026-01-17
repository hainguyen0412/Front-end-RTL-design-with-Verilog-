`timescale 1ns/1ps

module tb_mux4to1;

  reg x0, x1, x2, x3;
  reg [1:0] s;
  wire y;

  // Instantiate DUT
  mux4to1 dut (
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .s(s),
    .y(y)
  );

  initial begin
    // In header
    $display("Time | x0 x1 x2 x3 | s | y");
    $display("--------------------------------");

    // Monitor tín hiệu
    $monitor("%4t |  %b  %b  %b  %b | %b | %b",
              $time, x0, x1, x2, x3, s, y);

    // Test case 1
    x0 = 0; x1 = 1; x2 = 0; x3 = 1;

    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    // Test case 2
    x0 = 1; x1 = 0; x2 = 1; x3 = 0;

    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    $finish;
  end

endmodule

