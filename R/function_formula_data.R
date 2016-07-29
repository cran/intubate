## Copyright (C) 2016 Roberto Bertolusso
##
## This file is part of intubate.
##
## intubate is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 2 of the License, or
## (at your option) any later version.
##
## intubate is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with intubate. If not, see <http://www.gnu.org/licenses/>.

function_formula_data <- function(formula, data, ...) data

## Functions that use *formula* followed by *data*.
ntbt_function_formula_data <-

  ## graphics
  ntbt_boxplot <-
  ntbt_cdplot <-
  ntbt_coplot <-
  ntbt_mosaicplot <-
  ntbt_pairs <-
  ntbt_plot <-
  ntbt_spineplot <-
  ntbt_sunflowerplot <-

  ## lattice
  ntbt_oneway <-

  ## MASS
  ntbt_corresp <-
  ntbt_glm.nb <-
  ntbt_lda <-
  ntbt_lm.gls <-
  ntbt_lm.ridge <-
  ntbt_loglm <-
  ntbt_lqs <-
  ntbt_polr <-
  ntbt_qda <-
  ntbt_rlm <-

  ## nnet
  ntbt_multinom <-
  ntbt_nnet <-

  ## pls
  ntbt_cppls <-
  ntbt_mvr <-
  ntbt_pcr <-
  ntbt_plsr <-
  
  ## rpart
  ntbt_rpart <-

  ## stats
  ntbt_ansari.test <-
  ntbt_aov <-
  ntbt_bartlett.test <-
  ntbt_cor.test <-
  ntbt_fligner.test <-
  ntbt_friedman.test <-
  ntbt_ftable <-
  ntbt_kruskal.test <-
  ntbt_lm <-
  ntbt_loess <-
  ntbt_model.frame <-
  ntbt_mood.test <-
  ntbt_nls <-
  ntbt_oneway.test <-
  ntbt_ppr <-
  ntbt_prcomp <-
  ntbt_princomp <-
  ntbt_quade.test <-
  ntbt_replications <-
  ntbt_t.test <-
  ntbt_var.test <-
  ntbt_wilcox.test <-
  ntbt_xtabs <-

  ## survival
  ntbt_cch <-
  ntbt_coxph <-
  ntbt_finegray <-
  ntbt_pyears <-
  ntbt_survConcordance <-
  ntbt_survexp <-
  ntbt_survfit <-
  ntbt_survSplit <-

  ## Implementation for functions that use *formula* followed by *data*.
  function(data, formula, ...) {
    Call <- match.call()
    fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
    Call[[1]] <- as.name(fname)

    Call[2:3] <- Call[3:2]
    names(Call)[2:3] <- names(Call)[3:2]

    eval(Call, envir = parent.frame())
  }
## Need to investigate if it is better to use
## as environment (instead of parent.frame()) either:
## - the envir where the formula was created
## - data

## *** Alternative implementation ***
##  function(data, formula, ...) {
##    Call <- match.call()
##    fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
##    pars <- as.list(Call)
##
##    pars[2:3] <- pars[3:2]
##    names(pars)[2:3] <- names(pars)[3:2]

##    do.call(fname, pars[-1], envir = parent.frame())
##  }
