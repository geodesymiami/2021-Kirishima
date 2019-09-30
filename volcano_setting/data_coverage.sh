#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP dddF
gmt set MAP_FRAME_TYPE inside
gmt set MAP_FRAME_PEN thick,black

OUTFILE='data_coverage.ps'


##------------------------ Background -------------------------##
gmt pscoast -R129.65/131.8/30.9/33.9 -JM1.6i -Dh -B1wens -Na -Swhite -Gdimgray -P -V -K > $OUTFILE
#gmt pscoast -R129.5/131.9/30.9/33.9 -JM1.8i -Dh -B1wens -Na -Swhite -Gdimgray -P -V -K > $OUTFILE
#gmt pscoast -R129.9/131.7/31/32.8 -JM2i -Dh -B1wens -Na -Swhite -Ggray60 -P -V -K > $OUTFILE
#gmt pscoast -R129.9/131.7/31/32.8 -JM2.5i -Dh -B1wens -Na -Swhite -Ggray55 -P -V -K > $OUTFILE
#gmt pscoast -R129.9/131.7/31/32.8 -JB131.3/32/31/33/2.5i -Dh -B1wens -Na -Swhite -Ggray55 -P -V -K > $OUTFILE

mplB='31/119/180'
mplO='255/127/14'
mplG='44/160/44'

##------------------------ Data Coverage -------------------------##
# ALOS-1 asc
LAT1=31.2525;   LON1=130.5265
LAT2=31.3676;   LON2=131.2565
LAT3=32.5389;   LON3=130.2444
LAT4=32.6548;   LON4=130.9939
gmt psxy <<END -R -J -Wthick,$mplG,- -V -O -K >> $OUTFILE
$LON1   $LAT1
$LON2   $LAT2
$LON4   $LAT4
$LON3   $LAT3
$LON1   $LAT1
END

# ALOS-1 desc
LAT1=32.5352;   LON1=131.2640
LAT2=32.6469;   LON2=130.5295
LAT3=31.2446;   LON3=130.9899
LAT4=31.3576;   LON4=130.2606
gmt psxy <<END -R -J -Wthick,$mplG,- -V -O -K >> $OUTFILE
$LON1   $LAT1
$LON2   $LAT2
$LON4   $LAT4
$LON3   $LAT3
$LON1   $LAT1
END

# ALOS-2 asc
LAT1=31.3783;   LON1=130.6764
LAT2=31.4646;   LON2=131.2634
LAT3=31.9890;   LON3=130.5543
LAT4=32.0757;   LON4=131.1493
gmt psxy <<END -R -J -Wthick,$mplO,- -V -O -K >> $OUTFILE
$LON1   $LAT1
$LON2   $LAT2
$LON4   $LAT4
$LON3   $LAT3
$LON1   $LAT1
END

# ALOS-2 desc
LAT1=32.3278;   LON1=131.1299
LAT2=32.4164;   LON2=130.5535
LAT3=31.7154;   LON3=131.0090
LAT4=31.8060;   LON4=130.4249
gmt psxy <<END -R -J -Wthick,$mplO,- -V -O -K >> $OUTFILE
$LON1   $LAT1
$LON2   $LAT2
$LON4   $LAT4
$LON3   $LAT3
$LON1   $LAT1
END

##------------------------ Fig. 1 -------------------------##
LON0=130.72
LON1=130.99
LAT0=31.84
LAT1=32.06
#gmt psxy <<END -R -J -Wthick,214/39/40 -V -O >> $OUTFILE
#gmt psxy <<END -R -J -Wthick,44/160/44 -V -O >> $OUTFILE
gmt psxy <<END -R -J -Wthick,black -V -O >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END


# convert to PNG file
gmt psconvert -A -E600 -TG $OUTFILE
