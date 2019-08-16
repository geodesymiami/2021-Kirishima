#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE plain

OUTFILE='location.ps'

gmt pscoast -Rg -JG130.9/31.9/1.5i -Ba -Dh -A500 -Gdimgray -Swhite -P -V -K > $OUTFILE

################## AOI ################################
gmt psxy <<END -R -J -Sc0.2 -W0.5,red -V -O >> $OUTFILE
130.9   31.9
END

################### Convert to TIFF ###################
gmt psconvert -A -E900 -TG $OUTFILE
