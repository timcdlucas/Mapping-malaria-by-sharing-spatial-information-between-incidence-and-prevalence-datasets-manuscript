########
# master script for point Vs polygon Vs joint analysis
# Tim Lucas
# 2018-05-30
###########


# setwd('~/Dropbox/work/analysis/point_polygon_joint_comparison')

# define paths


# load packages

## Spatial packages
library(raster)

## dataframe packages
library(dplyr)
library(readr)

## For standardising prevalence
library(malariaAtlas)

## For inc prevalence conversions
library(GBDutils)

## Plotting packages
library(ggplot2)


## Modelling packages
library(TMB)
library(standtmb)

# load functions


set.seed(180530)

# load all data

data <- load_data(paths)


# indonesia

# pre analysis

data_idn <- process_data(data, useiso3 = 'IDN')

mesh_idn <- build_mesh(data_idn, mesh.args = list(...))


data_cv1_idn <- cv_folds(data_idn)
data_cv2_idn <- cv_spat_folds(data_idn)


# run models


full_model <- fit_models(data_idn, mesh, model.args = list(...))

cv1_output <- run_cv(data_cv1_idn, mesh,
model.args = list(...))

cv2_output <- run_cv(data_cv2_idn, mesh,
model.args = list(...))



# create figures
