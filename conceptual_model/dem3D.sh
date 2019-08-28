#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xF
gmt set MAP_FRAME_TYPE plain

FILE='dem_msk.grd'
OUTFILE='dem3D.ps'


################### DEM ###################
#gmt makecpt -Cgray -T-3000/3000/1 -V > topo.cpt
#gmt makecpt -Cwiki-2.0 -T-1000/1900/1 -V > topo.cpt
#gmt grdgradient $FILE -Nt -A0 -fg -Gtopo_i.nc

#gmt grdview $FILE -JM5i -JZ0.5i -p210/20 -R130.8/130.91/31.86/32.0 -BWesN -B0.1 -Ctopo.cpt -Itopo_i.nc -Qi300 -V > $OUTFILE
gmt grdview $FILE -JM5i -JZ0.5i -p210/20 -R130.8/130.91/31.86/32.0 -Ctopo.cpt -Itopo_i.nc -Qi600 -V > $OUTFILE


#################### Profile location of Fig. 7 - Conceptual model #######
#gmt psxy <<END -R -J -W1,royalblue -V -O -K >> $OUTFILE
#130.8130    31.9290
#130.8535    31.9480
#130.9000    31.8900
#END


#################### Active Volcanoes ###################
#gmt psxy <<END -R -J -St0.3 -W1.5,black -V -O >> $OUTFILE
#130.910     31.886      #Ohachi
#130.883     31.9114     #Shinmoe-dake
#130.853     31.947      #Iwo-yama
#END


################### Convert to TIFF ###################
#gmt psconvert -E600 -Tt $OUTFILE
gmt psconvert -A0.2c -E600 -P -Tg $OUTFILE
#gmt psconvert -E300 -Tt $OUTFILE
