module counter_m10(
	input d, clk, rst,
	output reg [3:0] q,
	output reg c);

  always @(posedge clk or posedge rst) begin
     if(rst) begin 
           q <= 0; 
           c <= 0;
     end   
     else begin
	if(d ==1'd0) begin
	   if(q != 4'd9) begin 
		q <= q + 1'd1;
		c <= 1'b0;
	   end
  	   else begin 
		q <= 4'd0;
		c <= 1'b1;
	   end

 	   
	end
	else begin
	   if(q != 4'd0) begin 
		q <= q - 1'd1;
		c <= 1'b0;
	   end
	   else begin 
		q <= 4'd9;
		c <= 1'b1;
	   end
	end 	
     end   
  end
endmodule

module counter_m100(
	input d, clk, rst,
	output reg [3:0] q_donvi,
	output reg [3:0] q_chuc);
wire c_donvi;
counter_m10 donvi( .clk(clk), .d(d), .rst(rst), .q(q_donvi), .c(c_donvi));

counter_m10 chuc( .clk(c_donvi), .d(d), .rst(rst), .q(q_chuc), .c());
endmodule


	




