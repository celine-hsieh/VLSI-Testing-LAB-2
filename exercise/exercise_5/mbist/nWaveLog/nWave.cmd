wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default_tb.fsdb}
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
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomOut -win $_nWave1
wvSearchPrev -win $_nWave1
wvSetCursor -win $_nWave1 2054650829.646590 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2054746675.077664 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2054851040.102611 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2054946885.533684 -snap {("G1" 2)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 2055044860.863226 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2054949015.432152 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2055053380.457099 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2055394164.212027 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 2054953275.229089 -snap {("G1" 2)}
wvExit
