`timescale 1ns/1ps

module tb_counter_m100;

  reg clk;
  reg rst;
  reg d;
  wire [3:0] q_donvi;
  wire [3:0] q_chuc;

  // DUT
  counter_m100 dut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q_donvi(q_donvi),
    .q_chuc(q_chuc)
  );

  // Clock 10ns
  always #5 clk = ~clk;

  initial begin
    // Init
    clk = 0;
    rst = 1;
    d   = 0;

    // Reset
    #12;
    rst = 0;

    // =====================
    // ĐẾM LÊN (00 → 99)
    // =====================
    d = 0;
    repeat (120) begin
      #10;
    end

    // =====================
    // ĐẾM XUỐNG (99 → 00)
    // =====================
    d = 1;
    repeat (120) begin
      #10;
    end

    #20;
    $finish;
  end

  // Monitor
  initial begin
    $monitor("T=%0t | d=%b | CHUC=%0d | DONVI=%0d",
              $time, d, q_chuc, q_donvi);
  end

endmodule

