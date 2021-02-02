## InSAR data processing

### 1. InSAR Stack Processing with [ISCE/stripmapStack](https://github.com/isce-framework/isce2/tree/main/contrib/stack) ###

+ AlosAT424F620_630.template
+ AlosDT73F2970_2980.template
+ Alos2AT131F620.template
+ Alos2DT23F2970.template

### 2. InSAR Time Series Analysis with [MintPy](https://github.com/insarlab/MintPy) ###

1. Run load_data.py to save the whole track of data into HDF5 files.

2. Run `load_data_aoi_*.sh` to geocode & crop the area of interest.

3. Run `smallbaselineApp.py` with the following config files.

+ KirishimaAlosAT424.txt
+ KirishimaAlosDT73.txt
+ KirishimaAlos2AT131.txt
+ KirishimaAlos2DT23.txt
