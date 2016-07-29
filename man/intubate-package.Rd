\name{intubate-package}
\alias{intubate-package}
\docType{package}
\title{Interface to Popular R Functions for Data Science Pipelines.}
\description{
  \code{intubate} implements interfaces to popular R functions with formulas,
  such as \code{lm}, so they can be included painlessly in data science pipelines
  implemented by \code{magrittr} with the operator \%>\%.
  
  \code{intubate} allows to use, effortlessly,
  classic rock solid R functions in a consistent
  "modern" pipeline notation.
  
  For functions missing interfaces, there is an easy
  (one line) way to to create new interfaces "on the fly" 
  (see \code{\link{ntbt_function_formula_data}}) that should cover
  the vast majority of functions with formulas
  (only 4 out of 87 interfaces implemented so far
  require nonstandard treatment).
  
  Currently, there are interfaces for
  \code{gam}, \code{graphics}, \code{lattice}, \code{leaps}, \code{MASS},
  \code{nlme}, \code{nnet}, \code{pls}, \code{rpart}, \code{stats},
  and \code{survival}.
  The aim is to provide interfaces to most methodologies
  used in data science.

  \code{intubate} is still a work in progress.
  As such, the implementation may change in future
  versions until stabilization.
}
\details{
\tabular{ll}{
Package: \tab intubate\cr
Type: \tab Package\cr
Version: \tab 0.99.2\cr
Date: \tab 2016-07-26\cr
License: \tab GPL (>=2)\cr
}
See examples of use below.
}
\author{
Roberto Bertolusso

Maintainer: Roberto Bertolusso <rbertolusso@rice.edu>
}
\examples{
######### Interface to lm #########
## Original function to interface
lm(conc ~ uptake, CO2)

## The interface reverses the order of data and formula
ntbt_lm(CO2, conc ~ uptake)

## so it can be used easily in a pipeline.
library(magrittr)
CO2 \%>\%
  ntbt_lm(conc ~ uptake)

CO2 \%>\%
  ntbt_lm(conc ~ uptake) \%>\%
  summary()

######### Interface to cor.test #########
## Original function to interface
cor.test(~ CONT + INTG, data = USJudgeRatings)

## The interface reverses the order of data and formula
ntbt_cor.test(data = USJudgeRatings, ~ CONT + INTG)

## so it can be used easily in a pipeline.
USJudgeRatings \%>\%
  ntbt_cor.test(~ CONT + INTG)
  
######### Interfaces to aggregate and xtabs #########
## Original function to interface
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)

## The interface reverses the order of data and formula
ag <- ntbt_aggregate(ToothGrowth, len ~ ., mean)
ntbt_xtabs(ag, len ~ .)

## so it can be used easily in a pipeline.
ToothGrowth \%>\%
  ntbt_aggregate(len ~ ., mean) \%>\%
  ntbt_xtabs(len ~ .)

######### Using original functions in data pipelines #########
## Using lm directly in a data pipeline will raise an error
try(CO2 \%>\%
      lm(conc ~ uptake))
## unless formula= is specified.
try(CO2 \%>\%
      lm(formula=conc ~ uptake))

## Using cor.test directly in a data pipeline will raise an error
try(USJudgeRatings \%>\%
      cor.test(~ CONT + INTG))
## regardless of specifying formula=
try(USJudgeRatings \%>\%
      cor.test(formula = ~ CONT + INTG))

## Using aggregate directly in a data pipeline will raise an error
try(ToothGrowth \%>\%
      aggregate(len ~ ., mean) \%>\%
      xtabs(len ~ .))
## regardless of specifying formula=
try(ToothGrowth \%>\%
      aggregate(formula=len ~ ., mean))
}
\keyword{intubate}
\keyword{magrittr}
\keyword{data science}

