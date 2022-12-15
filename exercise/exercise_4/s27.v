// s27
// 4 inputs  (4 PIs)
// 1 outputs (1 POs)
// 10 gates (8 gates + 2 inverters + 0 buffers )
// ( 1 AND + 2 OR + 1 NAND + 4 NOR )
// 3 DFF
// Time: Thu Dec  4 12:15:20 2008

module s27 ( G17 ,
             G0 , G1 , G2 , G3 , CLK );

output G17;

input G0 , G1 , G2 , G3;
input CLK;

wire G5 , G6 , G7 , G14 , G8 , G15 , G16 , G9 , G10 , G11;
wire G12 , G13;


DFFHQX1 dff_1 ( .Q(G5) , .D(G10) , .CK(CLK) );
DFFHQX1 dff_2 ( .Q(G6) , .D(G11) , .CK(CLK) );
DFFHQX1 dff_3 ( .Q(G7) , .D(G13) , .CK(CLK) );

not not_1 ( G14 , G0 );
not not_2 ( G17 , G11 );
and and_3 ( G8 , G14 , G6 );
or or_4 ( G15 , G12 , G8 );
or or_5 ( G16 , G3 , G8 );
nand nand_6 ( G9 , G16 , G15 );
nor nor_7 ( G10 , G14 , G11 );
nor nor_8 ( G11 , G5 , G9 );
nor nor_9 ( G12 , G1 , G7 );
nor nor_10 ( G13 , G2 , G12 );

endmodule
