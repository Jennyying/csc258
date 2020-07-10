module counter(SW, KEY, HEX0, HEX1);
	input [1:0]SW;
	input [0:0]KEY;
	output [6:0]HEX0;
	output [6:0]HEX1;
	wire Connection1;
	wire Connection2;
	wire Connection3;
	wire Connection4;
	wire Connection5;
	wire Connection6;
	wire Connection7;
	wire Connection8;
	wire Connection9;
	wire Connection10;
	wire Connection11;
	wire Connection12;
	wire Connection13;
	wire Connection14;
	wire Connection15;
	//wire Connection16; 
	

	
	flipflop fo(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(SW[1]),
	.q(Connection1)
	);
	assign Connection2 = SW[1] & Connection1;
	
	flipflop f1(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection2),
	.q(Connection3)
	);
	
	assign Connection4 = Connection2 & Connection3;

	flipflop f2(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection4),
	.q(Connection5)
	);
	
	assign Connection6 = Connection4 & Connection5;
	
	flipflop f3(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection6),
	.q(Connection7)
	);
	
	assign Connection8 = Connection6 & Connection7;
	
	flipflop f4(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection8),
	.q(Connection9)
	);
	
	assign Connection10 = Connection8 & Connection9;
	
	flipflop f5(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection10),
	.q(Connection11)
	);
	
	assign Connection12 = Connection10 & Connection11;
	
	
	flipflop f6(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection12),
	.q(Connection13)
	);
	
	assign Connection14 = Connection12 & Connection13;
	
	flipflop f7(
	.clk(KEY[0]),
	.clear_b(SW[0]),
	.enable(Connection14),
	.q(Connection15)
	);
	
	//assign Connection16 = Connection14 & Connection15;
	
	decoder first(
	.SW({Connection2, Connection4, Connection6, Connection8}),
	.HEX0(HEX0)
	);
	
	decoder second(
	.SW({Connection10, Connection12, Connection14, Connection15}),
	.HEX0(HEX1)
	);
	
endmodule

module flipflop (clk, clear_b, enable, q);
	input clk;
	input clear_b;
	input enable;
	output q;
	reg Q;

	always @(posedge clk, negedge clear_b) 
	if (~clear_b) begin
	Q <= 0;
	end
	else if (enable) begin
	Q <= clear_b;
	end
	assign q = Q;
endmodule

module decoder(HEX0, SW);
    input [3:0] SW;
    output [6:0] HEX0;    
    hex0 u0(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[0])
        );
     
     hex1 u1(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[1])
        );
          
     hex2 u2(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[2])
        );
          
     hex3 u3(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[3])
        );
          
     hex4 u4(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[4])
        );
          
     hex5 u5(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[5])
        );
          
     hex6 u6(
        .c3(SW[3]),
        .c2(SW[2]),
        .c1(SW[1]),
          .c0(SW[0]),
        .m(HEX0[6])
        );
          
endmodule
 
module hex0(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & ~c2 & ~c1 & c0 | ~c3 & c2 & ~c1 & ~c0 | c3 & ~c2 & c1 & c0 | c3 & c2 & ~c1& c0;
     
endmodule
 
module hex1(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & c2 & ~c1 & c0 | c2 & c1 & ~c0 | c3 & c1 & c0 | c3 & c2 & ~c1 & ~c0;
     
endmodule
 
module hex2(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & ~c2 & c1 & ~c0 | c3 & c2 & ~c1 & ~c0 | c3 & c2 & c1; 
     
endmodule
 
module hex3(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c2 & ~c1 & c0 | ~c3 & c2 & ~c1 & ~c0 | c2 & c1 & c0 | c3 & ~c2 & c1 & ~c0; 
     
endmodule
 
module hex4(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & c0 | ~c3 & c2 & ~c1 | c3 & ~c2 & ~c1 & c0;
     
endmodule
 
module hex5(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & ~c2 & c0 | ~c3 & ~c2 & c1 |  ~c3 & c1 & c0 |  c3 & c2 & ~c1 & c0;
 
endmodule
 
module hex6(c3, c2, c1, c0, m);
    input c3; //input from decoder
    input c2; //input from decoder
    input c1; //input from decoder
    input c0; //input from decoder
    output m; //output
 
    assign m = ~c3 & ~c2 & ~c1 | ~c3 & c2 & c1 & c0 | c3 & c2 & ~c1 & ~c0;
     
endmodule
