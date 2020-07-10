module ALU(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    output [7:0]LEDR;
    output HEX0;
    output HEX1;
    output HEX2;
    output HEX3;
    
    input [7:0]SW;
    input [0:0]KEY;
	 reg [7:0]ALUOut
    wire [4:0]sum0;
    wire [4:0]sum1;
	 wire [7:0]sum5;
	 wire [7:0]sum6;

		
	case1 compile(
    .SW({SW[3:0], 4'b0001}),
     .LEDR(sum1[4:0])
     ); 
     
     case1 aandb(
    .SW(SW[3:0], LEDR[3:0]),
     .LEDR(sum2[4:0])
     );
    
    lab2 hex1(
     .SW(4'b0000),
     .HEX(HEX1)
     );
     
    lab2 hex3(
     .SW(4'b0000),
     .HEX(HEX3)
     );
     
     lab2 hex0(
     .SW(SW[3:0]),
     .HEX(HEX0)
     );
     
     lab2 hex2(
     .SW(SW[7:4]),
     .HEX(HEX2)
     );
    
    lab2 hex4(
     .SW(LEDR[7:4]),
     .HEX(HEX4)
     );
     
     lab2 hex5(
     .SW(LEDR[3:0]),
     .HEX(HEX2)
     );
	  
	  leftshift case5(
	  .a(SW[3:0]),
	  .b(LEDR[3:0]),
	  .c(sum5[7:0])
	  );
	  
	  rightshift case5(
	  .a(SW[3:0]),
	  .b(LEDR[3:0]),
	  .c(sum6[7:0])
	  );
	  
    //reg [7:0]ALUOut;
always @(posedge clock)

begin
	if (SW[9] == 1'b0)
		LEDR[7:0] <= 0;
	else
		case (SW[7:5])
				  3'b000 : begin
						ALUOut[4:0] = sum0[4:0];
						ALUOut[7:5] = 3'b000;
						end
				  3'b001 : begin
						ALUOut[4:0] = sum1[4:0];
						ALUOut[7:5] = 3'b000;
						end
				  3'b010 : begin
						ALUOut[4:0] = SW[3:0] + LEDR[3:0];
						ALUOut[7:5] = 3'b000;
						end
				  3'b011 : begin
						ALUOut[3] = SW[3] ^ LEDR[3];
						ALUOut[2] = SW[2] ^ LEDR[2];
						ALUOut[1] = SW[1] ^ LEDR[1];
						ALUOut[0] = SW[0] ^ LEDR[0];
						ALUOut[7] = SW[3] | LEDR[3];
						ALUOut[6] = SW[2] | LEDR[2];
						ALUOut[5] = SW[1] | LEDR[1];
						ALUOut[4] = SW[0] | LEDR[3];
						end
				  3'b100 : begin
						ALUOut[6:0] = 7'b0000000;
						ALUOut[7] = SW[0] | SW[1] | SW[2] | SW[3] | LEDR[3] | LEDR[2] | LEDR[1] | LEDR[0];
						end
				  3'b101 : begin
						ALUOut[7:0] = sum5[7:0];
						end
				  3'b110 : begin
						ALUOut[7:0] = sum6[7:0];
						end
				  3'b111 : begin
						ALUOut[7:0] = SW[3:0] * LEDR[3:0];
				  
			 default : ALUOut[7:0] = 8'b00000000;
			 endcase
    end
    //assign LEDR[7:0] = Out;
    assign LEDR[7:0] = ALUOut[7:0];
    
endmodule

module case1(LEDR, SW);
    input [7:0]SW;
    output[7:3]LEDR;
    wire Connection1;
    wire Connection2;
    wire Connection3;
    full_adder fa1(.u(SW[3]),
                        .v(SW[7]),
                        .w(0),
                        .s(LEDR[7]),
                        .c(Connection1)
                        );
                        
    full_adder fa2(.u(SW[2]),
                        .v(SW[6]),
                        .w(Connection1),
                        .s(LEDR[6]),
                        .c(Connection2)
                        );
                        
    full_adder fa3(.u(SW[1]),
                        .v(SW[5]),
                        .w(Connection2),
                        .s(LEDR[5]),
                        .c(Connection3)
                        );
                        
    full_adder fa4(.u(SW[0]),
                        .v(SW[4]),
                        .w(Connection3),
                        .s(LEDR[4]),
                        .c(LEDR[3])
                        );
                        
endmodule

module full_adder(u, v, w, s, c);
    output s, c;
    input u, v, w;
    assign s = u^v^w;
    assign c = (u & v)|(w &(u^v));
endmodule

module lab2(HEX, SW);
    input [9:0] SW;
    output [6:0] HEX;

    mux4to1 u0(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .m(HEX[0])
        );

    mux4to1 u1(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .n(HEX[1])
        );          

     mux4to1 u2(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .o(HEX[2])
        );
        
    mux4to1 u3(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .p(HEX[3])
        );
        
    mux4to1 u4(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .q(HEX[4])
        );
        
    mux4to1 u5(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .r(HEX[5])
        );
        
    mux4to1 u6(
        .c0(SW[0]),
        .c1(SW[1]),
        .c2(SW[2]),
          .c3(SW[3]),
        .s(HEX[6])
        );        
endmodule

module leftshift(a, b, c);
	wire [3:0] a, b;
	wire[7:0]c;
	assign c = b << a;
endmodule

module rightshift(a, b, c);
	wire [3:0] a, b;
	wire[7:0]c;
	assign c = b >> a;
endmodule

module mux4to1(c0, c1, c2, c3, m, n, o, p, q, r, s);
    input c0; 
    input c1; 
    input c2; 
    input c3;
    output m; 
    output n;
    output o;
    output p;
    output q;
    output r;
    output s;
  
    assign m = ~c3 & c2 & ~c1 & ~c0 |
     ~c3 & ~c2 & ~c1 & c0 |
     c3 & c2 & ~c1 & c0 |
     c3 & ~c2 & c1 & c0;
     assign n = c3 & c2 & ~c1 & ~c0 |
     ~c3 & c2 & ~c1 & c0 |
     c3 & c1 & c0 |
     c2 & c1 & ~c0;
     assign o = c3 & c2 & ~c1 & ~c0 |
     c3 & c2 & c1 |
     ~c3 & ~c2 & c1 & ~c0;
     assign p = ~c3 & c2 & ~c1 & ~c0 |
     ~c2 & ~c1 & c0 |
     c2 & c1 & c0 |
     c3 & ~c2 & c1 & ~c0;
    assign q = ~c3 & c0|
     ~c3 & c2 & ~c1|
     c3 & ~c2 & ~c1 & c0;
     assign r = ~c3 & ~c2 & c0 |