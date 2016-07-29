\name{ntbt_function_formula_data}
\alias{ntbt_function_formula_data}
\alias{ntbt_function_x_data}
\alias{ntbt_function_object_data}
\alias{ntbt_function_model_data}
\alias{function_formula_data}
\alias{function_x_data}
\alias{function_object_data}
\alias{function_model_data}
\title{Creation of ntbt_ interfaces "on the fly" for data science pipelines.}
\description{
  \code{ntbt_function_formula_data}, \code{ntbt_function_x_data},
  \code{ntbt_function_object_data}, and , \code{ntbt_function_model_data}
  are helper functions
  to implement "on the fly" interfaces to functions you want to use in pipelines
  implemented by \code{magrittr}. Suppose intubate does not implement an interface
  to a fantasy function (such as \code{fantasy(formula, data, ...)}). In a vast
  majority of cases, the only needed implementation to create such interface
  is the line of code
  \code{ntbt_fantasy <- ntbt_function_formula_data}, 
  after which \code{ntbt_fantasy(data, formula, ...)} can be used in a data
  science pipeline. See examples}
\usage{
ntbt_function_formula_data(data, formula, ...)
function_formula_data(formula, data, ...)

ntbt_function_x_data(data, x, ...)
function_x_data(x, data, ...)

ntbt_function_object_data(data, object, ...)
function_object_data(object, data, ...)

ntbt_function_model_data(data, model, ...)
function_model_data(model, data, ...)
}
\arguments{
  \item{data}{an data frame, tibble, list (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
  \item{formula}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{x}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{object}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{model}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{...}{Other arguments passed to \code{function_formula_data} or \code{function_x_data}, \code{function_object_data}, or \code{function_model_data}.}
}
\details{
  \code{ntbt_function_formula_data} (\code{ntbt_function_x_data},
  \code{ntbt_function_object_data}) reverses the order of \code{data} and \code{formula}) (\code{data} and \code{x}, \code{data} and \code{object}, \code{data} and \code{model}),
  so it can be used in a pipeline.
  It then calls \code{function_formula_data} (\code{function_x_data}, \code{function_object_data}, \code{function_model_data}).
}
\value{
  Object returned by \code{function_formula_data} (\code{function_x_data},
  \code{function_object_data}, \code{function_model_data}) (just the data submitted).
}
\author{
Roberto Bertolusso
}
\examples{
## NOTE: intubate implements an interface to
##       *xyplot* (in package lattice), called *ntbt_xyplot*.
##       For the sake of argument, let's suppose the
##       interface does not exist, and you want to implement
##       it "on the fly" to use it in a pipeline.

## Original function you would like to interface
library(lattice)
xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
       data = iris, scales = "free", layout = c(2, 2),
       auto.key = list(x = .6, y = .7, corner = c(0, 0)))

## By looking the documentation of *xyplot* you notice that
## the formula uses *x* followed by *data*.
## This means that the corresponding helper function
## to create the interface is *ntbt_function_x_data*.
## The interface is created as follows (one line)

ntbt_xyplot <- ntbt_function_x_data

## NOTE: interfaces must start with *ntbt_* followed by the name
##        of the function (*xyplot* in this case) you want to interface.

## Now you can call the interface, remembering
## to switch the order of *data* and *x*.
ntbt_xyplot(data = iris, 
            Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
            scales = "free", layout = c(2, 2),
            auto.key = list(x = .6, y = .7, corner = c(0, 0)))

## The newly created interface can be used easily in a pipeline.
library(magrittr)
iris \%>\%
  ntbt_xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
              scales = "free", layout = c(2, 2),
              auto.key = list(x = .6, y = .7, corner = c(0, 0)))
}
\keyword{intubate}
\keyword{magrittr}
\keyword{ntbt_function_formula_data}
\keyword{ntbt_function_x_data}
\keyword{ntbt_function_object_data}
\keyword{ntbt_function_model_data}
