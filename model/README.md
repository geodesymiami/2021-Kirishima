
## Geodetic Modeling with GBIS

### Input files

+ Shinmoe2008post.inp
+ Shinmoe2017pre.inp
+ Iwo2017pre.inp
+ Iwo2017post.inp

```matlab
cd ~/data/Kirishima/Model

% Shinmoe-dake deflation during 2008-2010 phreatic eruptions
GBISrun('Shinmoe2008post.inp', [1,2], 'n', 'C', 1e6, 'n', 'n')
generateFinalReport('Shinmoe2008post/invert_1_2_C/invert_1_2_C.mat',1e4,'n','lower')

% Shinmoe-dake inflation before the 2017 magmatic eruption
GBISrun('Shinmoe2017pre.inp', [1,2], 'n', 'C', 1e6, 'n', 'n')
generateFinalReport('Shinmoe2017pre/invert_1_2_C/invert_1_2_C.mat',1e4,'n','lower')

% Iwo-yama inflation before Oct 2017
GBISrun('Iwo2017pre.inp', [1,2], 'n', 'C', 1e6, 'n', 'n')
generateFinalReport('Iwo2017pre/invert_1_2_C/invert_1_2_C.mat',1e4,'n','lower')

% Iwo-yama inflation after Dec 2017
GBISrun('Iwo2017post.inp', [1,2], 'n', {'C','C2'}, 1e6, 'n', 'n')
generateFinalReport('Iwo2017post/invert_1_2_C_C2/invert_1_2_C_C2.mat',1e4,'n','lower')
```


### Convert the height from ellipsoid to geoid

The height of the DEHM (Digital Ellipsoidal Height Model) from GSI is relative to the ellipsoid and used in the InSAR processing. However, for geodetic modeling, the height should be relative to mean sea level from the Earth Gravity Model (i.e. EGM96). This is implemented as the [`save_gbis.py --ellipsoid2geoid`](https://github.com/insarlab/MintPy/blob/main/mintpy/save_gbis.py#L122) in MintPy using **geoidheight**.

Run the following in the terminal to install [geoidheight](https://github.com/vandry/geoidheight) and download the [EGM data](https://geographiclib.sourceforge.io/1.18/geoid.html).

```bash
cd ~/tools/utils
git clone https://github.com/vandry/geoidheight.git
cd ~/tools/utils/geoidheight
wget http://sf.net/projects/geographiclib/files/geoids-distrib/egm96-5.tar.bz2; tar xvjf egm96-5.tar.bz2
wget http://sf.net/projects/geographiclib/files/geoids-distrib/egm2008-1.tar.bz2; tar xvjf egm2008-1.tar.bz2
```

Add the following to _.bash_profile_ file to setup geoidheight.

```bash
export PYTHONPATH=${PYTHONPATH}:~/tools/utils/geoidheight
```
