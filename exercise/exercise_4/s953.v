//# 16 inputs
//# 23 outputs
//# 29 D-type flipflops
//# 84 inverters
//# 311 gates (49 ANDs + 114 NANDs + 36 ORs + 112 NORs)


module s953(GND,VDD,CLK,ActBmHS1,ActRtHS1,DumpIIHS1,FullIIHS1,FullOHS1,GoBmHS1,
  GoRtHS1,
  IInDoneHS1,LdProgHS1,LoadIIHHS1,LoadOHHS1,LxHIInHS1,Mode0HS1,Mode1HS1,
  Mode2HS1,NewLineHS1,NewTrHS1,OutAvHS1,OutputHS1,Prog_0,Prog_1,Prog_2,
  Rdy1BmHS1,Rdy1RtHS1,Rdy2BmHS1,Rdy2RtHS1,ReRtTSHS1,ReWhBufHS1,RtTSHS1,
  SeFullIIHS1,SeFullOHS1,SeOutAvHS1,ShftIIRHS1,ShftORHS1,TgWhBufHS1,TpArrayHS1,
  TxHIInHS1,WantBmHS1,WantRtHS1);
input GND,VDD,CLK,Rdy1RtHS1,Rdy2RtHS1,Rdy1BmHS1,Rdy2BmHS1,IInDoneHS1,RtTSHS1,
  TpArrayHS1,
  OutputHS1,WantBmHS1,WantRtHS1,OutAvHS1,FullOHS1,FullIIHS1,Prog_2,Prog_1,
  Prog_0;
