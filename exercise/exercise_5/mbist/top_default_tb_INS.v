`timescale 1ns / 1ps
`define bist_done       top0.top_default_bist0.top_default_ctr.top_default_MRD
`define bist_done_ins   top0.top_default_ctr.top_default_MRD
`define bist_ctr_instance   top0.top_default_bist0.top_default_ctr
`define bist_ctr_instance_ins   top0.top_default_ctr
module stimulus;
  parameter bcyc                          = 100.0;
  parameter scyc                          = 100.0;
  parameter cyc                           = scyc;
  parameter SDI_width                     = 1;
  parameter test_result_width             = 2;
  parameter IR_width                      = 2;
  parameter COMMAND_IR_ID                 = 1;
  parameter TEST_RESULT_IR_ID             = 2;
  
  reg                                     MCK;
  reg                                     RSTN;
  reg                                     SCK;
  reg                                     SDI;
  reg                                     SEN;
  reg                                     SRST;
  wire                                    SDO;
  

  integer                                 i;
  reg                                     MEN;
  reg                                     MGO;
  reg                                     MRD;
  reg                                     capture_en;


//insert top

// Top Module Instance Begin.
  wire                          CLK;
  wire                          CEN;
  wire                          WEN;
  wire    [11:0]                A;
  wire    [31:0]                Q;
  wire    [31:0]                D;
  wire                          OEN;
top top0(
  .CLK(CLK),
  .CEN(CEN),
  .WEN(WEN),
  .A(A),
  .Q(Q),
  .D(D),
  .OEN(OEN));

// Top Module Instance End.

assign  SDO = `bist_ctr_instance_ins.top_default_SDO;

initial begin
  force stimulus.top0.top_default_MCK = MCK;
  force stimulus.top0.top_default_RSTN = RSTN;
  force stimulus.top0.top_default_SCK = SCK;
  force stimulus.top0.top_default_SDI = SDI;
  force stimulus.top0.top_default_SEN = SEN;
  force stimulus.top0.top_default_SRST = SRST;
end

initial begin
  force stimulus.top0.MEM.CLK = MCK;
end

always begin
  #(bcyc/2)   MCK = ~MCK;
end

always begin
  #(scyc/2)   SCK = ~SCK;
end


initial begin
  #0          init_bench;
  #cyc        reset_bench;


  /* Simulation */

  MEN = 1;
  #cyc	send_command({MEN});
  while (!MRD)begin
      #(cyc*10)	capture_test_result({MGO, MRD});
  end

  /* Simulation Finish */
  
  MEN = 0;  #cyc	send_command({MEN});
  #cyc;
  if (MGO === 1) begin
      $display("\n Test All Result: Pass!\n");
  end else begin
      $display("\n Test All Result: Failed!\n");
  end
  $finish;
end

`ifndef FAULT
  initial begin
    #(cyc*58089);
    #(cyc*58089/5);

    $display("\nSimulation time-out!\n");
    $finish;
  end
`endif
    
task init_bench;
  begin
              MCK = 0;
              SCK = 0;
              SRST = 1;
              SEN = 0;
              SDI = 0;
              MGO = 0;
              MRD = 0;
              RSTN = 1;
              MEN = 0;
              capture_en = 0;
  end
endtask // init_bench

task reset_bench;
  begin
    #cyc      SRST = 0;
              RSTN = 0;
    #(cyc*2)  SRST = 1;
              RSTN = 1;
    #cyc;
  end
endtask // reset_bench

task choice_IR;
  input [IR_width-1:0] IR_id;
  integer IR_i;
  begin
              SEN = 1;
              for (IR_i = 0; IR_i < IR_width; IR_i = IR_i + 1) begin
                SDI = IR_id[IR_i];
              #cyc;
              end
              SEN = 0;
              SDI = 0;
  end
endtask // choice_IR

task send_command;
  input   [SDI_width - 1:0]               SDI_data;
  integer SDI_i;
  begin
              choice_IR(COMMAND_IR_ID);
              #(cyc*5);

              SEN = 1;
              for (SDI_i = 0; SDI_i < SDI_width; SDI_i = SDI_i + 1) begin
                SDI = SDI_data[SDI_i];
    #cyc        ; // shift in
              end
              SEN = 0;
              SDI = 0;
  end
endtask // send_command

task capture_test_result;
  output [test_result_width-1:0] result_data;
  integer result_i;
  begin
              choice_IR(TEST_RESULT_IR_ID);
              #(cyc*5);

              SEN = 1;
              for (result_i = 0; result_i < test_result_width; result_i = result_i + 1) begin
                capture_en = 1;
                result_data[result_i] = SDO;
    #cyc        ; // shift out
              end
              capture_en = 0;
              SEN = 0;
              SDI = 0;
  end
endtask // capture_test_result

initial begin
  `ifdef NETLIST
    $sdf_annotate("top_default_netlist.sdf",top0.top_default_bist0);
  `endif

  `ifdef DUMP_FSDB
    `ifdef NETLIST
      $fsdbDumpfile("top_default_tb_netlist.fsdb");
    `else
      $fsdbDumpfile("top_default_tb.fsdb");
    `endif
    $fsdbDumpvars(stimulus);
  `endif
  `ifdef DUMP_VCD
    `ifdef NETLIST
      $dumpfile("top_default_tb_netlist.vcd");
    `else
      $dumpfile("top_default_tb.vcd");
    `endif
    $dumpvars(0,stimulus);
  `endif
  `ifdef DUMP_EVCD
    $dumpports(evcd_top0,"top_default_tb.evcd", ,2);
  `endif
end

endmodule

`ifdef DUMP_EVCD
module evcd_top(
  input       top_default_RSTN,
  input       top_default_SDI,
  input       top_default_SDO,
  input       top_default_SEN,
  input       top_default_SRST
  );
endmodule  
`endif
