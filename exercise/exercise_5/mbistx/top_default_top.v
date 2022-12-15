`default_nettype wire 
`ifdef NETLIST
`else
module top_default (
  top_default_MCK,
  top_default_RSTN,
  top_default_SCK,
  top_default_SDI,
  top_default_SEN,
  top_default_SRST,
  top_default_TPG_1_1_1_A_s,
  top_default_TPG_1_1_1_CEN_s,
  top_default_TPG_1_1_1_CLK_s,
  top_default_TPG_1_1_1_D_s,
  top_default_TPG_1_1_1_OEN_s,
  top_default_TPG_1_1_1_Q_t,
  top_default_TPG_1_1_1_WEN_s,
  top_default_SDO,
  top_default_TPG_1_1_1_A_t,
  top_default_TPG_1_1_1_CEN_t,
  top_default_TPG_1_1_1_CLK_t,
  top_default_TPG_1_1_1_D_t,
  top_default_TPG_1_1_1_OEN_t,
  top_default_TPG_1_1_1_Q_s,
  top_default_TPG_1_1_1_WEN_t
);

input                                   top_default_MCK;
input                                   top_default_RSTN;
input                                   top_default_SCK;
input                                   top_default_SDI;
input                                   top_default_SEN;
input                                   top_default_SRST;
input   [11:0]                          top_default_TPG_1_1_1_A_s;
input                                   top_default_TPG_1_1_1_CEN_s;
input                                   top_default_TPG_1_1_1_CLK_s;
input   [31:0]                          top_default_TPG_1_1_1_D_s;
input                                   top_default_TPG_1_1_1_OEN_s;
input   [31:0]                          top_default_TPG_1_1_1_Q_t;
input                                   top_default_TPG_1_1_1_WEN_s;
output                                  top_default_SDO;
output  [11:0]                          top_default_TPG_1_1_1_A_t;
output                                  top_default_TPG_1_1_1_CEN_t;
output                                  top_default_TPG_1_1_1_CLK_t;
output  [31:0]                          top_default_TPG_1_1_1_D_t;
output                                  top_default_TPG_1_1_1_OEN_t;
output  [31:0]                          top_default_TPG_1_1_1_Q_s;
output                                  top_default_TPG_1_1_1_WEN_t;

wire                                    top_default_GRP_ID;
wire                                    top_default_MEN;
wire                                    top_default_RSTN;
wire                                    top_default_SCK;
wire                                    top_default_SDI;
wire                                    top_default_SDO;
wire                                    top_default_SEN;
wire    [11:0]                          top_default_SEQ1_ADDR;
wire    [4:0]                           top_default_SEQ1_CMD;
wire                                    top_default_SEQ1_CS;
wire                                    top_default_SEQ1_DONE;
wire                                    top_default_SEQ1_GO;
wire    [1:0]                           top_default_SEQ1_OP_CMD;
wire                                    top_default_SEQ1_PARITY;
wire                                    top_default_SRST;
wire    [11:0]                          top_default_TPG_1_1_1_A_m;
wire                                    top_default_TPG_1_1_1_CEN_m;
wire                                    top_default_TPG_1_1_1_CS0;
wire    [31:0]                          top_default_TPG_1_1_1_D_m;
wire                                    top_default_TPG_1_1_1_GO;
wire                                    top_default_TPG_1_1_1_OEN_m;
wire    [31:0]                          top_default_TPG_1_1_1_Q_m;
wire                                    top_default_TPG_1_1_1_WEN_m;

top_default_controller top_default_ctr (
  .top_default_MCK(top_default_MCK),
  .top_default_RSTN(top_default_RSTN),
  .top_default_SCK(top_default_SCK),
  .top_default_SDI(top_default_SDI),
  .top_default_SEN(top_default_SEN),
  .top_default_SEQ1_DONE(top_default_SEQ1_DONE),
  .top_default_SEQ1_GO(top_default_SEQ1_GO),
  .top_default_SRST(top_default_SRST),
  .top_default_GRP_ID(top_default_GRP_ID),
  .top_default_MEN(top_default_MEN),
  .top_default_SDO(top_default_SDO),
  .top_default_SEQ1_CMD(top_default_SEQ1_CMD),
  .top_default_SEQ1_CS(top_default_SEQ1_CS)
);

top_default_sequencer1 top_default_seq1 (
  .top_default_CMD(top_default_SEQ1_CMD),
  .top_default_GRP_ID(top_default_GRP_ID),
  .top_default_MCK(top_default_MCK),
  .top_default_RST(top_default_RSTN),
  .top_default_SEQ_CS(top_default_SEQ1_CS),
  .top_default_TPG_1_1_GO(top_default_TPG_1_1_1_GO),
  .top_default_SEQ_ADDR(top_default_SEQ1_ADDR),
  .top_default_SEQ_DONE(top_default_SEQ1_DONE),
  .top_default_SEQ_GO(top_default_SEQ1_GO),
  .top_default_SEQ_OP_CMD(top_default_SEQ1_OP_CMD),
  .top_default_SEQ_PARITY(top_default_SEQ1_PARITY),
  .top_default_TPG_1_1_CS0(top_default_TPG_1_1_1_CS0)
);

top_default_tpg_1_1_1 top_default_t_1_1_1(
  .top_default_A_m(top_default_TPG_1_1_1_A_m),
  .top_default_CEN_m(top_default_TPG_1_1_1_CEN_m),
  .top_default_D_m(top_default_TPG_1_1_1_D_m),
  .top_default_MCK(top_default_MCK),
  .top_default_OEN_m(top_default_TPG_1_1_1_OEN_m),
  .top_default_Q_m(top_default_TPG_1_1_1_Q_m),
  .top_default_RST(top_default_RSTN),
  .top_default_SEQ_ADDR(top_default_SEQ1_ADDR),
  .top_default_SEQ_OP_CMD(top_default_SEQ1_OP_CMD),
  .top_default_SEQ_PARITY(top_default_SEQ1_PARITY),
  .top_default_TPG_CS0(top_default_TPG_1_1_1_CS0),
  .top_default_TPG_GO(top_default_TPG_1_1_1_GO),
  .top_default_WEN_m(top_default_TPG_1_1_1_WEN_m)
);

top_default_tcr_1_1_1 top_default_tc_1_1_1(
  .top_default_A_m(top_default_TPG_1_1_1_A_m),
  .top_default_A_s(top_default_TPG_1_1_1_A_s),
  .top_default_A_t(top_default_TPG_1_1_1_A_t),
  .top_default_CEN_m(top_default_TPG_1_1_1_CEN_m),
  .top_default_CEN_s(top_default_TPG_1_1_1_CEN_s),
  .top_default_CEN_t(top_default_TPG_1_1_1_CEN_t),
  .top_default_CLK_s(top_default_TPG_1_1_1_CLK_s),
  .top_default_CLK_t(top_default_TPG_1_1_1_CLK_t),
  .top_default_D_m(top_default_TPG_1_1_1_D_m),
  .top_default_D_s(top_default_TPG_1_1_1_D_s),
  .top_default_D_t(top_default_TPG_1_1_1_D_t),
  .top_default_MCK(top_default_MCK),
  .top_default_MEN(top_default_MEN),
  .top_default_OEN_m(top_default_TPG_1_1_1_OEN_m),
  .top_default_OEN_s(top_default_TPG_1_1_1_OEN_s),
  .top_default_OEN_t(top_default_TPG_1_1_1_OEN_t),
  .top_default_Q_m(top_default_TPG_1_1_1_Q_m),
  .top_default_Q_s(top_default_TPG_1_1_1_Q_s),
  .top_default_Q_t(top_default_TPG_1_1_1_Q_t),
  .top_default_WEN_m(top_default_TPG_1_1_1_WEN_m),
  .top_default_WEN_s(top_default_TPG_1_1_1_WEN_s),
  .top_default_WEN_t(top_default_TPG_1_1_1_WEN_t)
);

endmodule
`endif

