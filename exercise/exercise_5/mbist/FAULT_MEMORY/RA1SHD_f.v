module RA1SHD_f(
  CLK,
  CEN,
  WEN,
  A,
  Q,
  D,
  OEN
);
  integer   _addr;
  parameter _BITS = 32;
  parameter _sa_fault = 1'b0; // sa0
  parameter _faulty_bit_0 = 17;
  parameter _faulty_addr_0 = 12'h004;

  input  CLK;
  input  CEN;
  input  WEN;
  input [11:0] A;
  output [31:0] Q;
  input [31:0] D;
  input  OEN;

  wire [_BITS-1:0] _Q_f;
  reg [_BITS-1:0] _Q_tmp;

  wire [11:0] _A;
  reg [11:0] _A_latch;
  assign _A = A;


RA1SHD mem_0(
  .CLK(CLK),
  .CEN(CEN),
  .WEN(WEN),
  .A(A),
  .Q(_Q_f),
  .D(D),
  .OEN(OEN)
);

  always @(posedge CLK) begin
    _A_latch <= _A;
  end
  always @(_A_latch or _Q_f) begin
    if (_A_latch == _faulty_addr_0) begin
      for (_addr = 0; _addr <= _BITS-1; _addr = _addr+1) begin
        if (_addr == _faulty_bit_0) begin
          _Q_tmp[_addr] = _sa_fault;
        end
        else begin
          _Q_tmp[_addr] = _Q_f[_addr];
        end
      end
    end
    else begin
      _Q_tmp = _Q_f;
    end
  end


  assign Q = _Q_tmp;

endmodule
