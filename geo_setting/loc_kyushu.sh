#!/bin/sh
# GMT, version 5.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE inside
gmt set MAP_FRAME_PEN thick,black

OUTFILE='loc_kyushu.ps'

#gmt pscoast -R129.65/131.8/30.9/33.9 -JM1.5i -Ba -EJP+gdimgray -P -V -K > $OUTFILE
gmt pscoast -R129.0/132.5/30.5/34.5 -JM1.5i -Ba -EJP+g135/135/135 -P -V -K > $OUTFILE

################## AOI ################################
LON0=130.78
LON1=130.95
LAT0=31.87
LAT1=31.98
gmt psxy <<END -R -J -Wthinner,red -V -O -K >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END

################### GPS (Fig. 2e) ###################
gmt psxy <<END -R -J -Sp0.05 -W0.2 -V -O >> $OUTFILE
130.75967   31.85553    #950486
130.86563   32.04772    #960714
END
#130.820     31.994      #X082
#130.838     31.925      #X083

#gmt psxy <<END -R -J -St0.1 -W1,red -V -O >> $OUTFILE
#130.883     31.9114     #Shinmoe-dake
#END

################### Convert to TIFF ###################
gmt psconvert -A -E600 -Tf $OUTFILE
