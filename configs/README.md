## InSAR data processing with ISCE/stripmapStack + MintPy

### 1. InSAR Stack Processing with ISCE/stripmapStack ###

+ AlosAT424F620_630.txt
+ AlosDT73F2970_2980.txt
+ Alos2AT131F620.txt
+ Alos2DT23F2970.txt

### 2. InSAR Time Series Analysis with MintPy ###

1. Run load_data.py to save the whole track of data into HDF5 files: `ifgramStack.h5` and `geometryRadar.h5`.

2. Run `load_aoi_*.sh` to geocode & crop the HDF files for the area of interest: `ifgramStack.h5` and `geometryGeo.h5`.

3. Run `smallbaselineApp.py` for time series analysis.

+ KirishimaAlosAT424.txt
+ KirishimaAlosDT73.txt
+ KirishimaAlos2AT131.txt
+ KirishimaAlos2DT23.txt

1st run to generate displacement time-sereis for the whole time period as below (check comments in the config files):

+ ALOS_SM_424_0620_0630_20060624_20110407_N31880_N31980_E130820_E130920.he5
+ ALOS_SM_073_2970_2980_20070107_20110420_N31880_N31980_E130820_E130920.he5
+ ALOS2_SM_131_0620_20140930_20190702_N31880_N31980_E130820_E130920.he5
+ ALOS2_SM_023_2970_20150209_20190819_N31880_N31980_E130820_E130920.he5

2nd run to generate displacement time-series before destructive eruptions as below (check comments in the config files):

+ ALOS_SM_424_0620_0630_20060924_20101120_N31880_N31980_E130820_E130920.he5
+ ALOS_SM_073_2970_2980_20070107_20110118_N31880_N31980_E130820_E130920.he5
+ ALOS2_SM_131_0620_20140930_20171010_N31880_N31980_E130820_E130920.he5
+ ALOS2_SM_023_2970_20150209_20170918_N31880_N31980_E130820_E130920.he5

Estimate the average velocities for the following three time periods from the time-series file above:

+ Sep 2008 - Jul 2010
   - VEL_ALOS_A424_20080929_20100705.h5
   - VEL_ALOS_D073_20081012_20100302.h5
+ Jan 2015 - Oct 2017
   - VEL_ALOS2_A131_20150106_20171010.h5
   - VEL_ALOS2_A131_20171219_20190702.h5
+ Dec 2017 - Aug 2019
   - VEL_ALOS2_D023_20150209_20170918.h5
   - VEL_ALOS2_D023_20171211_20190819.h5
