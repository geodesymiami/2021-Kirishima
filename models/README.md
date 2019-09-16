
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
