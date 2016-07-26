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

ntbt_boxplot <-
  ntbt_cdplot <-
  ntbt_coplot <-
  ntbt_mosaicplot <-
  ntbt_pairs <-
  ntbt_plot <-
  ntbt_spineplot <-
  ntbt_sunflowerplot <-
  function(data, formula, ...) {
    Call <- match.call()
    fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
    Call[[1]] <- as.name(fname)
    
    Call[2:3] <- Call[3:2]
    names(Call)[2:3] <- names(Call)[3:2]
    
    eval(Call, envir = parent.frame())
  }

ntbt_stripchart <-
  function(data, formula, ...) {
    Call <- match.call()
    fname <- gsub("ntbt_(.+)", "\\1", as.character(Call[[1]]))
    Call[[1]] <- as.name(fname)
    
    Call[2:3] <- Call[3:2]
    names(Call)[2:3] <- c("x", "data")
    
    eval(Call, envir = parent.frame())
  }


