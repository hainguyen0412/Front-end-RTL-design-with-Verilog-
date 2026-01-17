// Code your design here
module Full_Adder_by1(A,B,Cin,S,Cout);
  input wire A,B,Cin;
  output wire Cout,S;
  
  assign S=(A^B)^Cin;
  assign Cout=(A&B)|(Cin&(A^B));
endmodule
