## Jupyter Notebooks for: ##

Yunjun, Z., Amelung, F., & Aoki, Y. (2021), Imaging the hydrothermal system of Kirishima volcanic complex with L-band InSAR time series, _Geophysical Research Letters, 48_(11), e2021GL092879. doi:[10.1029/2021GL092879](https://doi.org/10.1029/2021GL092879)

### Data ###

+ InSAR displacement products:
   - Time-series, velocities and selected interferograms for Kirishima, Japan from ALOS-1/2: [Zenodo](https://zenodo.org/record/4661725).
   - Stacks of interferograms for southern Kyushu, Japan from ALOS-1: [Zenodo](https://zenodo.org/record/4499238).
   - Stacks of interferograms for southern Kyushu, Japan from ALOS-2: [Zenodo](https://zenodo.org/record/4499208).
   - Configurations for InSAR data processing with ISCE-2 and MintPy: [Link](./configs)
+ Geodetic modeling:
   - Model results from GBIS: [Zenodo](https://zenodo.org/record/4661725).
   - Configurations for GBIS: [Link](./model)

### Figures ([nbviewer](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima)) ###

NOTE: This notebook is based on the released version of [MintPy-1.3](https://github.com/insarlab/MintPy/releases/tag/v1.3.0) and NOT maintained for future development.

+ Fig. 1 - Geophysical observations at Kirishima during 2008-2019.
   - [Fig. 1a-c](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig1_geo_setting.ipynb) - Geological setting.
   - [Fig. 2d-f](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig1_obs_maps.ipynb) - Quasi-vertical displacement maps from InSAR.
   - [Fig. 2g-i](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig1_obs_TS.ipynb) - Time-series of InSAR, GPS and EQ number.

+ [Fig. 2](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig2_obs_vs_model.ipynb) - Geodetic modeling results at Shinmoe-dake and Iwo-yama.
+ Fig. 3 - Conceptual model of the Kirishima plumbing system.
   - [Fig. 3a-b](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig3_depth_PDF.ipynb) - Probability density distribution of source depths.
   - [Fig. 3c](https://nbviewer.jupyter.org/github/geodesymiami/2021-Kirishima/blob/main/notebooks/Fig3_concept_model.ipynb) - Conceptual model cartoon.

### Notes for converting height from ellipsoid to geoid

The height of the DEHM (Digital Ellipsoidal Height Model) from GSI is relative to the ellipsoid and used in the InSAR processing. However, for geodetic modeling, the height should be relative to mean sea level from the Earth Gravity Model (i.e. EGM96). This is implemented as the [`save_gbis.py --ellipsoid2geoid`](https://github.com/insarlab/MintPy/blob/main/mintpy/save_gbis.py) in MintPy using [geoidheight](https://github.com/vandry/geoidheight).

Run the following in the terminal to install `geoidheight` and download the [EGM data](https://geographiclib.sourceforge.io/1.18/geoid.html).

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
