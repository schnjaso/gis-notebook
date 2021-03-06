FROM jupyter/scipy-notebook:latest
MAINTAINER Stepan Kuzmin <to.stepan.kuzmin@gmail.com>

USER root

RUN apt-get -yqq update \
  && apt-get -yqq install \
  python-gdal

USER $NB_USER

RUN conda config --add channels http://conda.anaconda.org/auto \
  && conda config --add channels http://conda.anaconda.org/terradue \
  && conda config --add channels http://conda.anaconda.org/conda-forge

# Install Python 2 packages
RUN conda install --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 \
  'fiona' \
  'folium' \
  'gdal' \
  'geocoder' \
  'geopandas' \
  'geopy' \
  'googlemaps' \
  'psycopg2' \
  'pyproj' \
  'pysal' \
  'rtree' \
  'shapely' \
  && conda remove -n python2 --quiet --yes --force qt pyqt && \
  conda clean -tipsy
