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
  function(data, formula, ...) {
    Call <- match.call()
    fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
    Call[[1]] <- as.name(fname)

    Call[2:3] <- Call[3:2]
    names(Call)[2:3] <- names(Call)[3:2]
    
    eval(Call, envir = parent.frame())
  }

## Functions that need specific manipulation.
ntbt_aggregate <-
  ntbt_glm <-
  function(data, formula, ...) {
  Call <- match.call()
  fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
  Call[[1]] <- as.name(fname)
  
  if (fname == "aggregate") {
    Call[2:3] <- Call[3:2]
    names(Call)[2:3] <- names(Call)[3:2]
    names(Call)[4] <- "FUN"
  } else if(fname == "glm") {
    Call[2:4] <- Call[c(3, 4, 2)]
    names(Call)[2:4] <- names(Call)[c(3, 4, 2)]
    names(Call)[3] <- "family"
    print(Call)
  }
  
  eval(Call, envir = parent.frame())
}
