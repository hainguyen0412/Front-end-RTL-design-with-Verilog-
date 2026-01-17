// Code your design here
module mux2to1(
  input x0,x1,
  input s,
  output y);
  
  assign y = s ? x1 : x0;
endmodule

module mux4to1(
  input x0,x1,x2,x3,
  input [1:0] s,
  output y);
  
  wire w1, w2;
  mux2to1 m1( .x0(x0), .x1(x1), .s(s[0]), .y(w1));
  mux2to1 m2( .x0(x2), .x1(x3), .s(s[0]), .y(w2));
  mux2to1 m3( .x0(w1), .x1(w2), .s(s[1]), .y(y));
endmodule
