module adder_tb;

  reg  [7:0] A;
  reg  [7:0] B;
  reg        Cin;
  wire       Cout;
  wire [7:0] S;

  // DUT
  Full_Adder_by8 dut (
    .A   (A),
    .B   (B),
    .Cin (Cin),
    .Cout(Cout),
    .S   (S)
  );

  // ===============================
  // Reference function (Golden model)
  // ===============================
  function automatic [8:0] ref_adder;
    input [7:0] a;
    input [7:0] b;
    input       cin;
    begin
      ref_adder = a + b + cin; // 9-bit result {Cout, Sum}
    end
  endfunction

  // Task to apply stimulus and check result
  task automatic check_result;
    input [7:0] a;
    input [7:0] b;
    input       cin;
    reg   [8:0] expected;
    begin
      A   = a;
      B   = b;
      Cin = cin;
      #1; // wait for DUT to settle

      expected = ref_adder(a, b, cin);

      if ({Cout, S} === expected) begin
        $display("PASS: A=%h B=%h Cin=%b -> Cout=%b S=%h",
                 A, B, Cin, Cout, S);
      end
      else begin
        $display("FAIL: A=%h B=%h Cin=%b | DUT={%b,%h} EXP={%b,%h}",
                 A, B, Cin,
                 Cout, S,
                 expected[8], expected[7:0]);
      end
    end
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, adder_tb);

    // ===============================
    // Test cases
    // ===============================
    check_result(8'h14, 8'h1E, 1'b0); // 20 + 30
    check_result(8'h0A, 8'h0A, 1'b1); // 10 + 10 + 1
    check_result(8'h09, 8'h02, 1'b0); // 9 + 2
    check_result(8'hFF, 8'h01, 1'b0); // overflow case
    check_result(8'h00, 8'h00, 1'b1); // carry in only

    #10;
    $finish;
  end

endmodule

