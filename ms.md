
# A comparison of models for polygon data, point data or both for malaria mapping


1. user Madagascar as a case study.
2. do cross validation on both pr and polygon. no good way to convince so just have to report both in every case
3. can't see good way to compare stacked generalisation with linear polygon so have to do all linear.
4. if this paper falls out easily can expand to ml and polygon as covariates. or project for ra?
5. probably want random cv and spatial cv?
6. might need more countries but do first draft like this.
7. spatial only.



intro
-----

malaria is bad but decreasing
moving to strategy of elimination country by country
elimination requires maps of low prevalence areas
for this we need new sources of data.


but maps in low prevalence areas are difficult
sometimes little data
data is uninformative

however surveillance data is sometimes high quality in these areas
pixel level maps from aggregates data is difficult.
not much information for covariates
undeveloped area of statistics

Ideal situation is to combine data
benefits of both
but data are on different scales

here we compared 3 models, point only, polygon only and joint models
we use Madagascar as a case study add it has good surveillance data and good pr data.
we find that...



