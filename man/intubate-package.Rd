\name{intubate-package}
\alias{intubate-package}
\docType{package}
\title{Interface to Popular R Functions for Data Science Pipelines.}
\description{
  Interface to popular R functions with formulas, such as 'lm', so they
  can be included painlessly in data science pipelines implemented by 'magrittr'
  with the operator \%>\%.
  
  intubate is still a work in progress.
  As such, implementation may change in future versions until stabilization.
  
  Currently, there are interfaces for
  \code{MASS}, \code{graphics}, and \code{stats}.
}
\details{
\tabular{ll}{
Package: \tab intubate\cr
Type: \tab Package\cr
Version: \tab 0.99.1\cr
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
}
\keyword{intubate}
\keyword{magrittr}
\keyword{data science}

