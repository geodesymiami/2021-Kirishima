#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE inside
gmt set MAP_FRAME_PEN thick,black

OUTFILE='loc_kyushu.ps'

#gmt pscoast -R129.65/131.8/30.9/33.9 -JM1.5i -Ba -EJP+gdimgray -P -V -K > $OUTFILE
gmt pscoast -R129.0/132.5/30.5/34.5 -JM1.5i -Ba -EJP+gdimgray -P -V -K > $OUTFILE

################## AOI ################################
LON0=130.72
LON1=130.99
LAT0=31.84
LAT1=32.06
gmt psxy <<END -R -J -Wthick,red -V -O >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END

#gmt psxy <<END -R -J -St0.1 -W1,red -V -O >> $OUTFILE
#130.883     31.9114     #Shinmoe-dake
#END

################### Convert to TIFF ###################
gmt psconvert -A -E1500 -TG $OUTFILE
