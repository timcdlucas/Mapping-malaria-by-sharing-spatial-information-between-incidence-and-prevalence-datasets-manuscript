---
title: A comparison of models for polygon data, point data or both for malaria mapping
---



Which journal? r stat soc applied? Comp bio was original plan? But probably not good enough.

1. Use Madagascar + Indonesia as case studies.
2. do cross validation on both pr and polygon. no good way to combine so just have to report both in every case
3. can't see good way to compare stacked generalisation with linear polygon so have to do all linear.
4. if this paper falls out easily can expand to ml and polygon as covariates. or project for ra?
5. probably want random cv and spatial cv?
6. might need more countries but do first draft like this.
7. spatial only. but need to choose year/year range.
8. compare Pearson and spearman. maybe Mae as well.
9. how to handle spatial priors? try 3 values and pick best CV in each case.
10. gives country X model X CV X metric X prevalence vs incidence.


figure 1. data and cross validation. columns county. rows: data values, CV group 1, CV group 2.

figure 2. predicted prevalence and incidence maps. but how with CV? all data X model?

figure 3. accuracy summary.
Dodge by model. facet by prevelance incidence and county. symbol metric. colour by cv type. points for individual CV, line for mean? but how to distinguish CV type line?


intro
-----

malaria is bad but decreasing
moving to strategy of elimination country by country
elimination requires maps of low prevalence areas
but maps in low prevalence areas are difficult
sometimes little data
traditional prevalence mapping won't work
we need new sources of data.


however surveillance data is sometimes high quality in these areas
pixel level maps from aggregates data is difficult.
not much information for covariates 
sturrock used two.
undeveloped area of statistics but see Leon.

Ideal situation is to combine data
benefits of both
but data are on different scales
Ewan says there's a relationship.

here we compared 3 models, point only, polygon only and joint models
we use Madagascar and Indonesia as case studies as they have good surveillance data and good pr data.
we find that...



methods
----------------

malaria data
  prevalence data
    prevalence standardisation
  incidence data
    geography
    counts to incidence rate
   
covariate data

full model
  full hierarchical equations
  linear predictor
  do I use max prev?
  link to prevalence
  prevalence to incidence
  multilevel

experiments
  cross validation 1
  Cross validation 2
  metrics


results
-------------

discussion
-------------------

what did and didn't work
application to global maps
further ml work
potential way to refine prevalence incidence relationship.
















