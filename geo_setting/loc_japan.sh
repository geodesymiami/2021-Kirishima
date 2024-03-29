#!/bin/sh
# GMT, version 5.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE inside
gmt set MAP_FRAME_PEN 0p,white
gmt set MAP_TICK_PEN 0p,white

OUTFILE='loc_japan.ps'

#gmt pscoast -Rg -JG130.9/31.9/8i -Ba -Dh -A500 -Gdimgray -Swhite -P -V -K > $OUTFILE
#gmt pscoast -R129/146/30/46 -JB137/32/31/33/2i -Ba -Dh -A500 -Gdimgray -Swhite -P -V > $OUTFILE
#gmt pscoast -R127/146/29/47 -JM1.8i -Ba -Dh -A500 -Gdimgray -Swhite -P -V -K > $OUTFILE
#gmt pscoast -R128.5/145.5/29/47 -JM1.5i -Ba -Dl -A200 -Wthinner -A500 -P -V -K > $OUTFILE
#gmt pscoast -R123/151/26/50 -JM1.5i -Ba -Dh -A500 -Gdimgray -P -V -K > $OUTFILE
gmt pscoast -R128/146/29/47 -JM1.7i -Ba -EJP+glightgray -P -V -K > $OUTFILE

################## AOI ################################
LON0=130.1
LON1=131.3
LAT0=30.9
LAT1=32.6
gmt psxy <<END -R -J -Wthin,black -V -O >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END

#gmt psxy <<END -R -J -Sc0.33 -Wthin,black,2:2p -V -O >> $OUTFILE
#gmt psxy <<END -R -J -Sc0.33 -Wthin,red -V -O >> $OUTFILE
#131.1     31.5     #Shinmoe-dake
#END

################### Convert to TIFF ###################
gmt psconvert -A -E600 -Tf $OUTFILE