output ReWhBufHS1,TgWhBufHS1,SeOutAvHS1,LdProgHS1,Mode2HS1,ReRtTSHS1,
  ShftIIRHS1,NewTrHS1,Mode1HS1,ShftORHS1,ActRtHS1,Mode0HS1,TxHIInHS1,LxHIInHS1,
  NewLineHS1,ActBmHS1,GoBmHS1,LoadOHHS1,DumpIIHS1,SeFullOHS1,GoRtHS1,
  LoadIIHHS1,SeFullIIHS1;

  wire State_5,II2,State_4,II3,State_3,II4,State_2,II5,State_1,II6,State_0,II7,
    II8,II9,II10,II11,II12,II13,II14,II15,II16,II17,II18,II19,II20,II21,II22,
    II23,II24,II25,II26,II27,II28,II29,II30,II265,II266,II263,II264,II271,
    II272,II284,II283,II282,II275,II274,II281,II280,II279,II278,II277,II276,
    II269,II267,II344,II345,II327,II326,II625,II624,II494,II495,II513,II512,
    II508,II509,II571,II570,II331,II330,II441,II440,II504,II505,II339,II338,
    II342,II343,II424,II425,II486,II487,II437,II436,II451,II450,II459,II458,
    II535,II534,II554,II555,II390,II391,II341,II340,II397,II396,II415,II414,
    II469,II468,II323,II322,II398,II399,II428,II429,II452,II453,II444,II445,
    II380,II381,II367,II366,II475,II474,II431,II430,II435,II434,II467,II466,
    II370,II371,II377,II376,II358,II359,II552,II553,II566,II567,II410,II411,
    II355,II354,II363,II362,II379,II378,II423,II422,II329,II328,II295,II446,
    II447,II771,II770,II691,II690,II769,II768,II477,II476,II405,II404,II661,
    II660,II297,II663,II662,II294,II351,II350,II779,II778,II311,II287,II300,
    II303,II840_2,II873_1,II840_1,II850_1,II610,II612,II963_1,II335,II966_1,
    II357,II1025_1,II325,II910_1,II360,II850_2,II614,II1044_1,II497,II1077_1,
    II1083_1,II506,II1170_1,II393,II1193_1,II521,II1184_1,II1080_1,II382,
    II1107_1,II1103_1,II418,II1196_1,II1040_1,II1103_2,II1180_1,II1031_1,II317,
    II1166_1,II529,II1160_1,II412,II1034_1,II1163_1,II531,II1136_1,II590,
    II1166_2,II1173_1,II1110_1,II388,II1188_2,II1199_2,II789_1,II580,II1184_2,
    II1188_1,II1143_2,II596,II1100_1,II384,II1128_1,II568,II1056_1,II1176_1,
    II1097_1,II556,II1180_2,II348,II1176_2,II600,II810_1,II364,II562,II1199_1,
    II1143_1,II353,II1140_1,II573,II1094_1,II582,II1047_2,II881_1,II1047_1,
    II881_2,II857_1,II493,II834_1,II523,II892_1,II1037_1,II336,II861_2,II457,
    II892_2,II896_1,II320,II861_1,II455,II1121_1,II589,II796_1,II1203_2,II543,
    II577,II1216_1,II449,II537,II1113_1,II1118_1,II479,II1203_1,II463,II491,
    II1216_2,II465,II489,II1154_1,II1028_1,II1132_1,II593,II595,II1132_2,
    II1148_1,II565,II1121_2,II559,II1125_1,II561,II1087_1,II526,II814_1,
    II1157_1,II599,II1210_1,II421,II1091_1,II585,II587,II829_1,II547,II575,
    II1213_1,II498,II1207_1,II519,II579,II1151_1,II511,II473,II539,II525,II439,
    II514,II461,II318,II394,II482,II372,II374,II485,II548,II503,II551,II442,
    II481,II680,II407,II532,II432,II500,II403,II634,II609,II416,II676,II682,
    II738,II746,II706,II545,II517,II715,II713,II719,II717,II675,II725,II733,
    II729,II731,II702,II684,II686,II678,II655,II657,II671,II673,II742,II689,
    II693,II711,II659,II669,II667,II744,II740,II721,II723,II737,II735,II704,
    II699,II695,II697,II750,II665,II700,II708,II777,II767,II386,II315,II347,
    II470,II333,II540,II408;

  dff DFF_0(CLK,State_5,II2);
  dff DFF_1(CLK,State_4,II3);
  dff DFF_2(CLK,State_3,II4);
  dff DFF_3(CLK,State_2,II5);
  dff DFF_4(CLK,State_1,II6);
  dff DFF_5(CLK,State_0,II7);
  dff DFF_6(CLK,ActRtHS1,II8);
  dff DFF_7(CLK,ActBmHS1,II9);
  dff DFF_8(CLK,GoRtHS1,II10);
  dff DFF_9(CLK,GoBmHS1,II11);
  dff DFF_10(CLK,NewTrHS1,II12);
  dff DFF_11(CLK,ReRtTSHS1,II13);
  dff DFF_12(CLK,Mode0HS1,II14);
  dff DFF_13(CLK,Mode1HS1,II15);
  dff DFF_14(CLK,Mode2HS1,II16);
  dff DFF_15(CLK,NewLineHS1,II17);
  dff DFF_16(CLK,ShftORHS1,II18);
  dff DFF_17(CLK,ShftIIRHS1,II19);
  dff DFF_18(CLK,LxHIInHS1,II20);
  dff DFF_19(CLK,TxHIInHS1,II21);
  dff DFF_20(CLK,LoadOHHS1,II22);
  dff DFF_21(CLK,LoadIIHHS1,II23);
  dff DFF_22(CLK,SeOutAvHS1,II24);
  dff DFF_23(CLK,SeFullOHS1,II25);
  dff DFF_24(CLK,SeFullIIHS1,II26);
  dff DFF_25(CLK,TgWhBufHS1,II27);
  dff DFF_26(CLK,ReWhBufHS1,II28);
  dff DFF_27(CLK,LdProgHS1,II29);
  dff DFF_28(CLK,DumpIIHS1,II30);
  not NOT_0(II265,Rdy1BmHS1);
  not NOT_1(II266,Rdy2BmHS1);
  not NOT_2(II263,Rdy1RtHS1);
  not NOT_3(II264,Rdy2RtHS1);
  not NOT_4(II271,WantBmHS1);
  not NOT_5(II272,WantRtHS1);
  not NOT_6(II284,Prog_0);
  not NOT_7(II283,Prog_1);
  not NOT_8(II282,Prog_2);
  not NOT_9(II275,FullIIHS1);
  not NOT_10(II274,FullOHS1);
  not NOT_11(II281,State_0);
  not NOT_12(II280,State_1);
  not NOT_13(II279,State_2);
  not NOT_14(II278,State_3);
  not NOT_15(II277,State_4);
  not NOT_16(II276,State_5);
  not NOT_17(II269,TpArrayHS1);
  not NOT_18(II267,IInDoneHS1);
  not NOT_19(II344,II345);
  not NOT_20(II327,II326);
  not NOT_21(II625,II624);
  not NOT_22(II494,II495);
  not NOT_23(II513,II512);
  not NOT_24(II508,II509);
  not NOT_25(II571,II570);
  not NOT_26(II331,II330);
  not NOT_27(II441,II440);
  not NOT_28(II504,II505);
  not NOT_29(II339,II338);
  not NOT_30(II342,II343);
  not NOT_31(II424,II425);
  not NOT_32(II486,II487);
  not NOT_33(II437,II436);
  not NOT_34(II451,II450);
  not NOT_35(II459,II458);
  not NOT_36(II535,II534);
  not NOT_37(II554,II555);
  not NOT_38(II390,II391);
  not NOT_39(II341,II340);
  not NOT_40(II397,II396);
  not NOT_41(II415,II414);
  not NOT_42(II469,II468);
  not NOT_43(II16,II323);
  not NOT_44(II322,II323);
  not NOT_45(II398,II399);
  not NOT_46(II428,II429);
  not NOT_47(II452,II453);
  not NOT_48(II444,II445);
  not NOT_49(II380,II381);
  not NOT_50(II13,II415);
  not NOT_51(II367,II366);
  not NOT_52(II475,II474);
  not NOT_53(II431,II430);
  not NOT_54(II435,II434);
  not NOT_55(II467,II466);
  not NOT_56(II370,II371);
  not NOT_57(II377,II376);
  not NOT_58(II358,II359);
  not NOT_59(II552,II553);
  not NOT_60(II566,II567);
  not NOT_61(II410,II411);
  not NOT_62(II355,II354);
  not NOT_63(II363,II362);
  not NOT_64(II379,II378);
  not NOT_65(II423,II422);
  not NOT_66(II329,II328);
  not NOT_67(II18,II295);
  not NOT_68(II446,II447);
  not NOT_69(II771,II770);
  not NOT_70(II691,II690);
  not NOT_71(II769,II768);
  not NOT_72(II477,II476);
  not NOT_73(II405,II404);
  not NOT_74(II661,II660);
  not NOT_75(II20,II297);
  not NOT_76(II663,II662);
  not NOT_77(II17,II294);
  not NOT_78(II351,II350);
  not NOT_79(II779,II778);
  not NOT_80(II7,II311);
  not NOT_81(II10,II287);
  not NOT_82(II23,II300);
  not NOT_83(II26,II303);
  and AND2_0(II840_2,Prog_1,Prog_0);
  and AND2_1(II873_1,II263,II264);
  and AND2_2(II840_1,II283,II284);
  and AND2_3(II850_1,II610,II612);
  and AND2_4(II963_1,II335,II345);
  and AND2_5(II966_1,II335,II357);
  and AND2_6(II1025_1,Rdy2BmHS1,II325);
  and AND2_7(II910_1,II277,II360);
  and AND2_8(II850_2,WantRtHS1,II614);
  and AND2_9(II1044_1,II497,II570);
  and AND2_10(II1077_1,II458,II512);
  and AND2_11(II1083_1,II458,II506);
  and AND2_12(II1170_1,II393,II414);
  and AND2_13(II1193_1,II424,II521);
  and AND2_14(II1184_1,II486,II506);
  and AND2_15(II1080_1,Prog_0,II382);
  and AND2_16(II1107_1,II284,II382);
  and AND2_17(II1103_1,State_5,II418);
  and AND2_18(II1196_1,II345,II418);
  and AND2_19(II1040_1,OutputHS1,II322);
  and AND2_20(II1103_2,Prog_0,II322);
  and AND2_21(II1180_1,II267,II322);
  and AND2_22(II1031_1,II317,II398);
  and AND2_23(II1166_1,II357,II529);
  and AND2_24(II1160_1,II281,II412);
  and AND2_25(II1034_1,II317,II428);
  and AND2_26(II1163_1,II345,II531);
  and AND2_27(II1136_1,II282,II590);
  and AND2_28(II1166_2,Prog_2,II452);
  and AND2_29(II1173_1,II263,II466);
  and AND2_30(II1110_1,II277,II388);
  and AND2_31(II1188_2,II267,II388);
  and AND2_32(II1199_2,II267,II380);
  and AND2_33(II789_1,II278,II580);
  and AND2_34(II1184_2,II269,II376);
  and AND2_35(II1188_1,State_1,II376);
  and AND2_36(II1143_2,II274,II596);
  and AND2_37(II1100_1,WantBmHS1,II384);
  and AND2_38(II1128_1,II378,II568);
  and AND2_39(II1056_1,II280,II358);
  and AND2_40(II1176_1,State_4,II566);
  and AND2_41(II1097_1,II317,II556);
  and AND2_42(II1180_2,II348,II554);
  and AND2_43(II1176_2,Prog_0,II600);
  and AND2_44(II810_1,II364,II562);
  and AND2_45(II1199_1,II338,II364);
  and AND2_46(II1143_1,II353,II404);
  and AND2_47(II1140_1,II271,II573);
  and AND2_48(II1094_1,WantRtHS1,II582);
  or OR2_0(II1047_2,Rdy1BmHS1,Prog_0);
  or OR2_1(II881_1,IInDoneHS1,Prog_2);
  or OR2_2(II1047_1,II264,II284);
  or OR2_3(II881_2,II282,II326);
  or OR2_4(II857_1,Prog_0,II493);
  or OR2_5(II834_1,FullIIHS1,II523);
  or OR2_6(II892_1,II279,II495);
  or OR2_7(II1037_1,Prog_0,II336);
  or OR2_8(II861_2,II265,II457);
  or OR2_9(II892_2,II269,II625);
  or OR2_10(II896_1,II279,II320);
  or OR2_11(II861_1,II263,II455);
  or OR2_12(II1121_1,State_0,II589);
  or OR2_13(II796_1,II283,II323);
  or OR2_14(II1203_2,II543,II577);
  or OR2_15(II1216_1,II449,II537);
  or OR2_16(II1113_1,II282,II415);
  or OR2_17(II1118_1,State_1,II479);
  or OR2_18(II1203_1,II463,II491);
  or OR2_19(II1216_2,II465,II489);
  or OR2_20(II1154_1,II267,II371);
  or OR2_21(II1028_1,II367,II493);
  or OR2_22(II1132_1,II593,II595);
  or OR2_23(II1132_2,II281,II467);
  or OR2_24(II1148_1,II267,II565);
  or OR2_25(II1121_2,Rdy2BmHS1,II559);
  or OR2_26(II1125_1,Rdy2RtHS1,II561);
  or OR2_27(II1087_1,Prog_0,II526);
  or OR2_28(II814_1,FullOHS1,II355);
  or OR2_29(II1157_1,II274,II599);
  or OR2_30(II1210_1,II339,II421);
  or OR2_31(II1091_1,II585,II587);
  or OR2_32(II829_1,II547,II575);
  or OR2_33(II1213_1,II498,II547);
  or OR2_34(II1207_1,II519,II579);
  or OR2_35(II1151_1,II405,II537);
  nand NAND2_0(II357,Rdy1BmHS1,Rdy2BmHS1);
  nand NAND2_1(II345,Rdy1RtHS1,Rdy2RtHS1);
  nand NAND2_2(II519,Rdy2BmHS1,WantBmHS1);
  nand NAND2_3(II317,FullOHS1,FullIIHS1);
  nand NAND2_4(II511,State_1,State_0);
  nand NAND2_5(II543,II265,Rdy2BmHS1);
  nand NAND2_6(II473,II265,II266);
  nand NAND2_7(II493,Rdy1BmHS1,II266);
  nand NAND2_8(II537,II263,Rdy2RtHS1);
  nand NAND2_9(II575,II271,II284);
  nand NAND2_10(II393,II282,II283);
  nand NAND2_11(II587,Prog_0,II317);
  nand NAND2_12(II523,II274,Prog_2);
  nand NAND2_13(II539,II263,II274);
  nand NAND2_14(II595,Rdy2BmHS1,II274);
  nand NAND2_15(II495,II280,II281);
  nand NAND2_16(II521,RtTSHS1,II278);
  nand NAND2_17(II335,II277,II282);
  nand NAND2_18(II525,II277,II280);
  nand NAND2_19(II509,II276,II277);
  nand NAND2_20(II336,II473,II357);
  nand NAND2_21(II330,WantBmHS1,II493);
  nand NAND2_22(II439,Prog_0,II514);
  nand NAND2_23(II568,II1047_1,II1047_2);
  nand NAND2_24(II360,II881_1,II881_2);
  nand NAND2_25(II457,II266,II506);
  nand NAND2_26(II461,II282,II506);
  nand NAND2_27(II320,II495,II511);
  nand NAND2_28(II455,II264,II512);
  nand NAND2_29(II489,II506,II570);
  nand NAND2_30(II505,II279,II570);
  nand NAND2_31(II338,II857_1,II439);
  nand NAND2_32(II318,II834_1,II277);
  nand NAND2_33(II497,II455,II457);
  nand NAND3_0(II343,II276,II394,II482);
  nand NAND2_34(II589,Prog_2,II482);
  nand NAND3_1(II425,State_2,II281,II508);
  nand NAND2_35(II487,State_3,II508);
  nand NAND2_36(II562,II1037_1,II439);
  nand NAND2_37(II372,II892_1,II892_2);
  nand NAND2_38(II374,II896_1,II461);
  nand NAND2_39(II340,II861_1,II861_2);
  nand NAND2_40(II485,II277,II548);
  nand NAND2_41(II491,State_5,II548);
  nand NAND3_2(II323,State_4,II281,II436);
  nand NAND2_42(II399,II284,II436);
  nand NAND3_3(II577,State_0,II318,II436);
  nand NAND2_43(II429,Prog_0,II450);
  nand NAND3_4(II449,State_1,II318,II450);
  nand NAND3_5(II453,II277,II327,II504);
  nand NAND2_44(II503,II277,II504);
  nand NAND2_45(II551,II279,II442);
  nand NAND2_46(II445,II374,II534);
  nand NAND2_47(II381,State_3,II396);
  nand NAND2_48(II479,II279,II486);
  nand NAND2_49(II481,II372,II486);
  nand NAND2_50(II529,II399,II489);
  nand NAND2_51(II531,II429,II491);
  nand NAND2_52(II371,II279,II382);
  nand NAND2_53(II680,II445,II381);
  nand NAND2_54(II407,II412,II532);
  nand NAND2_55(II593,II284,II430);
  nand NAND3_6(II359,Rdy1RtHS1,II432,II532);
  nand NAND2_56(II553,State_1,II500);
  nand NAND3_7(II403,II634,II434,II494);
  nand NAND2_57(II609,II265,II434);
  nand NAND3_8(II411,II279,Prog_0,II416);
  nand NAND2_58(II19,II371,II323);
  nand NAND2_59(II676,II1113_1,II343);
  nand NAND2_60(II682,II1118_1,II323);
  nand NAND2_61(II738,II1203_1,II1203_2);
  nand NAND2_62(II746,II1216_1,II1216_2);
  nand NAND2_63(II706,II1154_1,II403);
  nand NAND2_64(II12,II377,II469);
  nand NAND2_65(II599,II275,II354);
  nand NAND2_66(II447,Rdy2RtHS1,II362);
  nand NAND2_67(II545,II272,II362);
  nand NAND2_68(II421,II274,II422);
  nand NAND2_69(II585,II353,II422);
  nand NAND2_70(II517,II264,II358);
  nand NAND2_71(II770,II715,II713);
  nand NAND2_72(II690,II1132_1,II1132_2);
  nand NAND2_73(II768,II719,II717);
  nand NAND2_74(II15,II796_1,II675);
  nand NAND3_9(II4,II725,II381,II551);
  nand NAND4_0(II5,II733,II729,II731,II397);
  nand NAND2_75(II702,II1148_1,II481);
  nand NAND2_76(II556,II1028_1,II355);
  nand NAND2_77(II684,II1121_1,II1121_2);
  nand NAND2_78(II686,II1125_1,II441);
  nand NAND2_79(II573,II517,II545);
  nand NAND2_80(II678,II329,II423);
  nand NAND2_81(II8,II655,II657);
  nand NAND2_82(II14,II671,II673);
  nand NAND2_83(II660,II1087_1,II469);
  nand NAND2_84(II547,WantRtHS1,II446);
  nand NAND2_85(II742,II1210_1,II551);
  nand NAND2_86(II662,II1091_1,II329);
  nand NAND3_10(II21,II689,II693,II691);
  nand NAND3_11(II2,II711,II771,II769);
  nand NAND3_12(II9,II377,II661,II659);
  nand NAND3_13(II11,II475,II669,II667);
  nand NAND2_87(II744,II1213_1,II553);
  nand NAND2_88(II740,II1207_1,II477);
  nand NAND2_89(II3,II721,II723);
  nand NAND2_90(II778,II737,II735);
  nand NAND2_91(II704,II1151_1,II329);
  nand NAND4_1(II22,II699,II695,II697,II481);
  nand NAND2_92(II750,II665,II663);
  nand NAND2_93(II30,II829_1,II351);
  nand NAND2_94(II700,II403,II351);
  nand NAND2_95(II708,II1157_1,II351);
  nand NAND3_14(II6,II377,II779,II777);
  nand NAND2_96(II25,II814_1,II767);
  nor NOR2_0(II326,FullOHS1,FullIIHS1);
  nor NOR2_1(II28,OutAvHS1,FullIIHS1);
  nor NOR2_2(II514,II263,Rdy2RtHS1);
  nor NOR2_3(II610,Prog_2,II284);
  nor NOR2_4(II27,OutAvHS1,II275);
  nor NOR2_5(II24,OutAvHS1,II326);
  nor NOR2_6(II612,Rdy1RtHS1,II274);
  nor NOR2_7(II506,State_1,II281);
  nor NOR2_8(II624,State_2,II511);
  nor NOR2_9(II386,State_2,II280);
  nor NOR2_10(II512,II280,State_0);
  nor NOR2_11(II570,II276,State_3);
  nor NOR2_12(II498,II271,II473);
  nor NOR2_13(II315,II272,II514);
  nor NOR2_14(II353,II344,II873_1);
  nor NOR2_15(II325,II840_1,II840_2);
  nor NOR3_0(II394,State_0,II327,II357);
  nor NOR2_16(II532,State_4,II327);
  nor NOR2_17(II614,II523,II575);
  nor NOR3_1(II482,State_3,State_2,II525);
  nor NOR2_18(II440,II495,II509);
  nor NOR2_19(II347,State_3,II394);
  nor NOR2_20(II548,State_3,II513);
  nor NOR2_21(II436,State_1,II505);
  nor NOR2_22(II450,State_0,II505);
  nor NOR2_23(II458,II279,II571);
  nor NOR3_2(II470,II320,II335,II571);
  nor NOR2_24(II534,State_4,II571);
  nor NOR2_25(II555,II330,II1025_1);
  nor NOR3_3(II442,State_1,II347,II509);
  nor NOR2_26(II391,State_2,II910_1);
  nor NOR2_27(II333,II850_1,II850_2);
  nor NOR3_4(II29,II278,State_2,II441);
  nor NOR2_28(II396,II280,II425);
  nor NOR3_5(II414,State_1,II425,II521);
  nor NOR3_6(II468,State_0,II386,II487);
  nor NOR2_29(II634,II264,II333);
  nor NOR3_7(II382,II276,Prog_2,II485);
  nor NOR2_30(II418,II279,II485);
  nor NOR3_8(II366,State_0,II335,II399);
  nor NOR2_31(II412,II282,II437);
  nor NOR2_32(II474,II493,II577);
  nor NOR2_33(II590,II429,II539);
  nor NOR3_9(II540,Rdy2RtHS1,II263,II449);
  nor NOR2_34(II430,Prog_2,II451);
  nor NOR2_35(II432,II282,II451);
  nor NOR2_36(II500,II281,II453);
  nor NOR2_37(II434,FullIIHS1,II503);
  nor NOR2_38(II466,Rdy1BmHS1,II503);
  nor NOR2_39(II388,II320,II459);
  nor NOR2_40(II416,II461,II535);
  nor NOR2_41(II463,II390,II963_1);
  nor NOR2_42(II465,II390,II966_1);
  nor NOR2_43(II580,II345,II397);
  nor NOR2_44(II733,II342,II1193_1);
  nor NOR2_45(II376,II281,II479);
  nor NOR2_46(II655,II322,II1077_1);
  nor NOR2_47(II659,II322,II1083_1);
  nor NOR2_48(II717,II322,II1170_1);
  nor NOR2_49(II731,II540,II474);
  nor NOR2_50(II567,II388,II1044_1);
  nor NOR2_51(II565,II444,II1040_1);
  nor NOR2_52(II671,II1103_1,II1103_2);
  nor NOR2_53(II354,II367,II543);
  nor NOR2_54(II596,II336,II367);
  nor NOR2_55(II559,II412,II1031_1);
  nor NOR2_56(II362,State_0,II407);
  nor NOR3_10(II384,II315,II407,II493);
  nor NOR2_57(II711,II388,II1160_1);
  nor NOR2_58(II561,II432,II1034_1);
  nor NOR2_59(II713,II470,II1163_1);
  nor NOR2_60(II693,II376,II1136_1);
  nor NOR2_61(II378,FullIIHS1,II431);
  nor NOR2_62(II422,II431,II525);
  nor NOR2_63(II715,II1166_1,II1166_2);
  nor NOR3_11(II408,II341,II435,II523);
  nor NOR3_12(II328,II609,II511,II539);
  nor NOR2_64(II719,II500,II1173_1);
  nor NOR2_65(II675,II470,II1110_1);
  nor NOR2_66(II526,II370,II416);
  nor NOR2_67(II725,II1184_1,II1184_2);
  nor NOR2_68(II729,II1188_1,II1188_2);
  nor NOR3_13(II295,II376,II682,II680);
  nor NOR2_69(II735,II552,II1196_1);
  nor NOR2_70(II695,II408,II328);
  nor NOR2_71(II657,II410,II1080_1);
  nor NOR2_72(II673,II410,II1107_1);
  nor NOR2_73(II348,II315,II363);
  nor NOR2_74(II600,II331,II447);
  nor NOR2_75(II476,II519,II545);
  nor NOR2_76(II669,II342,II1100_1);
  nor NOR3_14(II364,II274,II379,II525);
  nor NOR2_77(II689,II440,II1128_1);
  nor NOR2_78(II404,II284,II421);
  nor NOR2_79(II582,II331,II517);
  nor NOR2_80(II579,II446,II1056_1);
  nor NOR3_15(II297,II376,II686,II684);
  nor NOR3_16(II294,II408,II678,II676);
  nor NOR2_81(II667,II328,II1097_1);
  nor NOR2_82(II723,II1180_1,II1180_2);
  nor NOR2_83(II721,II1176_1,II1176_2);
  nor NOR2_84(II350,II325,II477);
  nor NOR2_85(II737,II1199_1,II1199_2);
  nor NOR2_86(II699,II1143_1,II1143_2);
  nor NOR2_87(II697,II384,II1140_1);
  nor NOR2_88(II665,II540,II1094_1);
  nor NOR3_17(II311,II742,II746,II744);
  nor NOR2_89(II777,II740,II738);
  nor NOR2_90(II767,II704,II702);
  nor NOR2_91(II287,II750,II789_1);
  nor NOR2_92(II300,II700,II810_1);
  nor NOR2_93(II303,II706,II708);

endmodule



module dff( CLK, Q, D );
  output Q;

  input D;
  input CLK;

  reg Q;

  always @ (posedge CLK) begin
    Q <= D;
  end
endmodule
