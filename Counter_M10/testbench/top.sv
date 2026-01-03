`timescale 1ns/1ps

module tb_counter_m10;

  reg clk;
  reg rst;
  reg d;
  wire [3:0] q;
  wire c;

  // Instantiate DUT
  counter_m10 dut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .c(c)
  );

  // Clock: chu kỳ 10ns
  always #5 clk = ~clk;

  initial begin
    // Khởi tạo
    clk = 0;
    rst = 1;
    d   = 0;

    // Giữ reset
    #12;
    rst = 0;

    // =====================
    // Test đếm lên (d = 0)
    // =====================
    d = 0;
    repeat (12) begin
      #10;
    end

    // =====================
    // Test đếm xuống (d = 1)
    // =====================
    d = 1;
    repeat (12) begin
      #10;
    end

    // Kết thúc mô phỏng
    #20;
    $finish;
  end

  // Monitor kết quả
  initial begin
    $monitor("Time=%0t | rst=%b | d=%b | q=%d | c=%b",
              $time, rst, d, q, c);
  end

endmodule

