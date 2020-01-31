#!/bin/sh
# GMT, version 5.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE inside
gmt set MAP_FRAME_PEN thick,black

FILE='./../data/dem_km.grd'
OUTFILE='dem.ps'


################### DEM ###################
#gmt makecpt -Cgray -T-3000/3000/1 -V > topo.cpt
gmt makecpt -Cwiki-2.0 -T-0.650/1.850/0.01 -V > topo.cpt
gmt grdgradient $FILE -Nt -A0 -fg -Gtopo_i.nc

#gmt grdimage $FILE -R130.72/130.99/31.84/32.06 -JM5i -BwEsN -B0.1 \
gmt grdimage $FILE -R130.78/130.95/31.87/31.98 -JM5i -BwEsN -B0.1 \
    -Ctopo.cpt -Itopo_i.nc -P -V -K > $OUTFILE
gmt pscoast -R -J -LjBR+c31.9+o1.8i/0.3i+w3k+l+f -W -V -O -K >> $OUTFILE        #scale-bar

gmt set MAP_FRAME_TYPE plain
gmt psscale -R -J -DjTR+w1.0i/0.1i+v+o0.5i/0.3i -Ctopo.cpt -By1+lkm \
    -Bx0.5 -G0.3/1.85 -V -O -K >> $OUTFILE                                      #color-map


################### Bounding box of Fig. 2 - ALOS-1/2 observations ##############
LON0=130.843
LON1=130.909
LAT0=31.893
LAT1=31.958

gmt psxy <<END -R -J -W0.5,black,dashed -V -O -K >> $OUTFILE
$LON0   $LAT1
$LON1   $LAT1
$LON1   $LAT0
$LON0   $LAT0
$LON0   $LAT1
END

################### Profile location of Fig. 6 - Conceptual model #######
gmt psxy <<END -R -J -W1,royalblue -V -O -K >> $OUTFILE
130.8000    31.9460
130.8524    31.9460
130.9021    31.8900
END


################### Active Volcanoes ###################
#gmt psxy <<END -R -J -St0.3 -W1.5,black -V -O -K >> $OUTFILE
#130.910     31.886      #Ohachi
#130.883     31.9114     #Shinmoe-dake
#130.853     31.947      #Iwo-yama
#END


################### Magma Source ###################
gmt psxy <<END -R -J -Sc1 -W5,black,3:2p -V -O -K >> $OUTFILE
130.831     31.942
END


################### GPS (Fig. 2e) ###################
gmt psxy <<END -R -J -Ss0.3 -W1.5 -V -O >> $OUTFILE
130.75967   31.85553    #950486
130.86563   32.04772    #960714
END
#130.820     31.994      #X082
#130.838     31.925      #X083


################### Convert to TIFF ###################
#gmt psconvert -E600 -Tt $OUTFILE
gmt psconvert -A0.2c -E300 -Tt $OUTFILE
