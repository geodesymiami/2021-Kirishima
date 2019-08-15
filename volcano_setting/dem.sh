#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE plain

FILE='dem.grd'
OUTFILE='dem.ps'


################### DEM ###################
#gmt makecpt -Cgray -T-3000/3000/1 -V > topo.cpt
gmt makecpt -Cwiki-2.0 -T-1000/1900/1 -V > topo.cpt
gmt grdgradient $FILE -Nt -A0 -fg -Gtopo_i.nc

gmt grdimage $FILE -R130.71/131.0/31.84/32.06 -JM6i -BwESn -B0.1 -Ctopo.cpt -Itopo_i.nc -P -V -K > $OUTFILE
gmt pscoast -R -J -LjBL+c31.9+o0.3i/1.6i+w5k+l+f -W -V -O -K >> $OUTFILE            #scale-bar
gmt psscale -R -J -DjBL+w1.1i/0.15i+h+o0.3i/1.2i -Ctopo.cpt -By1+lm -Bx1000+lElevation+m -G0/1800 -V -O -K >> $OUTFILE    #color-map


################### Shinmoe-dake AOI (Fig. 2-3) ##############
LON0=130.855
LON1=130.91
LAT0=31.885
LAT1=31.94

gmt psxy <<END -R -J -W0.5,black,dashed -V -O -K >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END


################### Active Volcanoes ###################
gmt psxy <<END -R -J -St0.3 -W1.5,black -V -O -K >> $OUTFILE
130.910     31.886      #Ohachi
130.883     31.9114     #Shinmoe-dake
130.853     31.947      #Iwo-yama
END


################### Magma Source ###################
gmt psxy <<END -R -J -Sc1 -W6,black,3:2p -V -O -K >> $OUTFILE
130.831     31.942
END


################### GPS (Fig. 2e) ###################
gmt psxy <<END -R -J -Ss0.3 -W1.5 -V -O >> $OUTFILE
130.75967   31.85553    #950486
130.86563   32.04772    #960714
END


################### Convert to TIFF ###################
#gmt psconvert -E600 -Tt $OUTFILE
gmt psconvert -A0.2c -E300 -Tt $OUTFILE