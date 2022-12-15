`default_nettype wire 

module top_default_controller (
  top_default_MCK,
  top_default_RSTN,
  top_default_SCK,
  top_default_SDI,
  top_default_SEN,
  top_default_SEQ1_DONE,
  top_default_SEQ1_GO,
  top_default_SRST,
  top_default_GRP_ID,
  top_default_MEN,
  top_default_SDO,
  top_default_SEQ1_CMD,
  top_default_SEQ1_CS
);

parameter top_default_seq_id_width      = 1;
parameter top_default_grp_id_width      = 1;
parameter top_default_meb_id_width      = 1;
parameter top_default_bg_width          = 1;
parameter top_default_state_width       = 3;
parameter top_default_Run_Test_Idle     = 3'd0;
parameter top_default_Apply_MB          = 3'd1;
parameter top_default_Run_MB            = 3'd2;
parameter top_default_Scan_MB           = 3'd3;
parameter top_default_Done_MB           = 3'd4;
parameter top_default_det_state_width   = 4;
parameter top_default_Det_Idle          = 4'd0;
parameter top_default_Det_Fetch         = 4'd1;
parameter top_default_Det_SEQ           = 4'd2;
parameter top_default_Det_ALG           = 4'd3;
parameter top_default_Det_GRP           = 4'd4;
parameter top_default_Det_BG            = 4'd5;
parameter top_default_Det_CMD           = 4'd6;
parameter top_default_Det_Run           = 4'd7;
parameter top_default_Det_Eval          = 4'd8;
parameter top_default_Det_Done          = 4'd9;
parameter top_default_SEQ_ID_cnt_max    = 1;
parameter top_default_cmd_stable_cyc    = 2;
parameter top_default_eval_stable_cyc   = 2;
parameter top_default_cmd_width         = 5;
parameter top_default_alg_cnt_width     = 1;
parameter top_default_cmd_cnt_width     = 3;
parameter top_default_cmd_fix_width     = 5;

input                                   top_default_MCK;
input                                   top_default_RSTN;
input                                   top_default_SCK;
input                                   top_default_SDI;
input                                   top_default_SEN;
input                                   top_default_SEQ1_DONE;
input                                   top_default_SEQ1_GO;
input                                   top_default_SRST;
output  [top_default_grp_id_width - 1:0]            top_default_GRP_ID;
output                                  top_default_MEN;
output                                  top_default_SDO;
output  [top_default_cmd_width - 1:0]               top_default_SEQ1_CMD;
output                                  top_default_SEQ1_CS;

reg     [top_default_alg_cnt_width - 1:0] top_default_ALGO_next;
reg     [1:0]                           top_default_CMD_STABLE_cnt_next;
reg     [top_default_cmd_cnt_width - 1:0] top_default_CMD_cnt_next;
reg     [1:0]                           top_default_EVAL_STABLE_cnt_next;
reg     [top_default_grp_id_width - 1:0] top_default_GRP_ID_cnt_max;
reg     [top_default_grp_id_width - 1:0] top_default_GRP_ID_cnt_next;
reg                                     top_default_SEQ1_CMD_DONE_next;
reg                                     top_default_SEQ1_wait_next;
reg     [top_default_seq_id_width - 1:0] top_default_SEQ_ID_cnt_next;
reg     [top_default_cmd_fix_width - 1:0] top_default_SRAM_CMD_fix;
reg                                     top_default_max_ALG_mp;
reg     [top_default_det_state_width - 1:0] top_default_next_det_state;
reg                                     top_default_next_new_ALG;
reg                                     top_default_next_new_BG;
reg                                     top_default_next_new_CMD;
reg                                     top_default_next_new_GRP;
reg                                     top_default_next_new_SEQ;
reg     [top_default_state_width - 1:0] top_default_next_state;

wire    [top_default_alg_cnt_width - 1:0] top_default_ALGO;
wire                                    top_default_ALG_CHG;
wire                                    top_default_ALG_DONE;
wire                                    top_default_ALG_DONE_next;
wire                                    top_default_ALL_CMD_ZERO;
wire                                    top_default_ALL_TEST_DONE;
wire                                    top_default_BG_CHG;
wire                                    top_default_BG_DONE;
wire                                    top_default_BG_DONE_next;
wire                                    top_default_BIST_DONE;
wire                                    top_default_BIST_GO;
wire                                    top_default_BIST_GO_next;
wire                                    top_default_CMD_CHG;
wire                                    top_default_CMD_CHG_DONE;
wire                                    top_default_CMD_DONE;
wire                                    top_default_CMD_DONE_next;
wire    [1:0]                           top_default_CMD_STABLE_cnt;
wire    [top_default_cmd_cnt_width - 1:0] top_default_CMD_cnt;
wire                                    top_default_EVAL_DONE;
wire    [1:0]                           top_default_EVAL_STABLE_cnt;
wire                                    top_default_GRP_CHG;
wire                                    top_default_GRP_DONE;
wire                                    top_default_GRP_DONE_next;
wire    [top_default_grp_id_width - 1:0] top_default_GRP_ID;
wire    [top_default_grp_id_width - 1:0] top_default_GRP_ID_cnt;
wire                                    top_default_LAST_ALG;
wire                                    top_default_LAST_BG;
wire                                    top_default_LAST_CMD;
wire                                    top_default_LAST_GRP;
wire                                    top_default_LAST_SEQ;
wire                                    top_default_MEN;
wire                                    top_default_MGO;
wire                                    top_default_MRD;
wire                                    top_default_MRD_next;
wire                                    top_default_ONE_SEQ_WAIT;
wire                                    top_default_RST;
wire                                    top_default_RSTN;
wire    [top_default_cmd_width - 1:0]   top_default_SEQ1_CMD;
wire                                    top_default_SEQ1_CMD_DONE;
wire                                    top_default_SEQ1_CS_init;
wire                                    top_default_SEQ1_CS_init_next;
wire                                    top_default_SEQ1_SELECT;
wire                                    top_default_SEQ1_SELECT_next;
wire                                    top_default_SEQ1_wait;
wire                                    top_default_SEQ_CHG;
wire                                    top_default_SEQ_DONE;
wire                                    top_default_SEQ_DONE_next;
wire    [top_default_seq_id_width - 1:0] top_default_SEQ_ID;
wire    [top_default_seq_id_width - 1:0] top_default_SEQ_ID_cnt;
wire    [top_default_seq_id_width - 1:0] top_default_SEQ_ID_next;
wire                                    top_default_SEQ_WAIT;
wire    [top_default_cmd_width - 1:0]   top_default_SRAM_CMD;
wire                                    top_default_SRAM_SEQ;
wire    [top_default_cmd_width - 1:0]   top_default_SRAM_next_CMD;
wire                                    top_default_SRST;
wire                                    top_default_SeqOn;
wire                                    top_default_TEST_GO;
wire                                    top_default_TEST_GO_next;
wire                                    top_default_ctr_en;
wire    [top_default_det_state_width - 1:0] top_default_det_state;
wire                                    top_default_new_ALG;
wire                                    top_default_new_BG;
wire                                    top_default_new_CMD;
wire                                    top_default_new_GRP;
wire                                    top_default_new_SEQ;
wire                                    top_default_s_det_alg;
wire                                    top_default_s_det_bg;
wire                                    top_default_s_det_cmd;
wire                                    top_default_s_det_done;
wire                                    top_default_s_det_eval;
wire                                    top_default_s_det_fetch;
wire                                    top_default_s_det_grp;
wire                                    top_default_s_det_run;
wire                                    top_default_s_det_seq;
wire                                    top_default_s_run_mb;
wire    [top_default_state_width - 1:0] top_default_state;

assign top_default_ALG_CHG = ~top_default_new_ALG & top_default_ALG_DONE & ~top_default_LAST_ALG;
assign top_default_ALG_DONE_next = top_default_GRP_DONE & top_default_LAST_GRP;
assign top_default_ALL_CMD_ZERO = ((top_default_SRAM_CMD_fix) == 5'd0);
assign top_default_ALL_TEST_DONE = top_default_SEQ_DONE & top_default_LAST_SEQ;
assign top_default_BG_CHG = ~top_default_new_BG & top_default_BG_DONE & ~top_default_LAST_BG;
assign top_default_BG_DONE_next = top_default_CMD_DONE & top_default_LAST_CMD;
assign top_default_BIST_DONE = top_default_s_det_done;
assign top_default_BIST_GO_next = top_default_SEQ1_GO;
assign top_default_CMD_CHG = ~top_default_new_CMD & top_default_CMD_DONE & ~top_default_LAST_CMD;
assign top_default_CMD_CHG_DONE = (top_default_CMD_STABLE_cnt >= top_default_cmd_stable_cyc);
assign top_default_CMD_DONE_next = top_default_SEQ_WAIT;
assign top_default_EVAL_DONE = (top_default_EVAL_STABLE_cnt >= top_default_eval_stable_cyc);
assign top_default_GRP_CHG = ~top_default_new_GRP & top_default_GRP_DONE & ~top_default_LAST_GRP;
assign top_default_GRP_DONE_next = top_default_BG_DONE & top_default_LAST_BG;
assign top_default_GRP_ID = top_default_GRP_ID_cnt;
assign top_default_LAST_ALG = (top_default_det_state > top_default_Det_SEQ) ? (top_default_ALGO >= top_default_max_ALG_mp) : 1'd0;
assign top_default_LAST_BG = (top_default_det_state > top_default_Det_GRP) ? 1'd1 : 1'd0;
assign top_default_LAST_CMD = (top_default_det_state > top_default_Det_BG) ? top_default_ALL_CMD_ZERO : 1'd0;
assign top_default_LAST_GRP = (top_default_det_state > top_default_Det_ALG) ? (top_default_GRP_ID >= top_default_GRP_ID_cnt_max) : 1'd0;
assign top_default_LAST_SEQ = (top_default_det_state > top_default_Det_Fetch) ? (top_default_SEQ_ID >= top_default_SEQ_ID_cnt_max) : 1'd0;
assign top_default_MGO = top_default_TEST_GO;
assign top_default_MRD_next = (top_default_state == top_default_Done_MB);
assign top_default_ONE_SEQ_WAIT = (top_default_SEQ1_SELECT & top_default_SEQ1_wait);
assign top_default_RST = top_default_RSTN;
assign top_default_SEQ1_CMD = top_default_SRAM_CMD;
assign top_default_SEQ1_CS = top_default_SEQ1_CS_init;
assign top_default_SEQ1_CS_init_next = top_default_SeqOn & ~top_default_SEQ1_DONE & (top_default_SEQ_ID == 1'd1);
assign top_default_SEQ1_SELECT_next = (top_default_SEQ_ID == 1'd1);
assign top_default_SEQ_CHG = ~top_default_new_SEQ & top_default_SEQ_DONE & ~top_default_LAST_SEQ;
assign top_default_SEQ_DONE_next = top_default_ALG_DONE & top_default_LAST_ALG;
assign top_default_SEQ_ID_next = top_default_SEQ_ID_cnt;
assign top_default_SEQ_WAIT = top_default_ONE_SEQ_WAIT;
assign top_default_SRAM_SEQ = (top_default_SEQ_ID == 1'd1);
assign top_default_SRAM_next_CMD = top_default_SRAM_CMD_fix;
assign top_default_SeqOn = top_default_s_det_run;
assign top_default_TEST_GO_next = top_default_MEN ? (top_default_TEST_GO & top_default_BIST_GO) : 1'b1;
assign top_default_ctr_en = top_default_MEN;
assign top_default_s_det_alg = (top_default_det_state == top_default_Det_ALG);
assign top_default_s_det_bg = (top_default_det_state == top_default_Det_BG);
assign top_default_s_det_cmd = (top_default_det_state == top_default_Det_CMD);
assign top_default_s_det_done = (top_default_det_state == top_default_Det_Done);
assign top_default_s_det_eval = (top_default_det_state == top_default_Det_Eval);
assign top_default_s_det_fetch = (top_default_det_state == top_default_Det_Fetch);
assign top_default_s_det_grp = (top_default_det_state == top_default_Det_GRP);
assign top_default_s_det_run = (top_default_det_state == top_default_Det_Run);
assign top_default_s_det_seq = (top_default_det_state == top_default_Det_SEQ);
assign top_default_s_run_mb = (top_default_state == top_default_Run_MB)|(top_default_state == top_default_Scan_MB);

always @(*) begin
  if (top_default_s_det_seq) begin
    top_default_ALGO_next = 1'd1;
  end else if (top_default_s_det_alg & top_default_ALG_CHG & (top_default_ALGO < top_default_max_ALG_mp)) begin
    top_default_ALGO_next = top_default_ALGO + 1'd1;
  end else begin
    top_default_ALGO_next = top_default_ALGO;
  end
end

always @(*) begin
  if (top_default_s_det_bg) begin
    top_default_CMD_cnt_next = 3'd0;
  end else if (top_default_s_det_cmd & top_default_CMD_CHG) begin
    top_default_CMD_cnt_next = top_default_CMD_cnt + 3'b001;
  end else begin
    top_default_CMD_cnt_next = top_default_CMD_cnt;
  end
end

always @(*) begin
  case (top_default_ALGO) //synopsys parallel_case
    1'b1 : begin
      case (top_default_CMD_cnt) //synopsys parallel_case
        3'b000: top_default_SRAM_CMD_fix = 5'b01100;
        3'b001: top_default_SRAM_CMD_fix = 5'b01011;
        3'b010: top_default_SRAM_CMD_fix = 5'b10001;
        3'b011: top_default_SRAM_CMD_fix = 5'b11010;
        default: top_default_SRAM_CMD_fix = 5'b00000;
      endcase
    end
    default: top_default_SRAM_CMD_fix = 5'b00000;
  endcase
end

always @(*) begin
  if (~top_default_s_det_cmd) begin
    top_default_CMD_STABLE_cnt_next = 2'd0;
  end else if (top_default_CMD_STABLE_cnt < top_default_cmd_stable_cyc) begin
    top_default_CMD_STABLE_cnt_next = top_default_CMD_STABLE_cnt + 2'd1;
  end else begin
    top_default_CMD_STABLE_cnt_next = top_default_CMD_STABLE_cnt;
  end
end

always @(*) begin
  if (~top_default_s_det_eval) begin
    top_default_EVAL_STABLE_cnt_next = 2'd0;
  end else if (top_default_EVAL_STABLE_cnt < top_default_eval_stable_cyc) begin
    top_default_EVAL_STABLE_cnt_next = top_default_EVAL_STABLE_cnt + 2'd1;
  end else begin
    top_default_EVAL_STABLE_cnt_next = top_default_EVAL_STABLE_cnt;
  end
end

always @(*) begin
  case (top_default_SEQ_ID)
    1'b1: top_default_GRP_ID_cnt_max = 1'd1;
    default: top_default_GRP_ID_cnt_max =  1'd0;
  endcase
end

always @(*) begin
  if (top_default_s_det_alg) begin
    top_default_GRP_ID_cnt_next = 1'd1;
  end else if (top_default_s_det_grp & top_default_GRP_CHG & (top_default_GRP_ID_cnt < top_default_GRP_ID_cnt_max)) begin
    top_default_GRP_ID_cnt_next = top_default_GRP_ID_cnt + 1'd1;
  end else begin
    top_default_GRP_ID_cnt_next = top_default_GRP_ID_cnt;
  end
end

always @(*) begin
  if (top_default_s_det_cmd) begin
    top_default_SEQ1_CMD_DONE_next = 1'd0;
  end else begin
    top_default_SEQ1_CMD_DONE_next = top_default_SEQ1_CMD_DONE | (top_default_SEQ1_CS_init & top_default_SEQ1_DONE);
  end
end

always @(*) begin
  if ((top_default_det_state < top_default_Det_GRP) | (top_default_s_det_eval & top_default_EVAL_DONE) | (top_default_s_det_cmd)) begin
    top_default_SEQ1_wait_next = 1'd0;
  end else if ((top_default_det_state > top_default_Det_GRP) & ~top_default_SEQ1_SELECT) begin
    top_default_SEQ1_wait_next = 1'd1;
  end else if (top_default_CMD_CHG_DONE & ~|top_default_SEQ1_CMD[top_default_cmd_width-1:top_default_cmd_width-top_default_cmd_fix_width]) begin
    top_default_SEQ1_wait_next = 1'd1;
  end else if (top_default_s_det_run & top_default_SEQ1_CMD_DONE) begin
    top_default_SEQ1_wait_next = 1'd1;
  end else begin
    top_default_SEQ1_wait_next = top_default_SEQ1_wait;
  end
end

always @(*) begin
  if (~top_default_MEN) begin
    top_default_SEQ_ID_cnt_next = 1'd0;
  end else if (top_default_s_det_fetch) begin
    top_default_SEQ_ID_cnt_next = 1'd1;
  end else if (top_default_s_det_seq & top_default_SEQ_CHG & (top_default_SEQ_ID_cnt < top_default_SEQ_ID_cnt_max)) begin
    top_default_SEQ_ID_cnt_next = top_default_SEQ_ID_cnt + 1'd1;
  end else begin
    top_default_SEQ_ID_cnt_next = top_default_SEQ_ID_cnt;
  end
end

always @(*) begin
    case (top_default_SEQ_ID)
      1'b1: top_default_max_ALG_mp = 1'd1;
      default: top_default_max_ALG_mp = 1'd1;
    endcase
end

always @(*) begin
  if (~top_default_s_run_mb) begin
    top_default_next_det_state = top_default_Det_Idle;
  end else begin
      case (top_default_det_state)
          top_default_Det_Idle:  top_default_next_det_state = top_default_Det_Fetch;
          top_default_Det_Fetch: top_default_next_det_state = top_default_Det_SEQ;
          top_default_Det_SEQ:   top_default_next_det_state = top_default_Det_ALG;
          top_default_Det_ALG:   top_default_next_det_state = top_default_Det_GRP;
          top_default_Det_GRP:   top_default_next_det_state = top_default_Det_BG;
          top_default_Det_BG:    top_default_next_det_state = top_default_Det_CMD;
          top_default_Det_CMD:   top_default_next_det_state = (top_default_CMD_CHG_DONE) ? top_default_Det_Run : top_default_Det_CMD;
          top_default_Det_Run:   top_default_next_det_state = top_default_SEQ_WAIT ? top_default_Det_Eval : top_default_Det_Run;
          top_default_Det_Eval:  begin
              if (top_default_ALL_TEST_DONE & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_Done;
              end else if (top_default_CMD_CHG & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_CMD;
              end else if (top_default_BG_CHG & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_BG;
              end else if (top_default_GRP_CHG & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_GRP;
              end else if (top_default_ALG_CHG & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_ALG;
              end else if (top_default_SEQ_CHG & top_default_EVAL_DONE) begin
                  top_default_next_det_state = top_default_Det_SEQ;
              end else begin
                  top_default_next_det_state = top_default_Det_Eval;
              end
          end
          top_default_Det_Done:  top_default_next_det_state = top_default_Det_Done;
          default: top_default_next_det_state = top_default_Det_Idle;
      endcase
  end
end

always @(*) begin
  if (top_default_s_det_seq) begin
    top_default_next_new_ALG = 1'b1;
  end else if (top_default_s_det_alg & top_default_ALG_CHG) begin
    top_default_next_new_ALG = 1'b1;
  end else if (top_default_s_det_run) begin
    top_default_next_new_ALG = 1'b0;
  end else begin
    top_default_next_new_ALG = top_default_new_ALG;
  end
end

always @(*) begin
  if (top_default_s_det_grp) begin
    top_default_next_new_BG = 1'b1;
  end else if (top_default_s_det_bg & top_default_BG_CHG) begin
    top_default_next_new_BG = 1'b1;
  end else if (top_default_s_det_run) begin
    top_default_next_new_BG = 1'b0;
  end else begin
    top_default_next_new_BG = top_default_new_BG;
  end
end

always @(*) begin
  if (top_default_s_det_bg) begin
    top_default_next_new_CMD = 1'b1;
  end else if (top_default_s_det_cmd & top_default_CMD_CHG) begin
    top_default_next_new_CMD = 1'b1;
  end else if (top_default_s_det_run) begin
    top_default_next_new_CMD = 1'b0;
  end else begin
    top_default_next_new_CMD = top_default_new_CMD;
  end
end

always @(*) begin
  if (top_default_s_det_alg) begin
    top_default_next_new_GRP = 1'b1;
  end else if (top_default_s_det_grp & top_default_GRP_CHG) begin
    top_default_next_new_GRP = 1'b1;
  end else if (top_default_s_det_run) begin
    top_default_next_new_GRP = 1'b0;
  end else begin
    top_default_next_new_GRP = top_default_new_GRP;
  end
end

always @(*) begin
  if (top_default_s_det_fetch) begin
    top_default_next_new_SEQ = 1'b1;
  end else if (top_default_s_det_seq & top_default_SEQ_CHG) begin
    top_default_next_new_SEQ = 1'b1;
  end else if (top_default_s_det_run) begin
    top_default_next_new_SEQ = 1'b0;
  end else begin
    top_default_next_new_SEQ = top_default_new_SEQ;
  end
end

always @(*) begin
  case (top_default_state)
    top_default_Run_Test_Idle: top_default_next_state = top_default_ctr_en ? top_default_Apply_MB : top_default_Run_Test_Idle;
    top_default_Apply_MB:      top_default_next_state = top_default_ctr_en ? top_default_Run_MB : top_default_Run_Test_Idle;
    top_default_Run_MB:        top_default_next_state = top_default_ctr_en ? (top_default_BIST_DONE ? top_default_Done_MB : top_default_Run_MB)
                                       : top_default_Run_Test_Idle;
    top_default_Done_MB:       top_default_next_state = top_default_ctr_en ? top_default_Done_MB : top_default_Run_Test_Idle;
    default:       top_default_next_state = top_default_Run_Test_Idle;
  endcase
end

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_alg_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_ALG_DONE_next),
  .Q(top_default_ALG_DONE)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_alg_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_ALGO_next),
  .Q(top_default_ALGO)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_bg_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_BG_DONE_next),
  .Q(top_default_BG_DONE)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_bist_go_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_BIST_GO_next),
  .Q(top_default_BIST_GO)
);

top_default_BUFF_ASYNC_W3_D1_S0 top_default_ctr_cmd_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_CMD_cnt_next),
  .Q(top_default_CMD_cnt)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_cmd_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_CMD_DONE_next),
  .Q(top_default_CMD_DONE)
);

top_default_BUFF_ASYNC_W5_D1_S0 top_default_ctr_cmd_reg_SRAM (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SRAM_next_CMD),
  .Q(top_default_SRAM_CMD)
);

top_default_BUFF_ASYNC_W2_D1_S0 top_default_ctr_cmd_stable_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_CMD_STABLE_cnt_next),
  .Q(top_default_CMD_STABLE_cnt)
);

top_default_BUFF_ASYNC_W4_D1_S0 top_default_ctr_det_state_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_det_state),
  .Q(top_default_det_state)
);

top_default_BUFF_ASYNC_W2_D1_S0 top_default_ctr_eval_stable_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_EVAL_STABLE_cnt_next),
  .Q(top_default_EVAL_STABLE_cnt)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_grp_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_GRP_DONE_next),
  .Q(top_default_GRP_DONE)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_grp_id_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_GRP_ID_cnt_next),
  .Q(top_default_GRP_ID_cnt)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_mrd_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_MRD_next),
  .Q(top_default_MRD)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_new_ALG_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_new_ALG),
  .Q(top_default_new_ALG)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_new_BG_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_new_BG),
  .Q(top_default_new_BG)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_new_CMD_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_new_CMD),
  .Q(top_default_new_CMD)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_new_GRP_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_new_GRP),
  .Q(top_default_new_GRP)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_new_SEQ_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_new_SEQ),
  .Q(top_default_new_SEQ)
);

top_default_scan ctr_scan_inst(
  .top_default_MCK(top_default_MCK),
  .top_default_MGO(top_default_MGO),
  .top_default_MRD(top_default_MRD),
  .top_default_RST(top_default_RST),
  .top_default_SCK(top_default_SCK),
  .top_default_SDI(top_default_SDI),
  .top_default_SEN(top_default_SEN),
  .top_default_SRST(top_default_SRST),
  .top_default_MEN(top_default_MEN),
  .top_default_SDO(top_default_SDO)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq1_cmd_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ1_CMD_DONE_next),
  .Q(top_default_SEQ1_CMD_DONE)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq1_cs_init_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ1_CS_init_next),
  .Q(top_default_SEQ1_CS_init)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq1_select_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ1_SELECT_next),
  .Q(top_default_SEQ1_SELECT)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq1_wait_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ1_wait_next),
  .Q(top_default_SEQ1_wait)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq_done_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ_DONE_next),
  .Q(top_default_SEQ_DONE)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_seq_id_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ_ID_next),
  .Q(top_default_SEQ_ID)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ctr_sid_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_SEQ_ID_cnt_next),
  .Q(top_default_SEQ_ID_cnt)
);

top_default_BUFF_ASYNC_W3_D1_S0 top_default_ctr_state_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_state),
  .Q(top_default_state)
);

top_default_BUFF_ASYNC_W1_D1_S1 top_default_ctr_test_go_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_TEST_GO_next),
  .Q(top_default_TEST_GO)
);
endmodule

module top_default_scan (
  top_default_MCK,
  top_default_MGO,
  top_default_MRD,
  top_default_RST,
  top_default_SCK,
  top_default_SDI,
  top_default_SEN,
  top_default_SRST,
  top_default_MEN,
  top_default_SDO
);

parameter IR_width                      = 2;
parameter top_default_IDLE_STATE        = 3'd0;
parameter top_default_SCAN_IR_STATE     = 3'd1;
parameter top_default_SCAN_UIR_STATE    = 3'd2;
parameter top_default_SCAN_PRE_UDR_STATE = 3'd3;
parameter top_default_SCAN_WAIT_STATE   = 3'd4;
parameter top_default_SCAN_DR_STATE     = 3'd5;
parameter top_default_SCAN_UDR_STATE    = 3'd6;
parameter test_result_width             = 2;
parameter test_command_width            = 1;

input                                   top_default_MCK;
input                                   top_default_MGO;
input                                   top_default_MRD;
input                                   top_default_RST;
input                                   top_default_SCK;
input                                   top_default_SDI;
input                                   top_default_SEN;
input                                   top_default_SRST;
output                                  top_default_MEN;
output                                  top_default_SDO;

reg     [IR_width - 1:0]                IR;
reg     [IR_width - 1:0]                IR_shift_reg;
reg                                     top_default_SDO;
reg                                     bypass_DR;
reg     [2:0]                           top_default_next_scan_state;
reg     [test_command_width - 1:0]      test_command;
reg     [test_command_width - 1:0]      test_command_DR;
reg     [test_result_width - 1:0]       test_result_DR;

wire                                    IR_shift_reg_LSB;
wire                                    top_default_UpdateDR;
wire                                    UpdateDR_async;
wire                                    top_default_UpdateIR;
wire                                    capture_test_result;
wire    [IR_width - 1:0]                next_IR_shift_reg;
wire    [test_command_width - 1:0]      next_test_command_DR;
wire    [test_result_width - 1:0]       next_test_result_DR;
wire    [2:0]                           top_default_scan_state;
wire                                    shift_to_DR;
wire                                    shift_to_IR;
wire                                    test_command_LSB;
wire    [test_result_width - 1:0]       test_result;
wire                                    test_result_LSB;

assign #1 top_default_MEN = test_command;
assign top_default_UpdateDR = (top_default_scan_state == top_default_SCAN_PRE_UDR_STATE) | (top_default_scan_state == top_default_SCAN_UDR_STATE);
assign top_default_UpdateIR = (top_default_scan_state == top_default_SCAN_UIR_STATE);
assign capture_test_result = (top_default_scan_state == top_default_SCAN_PRE_UDR_STATE) & (IR == 2'b10);
assign shift_to_DR = (top_default_next_scan_state == top_default_SCAN_DR_STATE);
assign shift_to_IR = (top_default_next_scan_state == top_default_SCAN_IR_STATE);
assign test_result = {top_default_MGO, top_default_MRD};
assign {next_IR_shift_reg, IR_shift_reg_LSB} = {top_default_SDI, IR_shift_reg};
assign {next_test_command_DR, test_command_LSB} = {top_default_SDI, test_command_DR};
assign {next_test_result_DR, test_result_LSB} = {top_default_SDI, test_result_DR};

always @(*) begin
  if (shift_to_IR) begin
    top_default_SDO = IR_shift_reg_LSB;
  end else begin
    case (IR)
      2'b00: top_default_SDO = bypass_DR;
      2'b01: top_default_SDO = test_command_LSB;
      2'b10: top_default_SDO = test_result_LSB;
      default: top_default_SDO = 1'b0;
    endcase
  end
end

always @(*) begin
  case (top_default_scan_state)
    top_default_IDLE_STATE: top_default_next_scan_state = top_default_SEN ? top_default_SCAN_IR_STATE : top_default_IDLE_STATE;
    top_default_SCAN_IR_STATE: top_default_next_scan_state = top_default_SEN ? top_default_SCAN_IR_STATE : top_default_SCAN_UIR_STATE;
    top_default_SCAN_UIR_STATE: top_default_next_scan_state = ~IR_shift_reg[1] ? top_default_SCAN_WAIT_STATE : top_default_SCAN_PRE_UDR_STATE;
    top_default_SCAN_PRE_UDR_STATE: top_default_next_scan_state = top_default_SCAN_WAIT_STATE;
    top_default_SCAN_WAIT_STATE: top_default_next_scan_state = top_default_SEN ? top_default_SCAN_DR_STATE : top_default_SCAN_WAIT_STATE;
    top_default_SCAN_DR_STATE: top_default_next_scan_state = top_default_SEN ? top_default_SCAN_DR_STATE : ~IR_shift_reg[1] ? top_default_SCAN_UDR_STATE : top_default_IDLE_STATE;
    top_default_SCAN_UDR_STATE: top_default_next_scan_state = top_default_IDLE_STATE;
    default: top_default_next_scan_state = top_default_IDLE_STATE;
  endcase
end

always @(posedge top_default_SCK or negedge top_default_SRST) begin
  if (~top_default_SRST) begin
    IR <= 2'd0;
  end else begin
    if (top_default_UpdateIR) begin
      IR <= IR_shift_reg;
    end else begin
      IR <= IR;
    end
  end
end

always @(posedge top_default_SCK or negedge top_default_SRST) begin
  if (~top_default_SRST) begin
    IR_shift_reg <= 2'd0;
  end else begin
    if (shift_to_IR) begin
      IR_shift_reg <= next_IR_shift_reg;
    end else begin
      IR_shift_reg <= IR_shift_reg;
    end
  end
end

always @(posedge top_default_SCK or negedge top_default_SRST) begin
  if (~top_default_SRST) begin
    bypass_DR <= 1'd0;
  end else begin
    if (shift_to_DR & (IR == 2'b00)) begin
      bypass_DR <= top_default_SDI;
    end else begin
      bypass_DR <= bypass_DR;
    end
  end
end

always @(posedge top_default_MCK or negedge top_default_RST) begin
  if (~top_default_RST) begin
    test_command <= 1'd0;
  end else begin
    if (UpdateDR_async) begin
      test_command <= test_command_DR;
    end else begin
      test_command <= test_command;
    end
  end
end

always @(posedge top_default_SCK or negedge top_default_SRST) begin
  if (~top_default_SRST) begin
    test_command_DR <= 1'd0;
  end else begin
    if (shift_to_DR & (IR == 2'b01)) begin
      test_command_DR <= next_test_command_DR;
    end else begin
      test_command_DR <= test_command_DR;
    end
  end
end

always @(posedge top_default_SCK or negedge top_default_SRST) begin
  if (~top_default_SRST) begin
    test_result_DR <= 2'd0;
  end else begin
    if (capture_test_result) begin
      test_result_DR <= test_result;
    end else if (shift_to_DR & (IR == 2'b10)) begin
      test_result_DR <= next_test_result_DR;
    end else begin
      test_result_DR <= test_result_DR;
    end
  end
end

top_default_async_pos_pulse_W1 UpdateDR_async_sys (
  .CKA(top_default_SCK),
  .CKB(top_default_MCK),
  .RNA(top_default_SRST),
  .RNB(top_default_RST),
  .DA(top_default_UpdateDR),
  .DB(UpdateDR_async)
);

top_default_BUFF_ASYNC_W3_D1_S0 ctr_scan_state_reg (
  .CK(top_default_SCK),
  .RN(top_default_RST),
  .D(top_default_next_scan_state),
  .Q(top_default_scan_state)
);
endmodule

module top_default_sequencer1 (
  top_default_CMD,
  top_default_GRP_ID,
  top_default_MCK,
  top_default_RST,
  top_default_SEQ_CS,
  top_default_TPG_1_1_GO,
  top_default_SEQ_ADDR,
  top_default_SEQ_DONE,
  top_default_SEQ_GO,
  top_default_SEQ_OP_CMD,
  top_default_SEQ_PARITY,
  top_default_TPG_1_1_CS0
);

parameter top_default_grp_id_width      = 1;
parameter top_default_meb_id_width      = 1;
parameter top_default_SEQ_STATE_WIDTH   = 2;
parameter top_default_RAM_SEQ_IDLE      = 2'd0;
parameter top_default_RAM_SEQ_PRE       = 2'd1;
parameter top_default_RAM_SEQ_APPLY     = 2'd2;
parameter top_default_RAM_SEQ_DONE      = 2'd3;
parameter top_default_SEQ_ADDR_WIDTH    = 12;
parameter top_default_action_width      = 3;
parameter Rw                            = 3'b001;
parameter r                             = 3'b010;
parameter rW                            = 3'b011;
parameter w                             = 3'b100;
parameter top_default_cmd_width         = 5;
parameter top_default_nop               = 2'd0;
parameter top_default_pseudo_r          = 2'd1;
parameter top_default_read              = 2'd2;
parameter top_default_write             = 2'd3;
parameter top_default_op_cmd_width      = 2;
parameter top_default_op_cnt_width      = 3;

input   [top_default_cmd_width - 1:0]               top_default_CMD;
input   [top_default_grp_id_width - 1:0]            top_default_GRP_ID;
input                                   top_default_MCK;
input                                   top_default_RST;
input                                   top_default_SEQ_CS;
input                                   top_default_TPG_1_1_GO;
output  [top_default_SEQ_ADDR_WIDTH - 1:0]          top_default_SEQ_ADDR;
output                                  top_default_SEQ_DONE;
output                                  top_default_SEQ_GO;
output  [top_default_op_cmd_width - 1:0]            top_default_SEQ_OP_CMD;
output                                  top_default_SEQ_PARITY;
output                                  top_default_TPG_1_1_CS0;

reg     [top_default_op_cmd_width - 1:0] top_default_SEQ_OP_CMD_s;
reg                                     top_default_SEQ_PARITY_s;
reg                                     top_default_TPG_1_1_CS0;
reg                                     top_default_finish_one_sequence;
reg     [top_default_SEQ_ADDR_WIDTH - 1:0] top_default_max_addr;
reg     [top_default_SEQ_ADDR_WIDTH - 1:0] top_default_next_addr_cnt;
reg     [top_default_op_cnt_width - 1:0] top_default_next_op_cnt;
reg     [top_default_SEQ_STATE_WIDTH - 1:0] top_default_next_state;

wire    [top_default_SEQ_ADDR_WIDTH - 1:0] top_default_SEQ_ADDR;
wire    [top_default_op_cmd_width - 1:0] top_default_SEQ_OP_CMD;
wire                                    top_default_SEQ_PARITY;
wire    [top_default_action_width - 1:0] top_default_action;
wire                                    top_default_cmd_parity;
wire                                    top_default_direction;
wire                                    top_default_finish_one_sequence_4_addr;
wire                                    top_default_go_init;
wire                                    top_default_last_address;
wire    [top_default_op_cnt_width - 1:0] top_default_op_cnt;
wire    [top_default_SEQ_STATE_WIDTH - 1:0] top_default_state;

assign top_default_SEQ_DONE = (top_default_state == top_default_RAM_SEQ_DONE);
assign top_default_SEQ_GO = top_default_go_init;
assign top_default_SEQ_OP_CMD = top_default_SEQ_OP_CMD_s;
assign top_default_SEQ_PARITY = top_default_SEQ_PARITY_s;
assign top_default_go_init = top_default_TPG_1_1_GO;
assign top_default_last_address = top_default_direction ? (top_default_SEQ_ADDR == 12'd0) : (top_default_SEQ_ADDR >= top_default_max_addr);
assign {top_default_direction, top_default_cmd_parity, top_default_action} = top_default_CMD;

always @(*) begin
  if (~top_default_SEQ_CS) begin
    top_default_TPG_1_1_CS0 = 1'd0;
  end else if (top_default_SEQ_ADDR > 12'd4095) begin
    top_default_TPG_1_1_CS0 = 1'd0;
  end else if (top_default_GRP_ID != 1'd1) begin
    top_default_TPG_1_1_CS0 = 1'd0;
  end else begin
    top_default_TPG_1_1_CS0 = 1'd1;
  end
end

always @(*) begin
    case (top_default_action) //synopsys parallel_case
      Rw:   if (top_default_op_cnt >= 3'd1)        top_default_finish_one_sequence = 1'b1;
            else                         top_default_finish_one_sequence = 1'b0;
      r:   if (top_default_op_cnt >= 3'd0)        top_default_finish_one_sequence = 1'b1;
            else                         top_default_finish_one_sequence = 1'b0;
      rW:   if (top_default_op_cnt >= 3'd1)        top_default_finish_one_sequence = 1'b1;
            else                         top_default_finish_one_sequence = 1'b0;
      w:   if (top_default_op_cnt >= 3'd0)        top_default_finish_one_sequence = 1'b1;
            else                         top_default_finish_one_sequence = 1'b0;
      default: top_default_finish_one_sequence = 1'b0;
    endcase
end

always @(*) begin
  if (~top_default_SEQ_CS) begin
    top_default_max_addr = 12'd0;
  end else begin
    case (top_default_GRP_ID)
      1'b1: top_default_max_addr = 12'd4095;
      default: top_default_max_addr = 12'd0;
    endcase
  end
end

always @(*) begin
  if (~top_default_SEQ_CS) begin
    top_default_next_addr_cnt = 12'd0;
  end else begin
    case (top_default_state)
      top_default_RAM_SEQ_IDLE: top_default_next_addr_cnt = (top_default_direction == 1'd0) ? 12'd0 : top_default_max_addr;
      top_default_RAM_SEQ_APPLY: begin
        if (top_default_finish_one_sequence_4_addr) begin
          top_default_next_addr_cnt = (top_default_direction == 1'd0) ? (top_default_SEQ_ADDR + 12'd1) : (top_default_SEQ_ADDR - 12'd1);
        end else begin
          top_default_next_addr_cnt = top_default_SEQ_ADDR;
       end
      end
      default: top_default_next_addr_cnt = top_default_SEQ_ADDR;
    endcase
  end
end

always @(*) begin
  if (~top_default_SEQ_CS) begin
    top_default_next_op_cnt = 3'd0;
  end else begin
    if((top_default_state == top_default_RAM_SEQ_PRE) | (top_default_state == top_default_RAM_SEQ_APPLY))begin
      top_default_next_op_cnt = top_default_finish_one_sequence ? 3'd0 : (top_default_op_cnt + 3'd1);
    end else begin
      top_default_next_op_cnt = 3'd0;
    end
  end
end

always @(*) begin
  if (~top_default_SEQ_CS) begin
    top_default_next_state = top_default_RAM_SEQ_IDLE;
  end else begin
    case (top_default_state)
      top_default_RAM_SEQ_IDLE: top_default_next_state = top_default_RAM_SEQ_PRE;
      top_default_RAM_SEQ_PRE: top_default_next_state = top_default_RAM_SEQ_APPLY;
      top_default_RAM_SEQ_APPLY: top_default_next_state = (top_default_finish_one_sequence & top_default_last_address) ? top_default_RAM_SEQ_DONE : top_default_RAM_SEQ_APPLY;
      top_default_RAM_SEQ_DONE: top_default_next_state = top_default_RAM_SEQ_DONE;
      default: top_default_next_state = top_default_RAM_SEQ_IDLE;
    endcase
  end
end

always@(posedge top_default_MCK or negedge top_default_RST)begin
  if(~top_default_RST)begin
    top_default_SEQ_OP_CMD_s <= top_default_nop;
  end else begin
    if (~top_default_SEQ_CS) begin
      top_default_SEQ_OP_CMD_s <= top_default_nop;
    end else if ((top_default_state != top_default_RAM_SEQ_PRE) & (top_default_state != top_default_RAM_SEQ_APPLY)) begin
      top_default_SEQ_OP_CMD_s <= top_default_nop;
    end else if ((top_default_state == top_default_RAM_SEQ_APPLY) & top_default_last_address & top_default_finish_one_sequence_4_addr) begin
      top_default_SEQ_OP_CMD_s <= top_default_nop;
    end else begin
      case (top_default_action) // synopsys parallel_case
        r : begin
               case (top_default_op_cnt) // synopsys parallel_case
                   3'd0 : top_default_SEQ_OP_CMD_s <= top_default_read;
                 default : top_default_SEQ_OP_CMD_s <= top_default_nop;
               endcase
             end
        Rw : begin
               case (top_default_op_cnt) // synopsys parallel_case
                   3'd0 : top_default_SEQ_OP_CMD_s <= top_default_read;
                   3'd1 : top_default_SEQ_OP_CMD_s <= top_default_write;
                 default : top_default_SEQ_OP_CMD_s <= top_default_nop;
               endcase
             end
        rW : begin
               case (top_default_op_cnt) // synopsys parallel_case
                   3'd0 : top_default_SEQ_OP_CMD_s <= top_default_read;
                   3'd1 : top_default_SEQ_OP_CMD_s <= top_default_write;
                 default : top_default_SEQ_OP_CMD_s <= top_default_nop;
               endcase
             end
        w : begin
               case (top_default_op_cnt) // synopsys parallel_case
                   3'd0 : top_default_SEQ_OP_CMD_s <= top_default_write;
                 default : top_default_SEQ_OP_CMD_s <= top_default_nop;
               endcase
             end
        default : top_default_SEQ_OP_CMD_s <= top_default_nop;
      endcase
    end
  end
end

always@(posedge top_default_MCK or negedge top_default_RST)begin
  if(~top_default_RST)begin
    top_default_SEQ_PARITY_s <= 1'd0;
  end else begin
    if (~top_default_SEQ_CS) begin
      top_default_SEQ_PARITY_s <= top_default_cmd_parity;
    end else if ((top_default_state != top_default_RAM_SEQ_PRE) & (top_default_state != top_default_RAM_SEQ_APPLY)) begin
      top_default_SEQ_PARITY_s <= top_default_cmd_parity;
    end else begin
      case (top_default_action) // synopsys parallel_case
        Rw : begin
               case (top_default_op_cnt) // synopsys parallel_case
                 3'd1 : top_default_SEQ_PARITY_s <= ~top_default_cmd_parity;
                 default : top_default_SEQ_PARITY_s <= top_default_cmd_parity;
               endcase
             end
        rW : begin
               case (top_default_op_cnt) // synopsys parallel_case
                 3'd1 : top_default_SEQ_PARITY_s <= ~top_default_cmd_parity;
                 default : top_default_SEQ_PARITY_s <= top_default_cmd_parity;
               endcase
             end
        default : top_default_SEQ_PARITY_s <= top_default_cmd_parity;
      endcase
    end
  end
end

top_default_BUFF_ASYNC_W1_D1_S0 top_default_finish_one_sequence_4_addr_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_finish_one_sequence),
  .Q(top_default_finish_one_sequence_4_addr)
);

top_default_BUFF_ASYNC_W12_D1_S0 top_default_seq_addr_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_addr_cnt),
  .Q(top_default_SEQ_ADDR)
);

top_default_BUFF_ASYNC_W3_D1_S0 top_default_seq_op_cnt_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_op_cnt),
  .Q(top_default_op_cnt)
);

top_default_BUFF_ASYNC_W2_D1_S0 top_default_seq_state_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_next_state),
  .Q(top_default_state)
);
endmodule

module top_default_tcr_1_1_1 (
  top_default_A_m,
  top_default_A_s,
  top_default_CEN_m,
  top_default_CEN_s,
  top_default_CLK_s,
  top_default_D_m,
  top_default_D_s,
  top_default_MCK,
  top_default_MEN,
  top_default_OEN_m,
  top_default_OEN_s,
  top_default_Q_t,
  top_default_WEN_m,
  top_default_WEN_s,
  top_default_A_t,
  top_default_CEN_t,
  top_default_CLK_t,
  top_default_D_t,
  top_default_OEN_t,
  top_default_Q_m,
  top_default_Q_s,
  top_default_WEN_t
);

parameter top_default_TPG_ADDR_WIDTH    = 12;
parameter top_default_TPG_DATA_IN_WIDTH = 32;
parameter top_default_TPG_DATA_OUT_WIDTH = 32;

input   [top_default_TPG_ADDR_WIDTH - 1:0]          top_default_A_m;
input   [top_default_TPG_ADDR_WIDTH - 1:0]          top_default_A_s;
input                                   top_default_CEN_m;
input                                   top_default_CEN_s;
input                                   top_default_CLK_s;
input   [top_default_TPG_DATA_IN_WIDTH - 1:0]       top_default_D_m;
input   [top_default_TPG_DATA_IN_WIDTH - 1:0]       top_default_D_s;
input                                   top_default_MCK;
input                                   top_default_MEN;
input                                   top_default_OEN_m;
input                                   top_default_OEN_s;
input   [top_default_TPG_DATA_OUT_WIDTH - 1:0]      top_default_Q_t;
input                                   top_default_WEN_m;
input                                   top_default_WEN_s;
output  [top_default_TPG_ADDR_WIDTH - 1:0]          top_default_A_t;
output                                  top_default_CEN_t;
output                                  top_default_CLK_t;
output  [top_default_TPG_DATA_IN_WIDTH - 1:0]       top_default_D_t;
output                                  top_default_OEN_t;
output  [top_default_TPG_DATA_OUT_WIDTH - 1:0]      top_default_Q_m;
output  [top_default_TPG_DATA_OUT_WIDTH - 1:0]      top_default_Q_s;
output                                  top_default_WEN_t;


wire    [31:0]                          top_default_Q_buf;

assign top_default_A_t = top_default_MEN ? top_default_A_m : top_default_A_s;
assign top_default_CEN_t = top_default_MEN ? top_default_CEN_m : top_default_CEN_s;
assign top_default_D_t = top_default_MEN ? top_default_D_m : top_default_D_s;
assign top_default_OEN_t = top_default_MEN ? top_default_OEN_m : top_default_OEN_s;
assign top_default_Q_buf = top_default_Q_t;
assign top_default_Q_s = top_default_Q_buf;
assign top_default_WEN_t = top_default_MEN ? top_default_WEN_m : top_default_WEN_s;

top_default_CKMUX__W1 CLK__ck_mux (
  .I0(top_default_CLK_s),
  .I1(top_default_MCK),
  .S(top_default_MEN),
  .Z(top_default_CLK_t)
);

assign #20.0 top_default_Q_m = top_default_Q_buf;
endmodule

module top_default_tpg_1_1_1 (
  top_default_MCK,
  top_default_Q_m,
  top_default_RST,
  top_default_SEQ_ADDR,
  top_default_SEQ_OP_CMD,
  top_default_SEQ_PARITY,
  top_default_TPG_CS0,
  top_default_A_m,
  top_default_CEN_m,
  top_default_D_m,
  top_default_OEN_m,
  top_default_TPG_GO,
  top_default_WEN_m
);

parameter top_default_TPG_ADDR_WIDTH    = 12;
parameter top_default_TPG_DATA_WIDTH    = 32;
parameter top_default_TPG_DATA_IN_WIDTH = 32;
parameter top_default_TPG_DATA_OUT_WIDTH = 32;
parameter top_default_pseudo_r          = 2'b01;
parameter top_default_read              = 2'b10;
parameter top_default_write             = 2'b11;
parameter top_default_pattern_0         = 32'h0000_0000;
parameter top_default_expect_data       = 32'h0000_0000;

input                                   top_default_MCK;
input   [top_default_TPG_DATA_OUT_WIDTH - 1:0]      top_default_Q_m;
input                                   top_default_RST;
input   [top_default_TPG_ADDR_WIDTH - 1:0]          top_default_SEQ_ADDR;
input   [1:0]                           top_default_SEQ_OP_CMD;
input                                   top_default_SEQ_PARITY;
input                                   top_default_TPG_CS0;
output  [top_default_TPG_ADDR_WIDTH - 1:0]          top_default_A_m;
output                                  top_default_CEN_m;
output  [top_default_TPG_DATA_IN_WIDTH - 1:0]       top_default_D_m;
output                                  top_default_OEN_m;
output                                  top_default_TPG_GO;
output                                  top_default_WEN_m;

reg     [11:0]                          top_default_ADDR_bist;
reg                                     top_default_CS_bist;
reg     [31:0]                          top_default_D_bist;
reg                                     OE_bist;
reg                                     top_default_WE_bist;

wire    [11:0]                          top_default_A_buf_in;
wire    [11:0]                          top_default_A_buf_out;
wire                                    top_default_CEN_buf_in;
wire                                    top_default_CEN_buf_out;
wire    [31:0]                          top_default_D_buf_in;
wire    [31:0]                          top_default_D_buf_out;
wire                                    OEN_buf_in;
wire                                    OEN_buf_out;
wire                                    top_default_PARITY_INV;
wire    [top_default_TPG_ADDR_WIDTH - 1:0] top_default_TPG_ADDR_SCMB;
wire                                    top_default_TPG_GO_inner;
wire                                    top_default_WEN_buf_in;
wire                                    top_default_WEN_buf_out;
wire                                    top_default_compare_buf_in;
wire                                    top_default_compare_buf_out;
wire    [top_default_TPG_DATA_OUT_WIDTH - 1:0] fault_bit;
wire                                    top_default_parity_buf_in;
wire                                    top_default_parity_buf_out;
wire                                    top_default_pre_go;
wire                                    top_default_tpg_cs;

assign top_default_A_buf_in = top_default_TPG_CS0 ? top_default_ADDR_bist : 12'h000;
assign top_default_A_m = top_default_A_buf_out;
assign top_default_CEN_buf_in = top_default_TPG_CS0 ? top_default_CS_bist : 1'h1;
assign top_default_CEN_m = top_default_CEN_buf_out;
assign top_default_D_buf_in = top_default_TPG_CS0 ? top_default_D_bist : 32'h0000_0000;
assign top_default_D_m = top_default_D_buf_out;
assign OEN_buf_in = top_default_TPG_CS0 ? OE_bist : 1'h1;
assign top_default_OEN_m = OEN_buf_out;
assign top_default_PARITY_INV = top_default_SEQ_PARITY;
assign top_default_TPG_ADDR_SCMB = top_default_SEQ_ADDR;
assign top_default_TPG_GO = top_default_TPG_GO_inner;
assign top_default_WEN_buf_in = top_default_TPG_CS0 ? top_default_WE_bist : 1'h1;
assign top_default_WEN_m = top_default_WEN_buf_out;
assign top_default_compare_buf_in = ~top_default_tpg_cs | (top_default_SEQ_OP_CMD != top_default_read);
assign fault_bit = top_default_Q_m ^ (top_default_parity_buf_out ? top_default_expect_data : ~top_default_expect_data);
assign top_default_parity_buf_in = top_default_PARITY_INV;
assign top_default_pre_go = top_default_compare_buf_out | ~(|fault_bit);
assign top_default_tpg_cs = top_default_TPG_CS0;

always @(*) begin
    top_default_ADDR_bist = top_default_TPG_ADDR_SCMB;
end

always @(*) begin
  if (~top_default_tpg_cs) begin
    top_default_CS_bist = 1'h1;
  end else begin
    case (top_default_SEQ_OP_CMD)
      top_default_pseudo_r: top_default_CS_bist = 1'h0;
      top_default_read:     top_default_CS_bist = 1'h0;
      top_default_write:    top_default_CS_bist = 1'h0;
      default:  top_default_CS_bist = 1'h1;
    endcase
  end
end

always @(*) begin
  case(top_default_PARITY_INV) // synopsys parallel_case
    1'b0    : top_default_D_bist = ~top_default_expect_data[top_default_TPG_DATA_IN_WIDTH - 1:0];
    1'b1    : top_default_D_bist = top_default_expect_data[top_default_TPG_DATA_IN_WIDTH - 1:0];
    default : top_default_D_bist = top_default_expect_data[top_default_TPG_DATA_IN_WIDTH - 1:0];
  endcase
end

always @(*) begin
  if (~top_default_tpg_cs) begin
    OE_bist = 1'h1;
  end else begin
    case (top_default_SEQ_OP_CMD)
      top_default_pseudo_r: OE_bist = 1'h0;
      top_default_read:     OE_bist = 1'h0;
      default:  OE_bist = 1'h1;
    endcase
  end
end

always @(*) begin
  if (~top_default_tpg_cs) begin
    top_default_WE_bist = 1'h1;
  end else begin
    case (top_default_SEQ_OP_CMD)
      top_default_write:    top_default_WE_bist = 1'h0;
      default:  top_default_WE_bist = 1'h1;
    endcase
  end
end

assign #20.0 top_default_A_buf_out = top_default_A_buf_in;

assign #20.0 top_default_CEN_buf_out = top_default_CEN_buf_in;

top_default_BUFF_ASYNC_W1_D1_S1 top_default_ram_tpg_compare_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_compare_buf_in),
  .Q(top_default_compare_buf_out)
);

assign #20.0 top_default_D_buf_out = top_default_D_buf_in;

top_default_BUFF_ASYNC_W1_D1_S1 top_default_ram_tpg_go_inner_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_pre_go),
  .Q(top_default_TPG_GO_inner)
);

top_default_BUFF_ASYNC_W1_D1_S1 ram_tpg_oen_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(OEN_buf_in),
  .Q(OEN_buf_out)
);

top_default_BUFF_ASYNC_W1_D1_S0 top_default_ram_tpg_parity_reg (
  .CK(top_default_MCK),
  .RN(top_default_RST),
  .D(top_default_parity_buf_in),
  .Q(top_default_parity_buf_out)
);

assign #20.0 top_default_WEN_buf_out = top_default_WEN_buf_in;
endmodule

module top_default_async_pos_pulse_W1(
  CKA,
  CKB,
  RNA,
  RNB,
  DA,
  DB
);

input                                   CKA;
input                                   CKB;
input                                   RNA;
input                                   RNB;
input                                   DA;
output                                  DB;

wire                                    a0;
wire                                    ab;
wire                                    b0;
wire                                    b1;
wire                                    b2;


assign a0 = DA ^ ab;
assign DB = b1 ^ b2;


top_default_BUFF_ASYNC_W1_D1_S0 sys_a (
  .CK(CKA),
  .RN(RNA),
  .D(a0),
  .Q(ab)
);

top_default_BUFF_ASYNC_W1_D1_S0 sys_b0 (
  .CK(CKB),
  .RN(RNB),
  .D(ab),
  .Q(b0)
);

top_default_BUFF_ASYNC_W1_D1_S0 sys_b1 (
  .CK(CKB),
  .RN(RNB),
  .D(b0),
  .Q(b1)
);

top_default_BUFF_ASYNC_W1_D1_S0 sys_b2 (
  .CK(CKB),
  .RN(RNB),
  .D(b1),
  .Q(b2)
);
endmodule

module top_default_BUFF_ASYNC_W1_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input                                   D;
  output                                  Q;
  
  reg                                     Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 1'b0;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W1_D1_S1 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input                                   D;
  output                                  Q;
  
  reg                                     Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 1'b1;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W2_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input   [1:0]                           D;
  output  [1:0]                           Q;
  
  reg     [1:0]                           Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 2'b00;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W3_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input   [2:0]                           D;
  output  [2:0]                           Q;
  
  reg     [2:0]                           Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 3'b000;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W4_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input   [3:0]                           D;
  output  [3:0]                           Q;
  
  reg     [3:0]                           Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 4'b0000;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W5_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input   [4:0]                           D;
  output  [4:0]                           Q;
  
  reg     [4:0]                           Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 5'b00000;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_BUFF_ASYNC_W12_D1_S0 (CK, RN, D, Q);
  input                                   CK;
  input                                   RN;
  input   [11:0]                          D;
  output  [11:0]                          Q;
  
  reg     [11:0]                          Q;
  
  always @(posedge CK or negedge RN) begin
    if (~RN) begin
      Q <= 12'b000000000000;
    end else begin
      Q <= D;
    end
  end
endmodule

module top_default_CKMUX__W1 (I0, I1, S, Z);
  input                                   I0;
  input                                   I1;
  input                                   S;
  output                                  Z;
  
  reg                                     Z;

  always@(*)begin
    case(S)
      1'b0   : Z = I0 ;
      1'b1   : Z = I1 ;
      default: Z = 1'b0;
    endcase
  end
endmodule
