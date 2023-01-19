#!/usr/bin/env Rscript

fibonacci <- function(n) {
   F_n <- 1
   F_nm1 <- 0
   for (i in 1:n) {
      F_old <- F_n
      F_n <- F_n + F_nm1
      F_nm1 <- F_old
   }
   cat(F_nm1, '\n')
}

n <- commandArgs(trailingOnly=TRUE)[1]
fibonacci(n)