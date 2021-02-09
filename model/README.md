
## Geodetic Modeling with GBIS

### Input files

+ Shinmoe2008post.inp
+ Shinmoe2017pre.inp
+ Iwo2017pre.inp
+ Iwo2017post.inp

### GBIS commands used in Matlab

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
