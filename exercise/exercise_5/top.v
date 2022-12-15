module top(
   CLK,
   CEN,
   WEN,
   A,
   Q,
   D,
   OEN);
   
   input CLK;
   input CEN;
   input WEN;
   input [11:0] A;
   input [31:0] D;
   input OEN;
   output [31:0] Q;

RA1SHD MEM(
   CLK,
   CEN,
   WEN,
   A,
   Q,
   D,
   OEN
);

endmodule