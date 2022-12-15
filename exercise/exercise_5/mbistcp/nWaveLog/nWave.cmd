wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/user2/test22/test2225/exercise/exercise_5/mbistcp/top_default_tb.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/stimulus"
wvGetSignalSetScope -win $_nWave1 "/stimulus/top0"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/stimulus/top0/top_default_TPG_1_1_1_A_t\[11:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_CLK_t} \
{/stimulus/top0/top_default_TPG_1_1_1_D_t\[31:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_Q_t\[31:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_WEN_t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/stimulus/top0/top_default_TPG_1_1_1_A_t\[11:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_CLK_t} \
{/stimulus/top0/top_default_TPG_1_1_1_D_t\[31:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_Q_t\[31:0\]} \
{/stimulus/top0/top_default_TPG_1_1_1_WEN_t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetSearchMode -win $_nWave1 -value 
wvSetSearchMode -win $_nWave1 -value 4095
wvSearchNext -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvZoomIn -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 2873894772.075893 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874248685.078594 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874336482.728091 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 2874344649.951231 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874448101.444328 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874257532.904412 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874347372.358943 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874445379.036614 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2874701285.361645 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 2874246643.273560 -snap {("G1" 2)}
wvResizeWindow -win $_nWave1 0 23 1024 697
wvSetCursor -win $_nWave1 2875061323.781450 -snap {("G2" 0)}
wvExit
