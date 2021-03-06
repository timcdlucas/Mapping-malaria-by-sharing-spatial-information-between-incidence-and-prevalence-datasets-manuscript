---
title: A comparison of models for polygon data, point data or both for malaria mapping
bibliography: Malaria.bib
---



Which journal?  Comp bio was original plan? go for that.

1. Use Madagascar + Indonesia as case studies.
2. do cross validation on both pr and polygon. no good way to combine so just have to report both in every case
3. can't see good way to compare stacked generalisation with linear polygon so have to do all linear.
4. if this paper falls out easily can expand to ml and polygon as covariates. or project for ra?
5. probably want random cv and spatial cv?
6. might need more countries but do first draft like this.
7. spatial only. but need to choose year/year range. year is difficult as pr and polygons don't match.
8. compare Pearson and spearman. maybe Mae as well.
9. how to handle spatial priors? try 3 values and pick best CV in each case.
10. gives country X model X CV X metric X prevalence vs incidence.


figure 1. data and cross validation. columns county. rows: data values, CV group 1, CV group 2.

figure 2. predicted prevalence and incidence maps. but how with CV? all data X model?

figure 3. accuracy summary.
Dodge by model. facet by prevelance incidence and county. symbol metric. colour by cv type. points for individual CV, line for mean? but how to distinguish CV type line?

figure 4 predicted Vs observed. facet by country and prev inc. colour by cv?

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
pixel level maps from aggregates data is difficult (sturrock, inla, Leon, others)
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
  link to prevalence
  prevalence to incidence
  multilevel


### Malaria data

We used two data sources that reflect malaria burden; point prevalence surveys and polygon-level, aggregated incidence data.
We selected Madagascar and Indonesia as case examples as they have both good surveillance data and good country wide surveys from approximately the same time.
Given the available data we chose to focus our analysis on 2012-2015 for Indonesia and 2013-2014 for Madagascar.

### Prevalence survey data

The prevalence survey data were extracted from the MAP prevalence survey database [@].
As the prevalence surveys cover different are ranges they were standardisePars using the model from [@].

### Polygon incidence data


### Population data

### Covariate data


### The model

We compared three models 1) a full model with prevalence surveys and aggregated incidence data 2) the submodel with only prevalence data and 3) the submodel with only aggregated incidence data.

The full, joint likelihood model is described as follows. 
Values at the aggregate, polygon level are given the subscript $a$ while pixel or point level below are indexed with $b$.
The polygon case count data, $y_j$ is given a Poisson likelihood

$$y_a \sim \operatorname{Pois}(i_a\mathrm{pop_a})$$

where $i_a$ is the estimated polygon incidence rate and $\mathrm{pop_a}$ is the observed polygon population-at-risk.

The point-level prevalence data, $z_b$, is given a binomial likelihood

$$z_b \sim \operatorname{Binom}(p_b, n_b) $$

where $p_b$ is the estimated prevalence and $n_b$ is the observed survey sample size. 

The two quantities are linked to each other and to the predictor variables by the following system of equations.

$$i_a = \frac{ \sum(i_b \mathrm{pop}_b)}{\sum  \mathrm{pop}_b} $$

$$i_b = \mathrm{p2i}(p_b)$$

where $\mathrm{p2i}$ is a from a model that was published previously. [@cameron2015defining]
After fitting, this model defines a function
$$\mathrm{p2i}: f\left(P\right) = 2.616P - 3.596P^2 + 1.594P^3$$.

The linear predictor of the model, $\eta_b$, is related to prevalence by a typical logit link function.

$$p_b = \operatorname{logit}^{-1}(\eta_b)$$

The linear predictor is composed of an intercept, covariates and a spatial, Gaussian random field.

$$\eta_b = \beta_0 + \beta X  + u(s, \tau, \kappa)$$

The spatial effect $u(s, \tau, \kappa)$ has a Mat\'ern covariance function and two hyper parameters. blah.

Finally, we complete the model by setting priors on the parameters $\beta_0, \beta, \tau$ and $\kappa$.

We set

$$\log(\tau)\sim \operatorname{ Norm}(2, 6)$$

which corresponds to a mean nominal range $r = \frac{\tau}{\sqrt{2}}$ of one fifth of the range of the study area.

We set
$$\log(\kappa)\sim \operatorname{ Norm}(2, 6)$$

for some reason.
Finally, we set regularising priors on the regression coefficients

$$\beta_i \sim \operatorname{ Norm}(0, \sigma)$$

where we try the values for $\sigma$, 0.2, 1 and 2.

Given this setup, we get predictions of prevalence and incidence simultaneously whether we used both data types or just one.


### experiments

To compare the three models we used two cross validation schemes. 
In the first, the combined data set of prevalence and incidence data was split into five cross-validation folds stratified by data type.
This reflects real world data where we sometimes have incidence data but no prevalence data and visa versa.
In the second validation scheme the incidence data was split into five spatial cross-validation folds (see Figure~\ref{fig:data}b).
Then, any prevalence data within the hold out incidence polygons was also withheld.
This scheme is testing the models' ability to predict into new areas with no information from the spatial random field.

In both cases we examined performance metrics for both the withheld prevalence data and the withheld incidence data.
As there is no good way of combining predictive error from both types of data into one performance metric, we considered performance separately throughout.
Our main performance metric was Pearson's correlation.
However, we also considered Spearman's correlation.
If the prevalence-incidence relationship is poorly estimated, this will strongly affect the Pearson's correlation while the Spearman's correlation will be relatively robust to this source of poor model performance.


results
-------------

discussion
-------------------

what did and didn't work
application to global maps
further ml work
potential way to refine prevalence incidence relationship.






