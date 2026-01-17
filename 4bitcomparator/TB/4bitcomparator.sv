module testcomp; 
  reg [3:0] a,b;
   wire lo,eq,gr;

  comparator_4 dut (
    .a(a),
    .b(b),
    .lower(lo),
    .equal(eq),
    .greater(gr)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    a = 0;
    repeat (6) begin
      b = 0;
      repeat (6) begin
        #10
        $display ( "Testing %d and %d yields equal=%d, lower=%d, greater=%d" , a, b, eq, lo, gr);
        if (a == b && eq != 1'b1 && lo != 1'b0 && gr != 1'b0)begin
          $display ("ERROR");
        end
        if (a > b && eq != 1'b0 && lo != 1'b0 && gr != 1'b1)begin
          $display ("ERROR");
        end
        if (a < b && eq != 1'b0 && lo != 1'b1 && gr != 1'b0)begin
          $display ("ERROR");
        end
        b = b + 1;
      end
      a = a +1;
    end
  $display("PASSED");
  #10;
  $finish;
  end
endmodule
