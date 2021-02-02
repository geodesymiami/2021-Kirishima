#!/bin/sh
# GMT, version 5.4.4

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FORMAT_GEO_MAP ddd.xxF
gmt set MAP_FRAME_TYPE plain

FILE='dem_msk.grd'
OUTFILE='dem3D.ps'


################### DEM ###################
#gmt makecpt -Cwiki-2.0 -T-0.7/1.8/0.01 -N -V > topo.cpt
#gmt grdgradient $FILE -Nt -A0 -fg -Gtopo_i.nc

#gmt grdview $FILE -JM4i -JZ5i -p210/20+w130.8620/31.9389 -N-11 \
#    -Qi600 -BWeSnZ -B0.03 -Bz1 -R130.8/130.92/31.89/32.0/-10/2 -Ctopo.cpt -Itopo_i.nc \
#    -V -K > $OUTFILE

gmt grdview $FILE -JM4i -JZ5i -p210/20+w130.8620/31.9389 -N-11 \
    -Qi600 -BWeSnZ -B0.03 -Bz1 -R130.8/130.92/31.89/32.0 -Ctopo.cpt -Itopo_i.nc \
    -V -K > $OUTFILE

#################### Seismicity #######
#gmt psxyz aizawa.xyz -Sp5p -R -J -p -V -O -K >> $OUTFILE

################### Sea level #######
gmt psxyz profile_sea_level.xyz -W1,black -R -J -p -V -O >> $OUTFILE

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
