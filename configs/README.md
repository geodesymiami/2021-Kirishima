## Configuration files for InSAR processing and geodetic modeling

### 1. InSAR Stack Processing with ISCE/stripmapStack (the whole track) ###

+ Alos2DT23F2970.template
+ AlosAT424F620_630.template
+ AlosDT73F2970_2980.template

### 2. InSAR Time Series Analysis with MintPy (Area of Interest) ###

Run `load_data_aoi_*.sh` to prepare **mintpy/inputs**.

+ ShinmoeAlosAT424.txt
+ ShinmoeAlosDT73.txt
+ KirishimaAlos2T23.txt

### 3. Geodetic Modeling with GBIS (Area of Interest) ###

+ Shinmoe2008post.inp
+ Shinmoe2017pre.inp
+ Iwo2017pre.inp
