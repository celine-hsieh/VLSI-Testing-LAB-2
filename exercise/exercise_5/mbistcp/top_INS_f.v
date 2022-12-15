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
       // Begin of START Insertion {Declare Added Test IO}
       wire                          top_default_GRP_ID;
       wire                          top_default_MCK;
       wire                          top_default_MEN;
       wire                          top_default_RSTN;
       wire                          top_default_SCK;
       wire                          top_default_SDI;
       wire                          top_default_SDO;
       wire                          top_default_SEN;
       wire      [11:0]              top_default_SEQ1_ADDR;
       wire      [4:0]               top_default_SEQ1_CMD;
       wire                          top_default_SEQ1_CS;
       wire                          top_default_SEQ1_DONE;
       wire                          top_default_SEQ1_GO;
       wire      [1:0]               top_default_SEQ1_OP_CMD;
       wire                          top_default_SEQ1_PARITY;
       wire                          top_default_SRST;
       wire      [11:0]              top_default_TPG_1_1_1_A_m;
       wire      [11:0]              top_default_TPG_1_1_1_A_t;
       wire                          top_default_TPG_1_1_1_CEN_m;
       wire                          top_default_TPG_1_1_1_CEN_t;
       wire                          top_default_TPG_1_1_1_CLK_t;
       wire                          top_default_TPG_1_1_1_CS0;
       wire      [31:0]              top_default_TPG_1_1_1_D_m;
       wire      [31:0]              top_default_TPG_1_1_1_D_t;
       wire                          top_default_TPG_1_1_1_GO;
       wire                          top_default_TPG_1_1_1_OEN_m;
       wire                          top_default_TPG_1_1_1_OEN_t;
       wire      [31:0]              top_default_TPG_1_1_1_Q_m;
       wire      [31:0]              top_default_TPG_1_1_1_Q_t;
       wire                          top_default_TPG_1_1_1_WEN_m;
       wire                          top_default_TPG_1_1_1_WEN_t;
       // End of START Insertion {Declare Added Test IO}
   

`ifdef FAULT
    RA1SHD_f
`else
    RA1SHD
`endif
 MEM(
   .CLK(top_default_TPG_1_1_1_CLK_t),
   .CEN(top_default_TPG_1_1_1_CEN_t),
   .WEN(top_default_TPG_1_1_1_WEN_t),
   .A(top_default_TPG_1_1_1_A_t),
   .Q(top_default_TPG_1_1_1_Q_t),
   .D(top_default_TPG_1_1_1_D_t),
   .OEN(top_default_TPG_1_1_1_OEN_t)
);
    // Begin of START Insertion {Add Instance}
    top_default_tcr_1_1_1 top_default_tc_1_1_1(
        .top_default_A_m(top_default_TPG_1_1_1_A_m),
        .top_default_A_s(A),
        .top_default_A_t(top_default_TPG_1_1_1_A_t),
        .top_default_CEN_m(top_default_TPG_1_1_1_CEN_m),
        .top_default_CEN_s(CEN),
        .top_default_CEN_t(top_default_TPG_1_1_1_CEN_t),
        .top_default_CLK_s(CLK),
        .top_default_CLK_t(top_default_TPG_1_1_1_CLK_t),
        .top_default_D_m(top_default_TPG_1_1_1_D_m),
        .top_default_D_s(D),
        .top_default_D_t(top_default_TPG_1_1_1_D_t),
        .top_default_MCK(top_default_MCK),
        .top_default_MEN(top_default_MEN),
        .top_default_OEN_m(top_default_TPG_1_1_1_OEN_m),
        .top_default_OEN_s(OEN),
        .top_default_OEN_t(top_default_TPG_1_1_1_OEN_t),
        .top_default_Q_m(top_default_TPG_1_1_1_Q_m),
        .top_default_Q_s(Q),
        .top_default_Q_t(top_default_TPG_1_1_1_Q_t),
        .top_default_WEN_m(top_default_TPG_1_1_1_WEN_m),
        .top_default_WEN_s(WEN),
        .top_default_WEN_t(top_default_TPG_1_1_1_WEN_t)
    );
    // End of START Insertion {Add Instance}

    // Begin of START Insertion {Add Instance}
    top_default_controller top_default_ctr(
        .top_default_GRP_ID(top_default_GRP_ID),
        .top_default_MCK(top_default_MCK),
        .top_default_MEN(top_default_MEN),
        .top_default_RSTN(top_default_RSTN),
        .top_default_SCK(top_default_SCK),
        .top_default_SDI(top_default_SDI),
        .top_default_SDO(top_default_SDO),
        .top_default_SEN(top_default_SEN),
        .top_default_SEQ1_CMD(top_default_SEQ1_CMD),
        .top_default_SEQ1_CS(top_default_SEQ1_CS),
        .top_default_SEQ1_DONE(top_default_SEQ1_DONE),
        .top_default_SEQ1_GO(top_default_SEQ1_GO),
        .top_default_SRST(top_default_SRST)
    );
    // End of START Insertion {Add Instance}

    // Begin of START Insertion {Add Instance}
    top_default_sequencer1 top_default_seq1(
        .top_default_CMD(top_default_SEQ1_CMD),
        .top_default_GRP_ID(top_default_GRP_ID),
        .top_default_MCK(top_default_MCK),
        .top_default_RST(top_default_RSTN),
        .top_default_SEQ_ADDR(top_default_SEQ1_ADDR),
        .top_default_SEQ_CS(top_default_SEQ1_CS),
        .top_default_SEQ_DONE(top_default_SEQ1_DONE),
        .top_default_SEQ_GO(top_default_SEQ1_GO),
        .top_default_SEQ_OP_CMD(top_default_SEQ1_OP_CMD),
        .top_default_SEQ_PARITY(top_default_SEQ1_PARITY),
        .top_default_TPG_1_1_CS0(top_default_TPG_1_1_1_CS0),
        .top_default_TPG_1_1_GO(top_default_TPG_1_1_1_GO)
    );
    // End of START Insertion {Add Instance}

    // Begin of START Insertion {Add Instance}
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
    // End of START Insertion {Add Instance}


endmodule