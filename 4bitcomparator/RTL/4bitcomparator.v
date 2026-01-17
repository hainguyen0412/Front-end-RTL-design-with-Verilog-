`include "1bitcomparator.v"
module comparator_4(
    input [3:0]a,
    input [3:0]b,
    output wire  lower, equal, greater);
  
  wire [2:0] c1,c2,c3;
  
  comparator_1 com1 ( a[3], b[3], c1[2], c2[2], c3[2], 0, 1, 0);
  comparator_1 com2 ( a[2], b[2], c1[1], c2[1], c3[1], c1[2], c2[2], c3[2]);
  comparator_1 com3 ( a[1], b[1], c1[0], c2[0], c3[0], c1[1], c2[1], c3[1]);
  comparator_1 com4 ( a[0], b[0], lower, equal, greater, c1[0], c2[0], c3[0]);
  endmodule
