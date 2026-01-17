module comparator_1(a,b,lower,equal,greater,c1,c2,c3);
  input wire a;
  input wire b;
  input wire c1, c2, c3;
  output wire lower, equal, greater;
  
  assign lower = c1 | (c2 & ((~a) & b));
  assign equal = c2 & (~( a ^ b));
  assign greater = c3 | (c2 & (a & (~b)));
endmodule
