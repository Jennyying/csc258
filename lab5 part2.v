module mux4to1(d0, d1, d2, d3, so, s1, m);

	input do;
	input d1;
	input d2;
	input d3;
	input s0;
	input s1;
	output m; 

	//assign m = s & v | ~s & u;

endmodule

module divider1(clear_b, Q);
	input clear_b;
	output Q
	reg [25:0] q;
	always @(posedge clock, negedge clear_b) 
	begin
	if (Clear_b == 1‘b0)
	q <= 49999999;
	else if (q == 26'b00000000000000000000000000)
	q <= 49999999;
	else
	q <= q - 1;
	end
	assign Q = q;
endmodule

module divider2(clear_b, Q);
	input clear_b;
	output Q
	reg [26:0] q;
	always @(posedge clock, negedge clear_b) 
	begin
	if (Clear_b == 1‘b0)
	q <= 99999999;
	else if (q == 27'b00000000000000000000000000)
	q <= 99999999;
	else
	q <= q - 1;
	end
	assign Q = q;
endmodule

module divider3(clear_b, Q);
	input clear_b;
	output Q
	reg [26:0] q;
	always @(posedge clock, negedge clear_b) 
	begin
	if (Clear_b == 1‘b0)
	q <= 199999999;
	else if (q == 28'b00000000000000000000000000)
	q <= 199999999;
	else
	q <= q - 1;
	end
	assign Q = q;
endmodule



