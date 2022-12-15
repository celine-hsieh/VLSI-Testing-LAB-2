/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Tue Dec  6 13:56:29 2022
/////////////////////////////////////////////////////////////


module s27 ( G17, G0, G1, G2, G3, CLK, test_se, SCAN_IN_1, SCAN_OUT_1 );
  input G0, G1, G2, G3, CLK, test_se, SCAN_IN_1;
  output G17, SCAN_OUT_1;
  wire   G5, G10, G6, G13, n7, n8, n9, n10;

  SDFFQX1 dff_2 ( .D(n10), .SI(G5), .SE(test_se), .CK(CLK), .Q(G6) );
  SDFFQX1 dff_1 ( .D(G10), .SI(SCAN_IN_1), .SE(test_se), .CK(CLK), .Q(G5) );
  SDFFQX1 dff_3 ( .D(G13), .SI(G6), .SE(test_se), .CK(CLK), .Q(SCAN_OUT_1) );
  NOR2X1 U15 ( .A(n10), .B(n7), .Y(G10) );
  CLKINVX1 U16 ( .A(n10), .Y(G17) );
  NOR2X1 U17 ( .A(n9), .B(G5), .Y(n10) );
  AOI22X1 U18 ( .A0(G3), .A1(n8), .B0(G6), .B1(n7), .Y(n9) );
  NOR2X1 U19 ( .A(G1), .B(SCAN_OUT_1), .Y(n8) );
  NOR2X1 U20 ( .A(G2), .B(n8), .Y(G13) );
  CLKINVX1 U21 ( .A(G0), .Y(n7) );
endmodule

