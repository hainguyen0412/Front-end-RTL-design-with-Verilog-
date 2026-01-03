module counter_m10(
	input d, clk, rst,
	output reg [3:0] q,
	output reg c);
  always @(posedge clk or posedge rst) begin
     if(rst) q <= 0;
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
