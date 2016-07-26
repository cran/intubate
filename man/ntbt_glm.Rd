\name{ntbt_glm}
\alias{ntbt_glm}
\title{Interface to glm for data science pipelines.}
\description{
  \code{ntbt_glm} is an interface to \code{stats::\link{glm}}
  (Fitting Generalized Linear Models) that can be used
  in a pipeline implemented by \code{magrittr}.}
\usage{
ntbt_glm(data, formula, ...)
}
\arguments{
  \item{data}{an data frame, tibble, list (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
  \item{formula}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{...}{Other arguments passed to \code{\link{glm}}.
  However, \code{family} needs to be specified after
  \code{formula} (it does not assume \code{gaussian}. See examples).}
}
\details{
  ntbt_glm reverses the order of \code{data} and \code{formula}, so it can be
  used in a pipeline. It then calls \code{\link{glm}}.
}
\value{
  Object returned by \code{\link{glm}}.
}
\author{
Roberto Bertolusso
}
\seealso{
  \code{\link{glm}}
}
\examples{
utils::data(anorexia, package = "MASS")

## Original function to interface
anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
                family = gaussian, data = anorexia)
summary(anorex.1)

## The interface reverses the order of data and formula
## NOTE: family must follow formula.
anorex.1 <- ntbt_glm(data = anorexia,
                     formula = Postwt ~ Prewt + Treat + offset(Prewt),
                     family = gaussian)
## It is not necessary to specify the argument names
anorex.1 <- ntbt_glm(anorexia,
                     Postwt ~ Prewt + Treat + offset(Prewt),
                     gaussian)
summary(anorex.1)

## so it can be used easily in a pipeline.
library(magrittr)
anorexia \%>\%
  ntbt_glm(Postwt ~ Prewt + Treat + offset(Prewt),
           family = gaussian) \%>\%
  summary()
## Without argument names
anorexia \%>\%
  ntbt_glm(Postwt ~ Prewt + Treat + offset(Prewt), gaussian) \%>\%
  summary()
  
# A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
data.frame(u = c(5,10,15,20,30,40,60,80,100),
           lot1 = c(118,58,42,35,27,25,21,19,18)
           ) \%>\%
  ntbt_glm(lot1 ~ log(u), family = Gamma) \%>\%
  summary()
}
\keyword{intubate}
\keyword{magrittr}
\keyword{ntbt_glm}
\keyword{glm}