module top_default_top (
  SYS_1_1_1_A,
  SYS_1_1_1_D,
  SYS_1_1_1_CLK,
  SYS_1_1_1_CEN,
  SYS_1_1_1_WEN,
  SYS_1_1_1_Q,
  SYS_1_1_1_OEN,
  top_default_MCK,
  top_default_RSTN,
  top_default_SCK,
  top_default_SDI,
  top_default_SEN,
  top_default_SRST,
  top_default_SDO
);

// for instance: top MEM
input   [11:0]                          SYS_1_1_1_A;
input   [31:0]                          SYS_1_1_1_D;
input                                   SYS_1_1_1_CLK;
input                                   SYS_1_1_1_CEN;
input                                   SYS_1_1_1_WEN;
output  [31:0]                          SYS_1_1_1_Q;
input                                   SYS_1_1_1_OEN;
// BIST port declaration
input                                   top_default_MCK;
input                                   top_default_RSTN;
input                                   top_default_SCK;
input                                   top_default_SDI;
input                                   top_default_SEN;
input                                   top_default_SRST;
output                                  top_default_SDO;

// for instance: top MEM
wire    [31:0]                          top_default_TPG_1_1_1_Q_t;
wire    [11:0]                          top_default_TPG_1_1_1_A_t;
wire                                    top_default_TPG_1_1_1_CEN_t;
wire                                    top_default_TPG_1_1_1_CLK_t;
wire    [31:0]                          top_default_TPG_1_1_1_D_t;
wire                                    top_default_TPG_1_1_1_OEN_t;
wire                                    top_default_TPG_1_1_1_WEN_t;
wire    [11:0]                          top_default_TPG_1_1_1_A_s;
wire                                    top_default_TPG_1_1_1_CEN_s;
wire                                    top_default_TPG_1_1_1_CLK_s;
wire    [31:0]                          top_default_TPG_1_1_1_D_s;
wire                                    top_default_TPG_1_1_1_OEN_s;
wire                                    top_default_TPG_1_1_1_WEN_s;
wire    [31:0]                          top_default_TPG_1_1_1_Q_s;

