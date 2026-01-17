module counter_tb;
  reg clk;
  reg rst;
  wire [7:0] Count;
  
  counter count(.clk (clk),
                .rst (rst),
                .count (Count));
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
  
  initial begin
    $monitor ("[%0tns] clk=%0b rst=%0b Count=0x%0h", $time, clk, rst, Count);
    
    // 1. Initialize testbench variables to 0 at start of simulation
    clk <= 0;
    rst <= 0;
    #5
    clk=1;
    rst=1;
    // 2. Drive rest of the stimulus, reset is asserted in between
    #20   rst <= 1;                   
    #30   rst <= 0;
    #40	  rst <= 1;
    #50   rst <= 0;
    
    // 3. Finish the stimulus after 200ns
    #200 $finish;
  end
  always #5 clk=~clk;
endmodule

