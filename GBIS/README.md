
## Geodetic Modeling with GBIS

### Input files

+ Shinmoe2008post.inp
+ Shinmoe2017pre.inp
+ Iwo2017pre.inp

```matlab
GBISrun('Shinmoe2008post.inp', [1,2], 'n', 'C', 10e5, 'n')
generateFinalReport('Shinmoe2008post/invert_1_C/invert_1_C.mat',1e4)

GBISrun('Shinmoe2017pre.inp', [1,2], 'n', 'C', 10e5, 'n')
generateFinalReport('Shinmoe2017pre/invert_1_C/invert_1_C.mat',1e4)

GBISrun('Iwo2017pre.inp', [1,2], 'n', 'C', 10e5, 'n')
generateFinalReport('IwoPre2017/invert_1_C/invert_1_C.mat',1e4)
```


### Convert the height from ellipsoid to geoid

The height of the DEHM (Digital Ellipsoidal Height Model) from GSI is relative to the ellipsoid and used in the InSAR processing. However, for geodetic modeling, the height should be relative to mean sea level from the Earth Gravity Model (i.e. EGM96). This is implemented as the `save_gbis.py --ellipsoid2geoid` in MintPy using **geoidheight**.

Add the following to _.tcshrc_ file to setup geoidheight.
```
setenv UTILS_DIR        ~/development/UTILITIES
setenv PYTHONPATH       ${PYTHONPATH}:${UTILS_DIR}/geoidheight
```

Run the following in the terminal to install [geoidheight](https://github.com/vandry/geoidheight) and download the [EGM data](https://geographiclib.sourceforge.io/1.18/geoid.html).

```tcsh
cd $UTILS_DIR
git clone https://github.com/vandry/geoidheight.git
cd $UTILS_DIR/geoidheight
wget http://sf.net/projects/geographiclib/files/geoids-distrib/egm96-5.tar.bz2; tar xvjf egm96-5.tar.bz2
wget http://sf.net/projects/geographiclib/files/geoids-distrib/egm2008-1.tar.bz2; tar xvjf egm2008-1.tar.bz2
```