// BIST port declaration
wire                                    top_default_MCK;
wire                                    top_default_RSTN;
wire                                    top_default_SCK;
wire                                    top_default_SDI;
wire                                    top_default_SEN;
wire                                    top_default_SRST;
wire                                    top_default_SDO;

// for instance: top MEM
assign top_default_TPG_1_1_1_A_s = SYS_1_1_1_A;
assign top_default_TPG_1_1_1_CEN_s = SYS_1_1_1_CEN;
assign top_default_TPG_1_1_1_CLK_s = SYS_1_1_1_CLK;
assign top_default_TPG_1_1_1_D_s = SYS_1_1_1_D;
assign top_default_TPG_1_1_1_OEN_s = SYS_1_1_1_OEN;
assign top_default_TPG_1_1_1_WEN_s = SYS_1_1_1_WEN;
assign SYS_1_1_1_Q = top_default_TPG_1_1_1_Q_s;



// insert BIST: top_default
top_default top_default_bist0 (
  .top_default_MCK(top_default_MCK),
  .top_default_RSTN(top_default_RSTN),
  .top_default_SCK(top_default_SCK),
  .top_default_SDI(top_default_SDI),
  .top_default_SEN(top_default_SEN),
  .top_default_SRST(top_default_SRST),
  .top_default_TPG_1_1_1_A_s(top_default_TPG_1_1_1_A_s),
  .top_default_TPG_1_1_1_CEN_s(top_default_TPG_1_1_1_CEN_s),
  .top_default_TPG_1_1_1_CLK_s(top_default_TPG_1_1_1_CLK_s),
  .top_default_TPG_1_1_1_D_s(top_default_TPG_1_1_1_D_s),
  .top_default_TPG_1_1_1_OEN_s(top_default_TPG_1_1_1_OEN_s),
  .top_default_TPG_1_1_1_Q_t(top_default_TPG_1_1_1_Q_t),
  .top_default_TPG_1_1_1_WEN_s(top_default_TPG_1_1_1_WEN_s),
  .top_default_SDO(top_default_SDO),
  .top_default_TPG_1_1_1_A_t(top_default_TPG_1_1_1_A_t),
  .top_default_TPG_1_1_1_CEN_t(top_default_TPG_1_1_1_CEN_t),
  .top_default_TPG_1_1_1_CLK_t(top_default_TPG_1_1_1_CLK_t),
  .top_default_TPG_1_1_1_D_t(top_default_TPG_1_1_1_D_t),
  .top_default_TPG_1_1_1_OEN_t(top_default_TPG_1_1_1_OEN_t),
  .top_default_TPG_1_1_1_Q_s(top_default_TPG_1_1_1_Q_s),
  .top_default_TPG_1_1_1_WEN_t(top_default_TPG_1_1_1_WEN_t)
);
// insert memory instance: top MEM
// Artisan, Synchronous Single-Port Ram
`ifdef FAULT
  RA1SHD_f mem_1_1_1 (
`else
  RA1SHD mem_1_1_1 (
`endif
  .WEN(top_default_TPG_1_1_1_WEN_t),
  .A(top_default_TPG_1_1_1_A_t),
  .D(top_default_TPG_1_1_1_D_t),
  .OEN(top_default_TPG_1_1_1_OEN_t),
  .CEN(top_default_TPG_1_1_1_CEN_t),
  .Q(top_default_TPG_1_1_1_Q_t),
  .CLK(top_default_TPG_1_1_1_CLK_t)
);

endmodule

