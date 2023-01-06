#!/usr/bin/env Rscript

isprime <- function(n) {
   found_divisor = FALSE
   if (n <= 1) {
      return(FALSE)
   } else if (n == 2) {
      return(TRUE)
   } else {
      for (i in 2:ceiling(sqrt(n))) {
         found_divisor <- found_divisor | n %% i == 0
      }
      return(!found_divisor)
   }
}

verbose_answer <- function(n) {
   wasit <- isprime(n)
   str_not <- if (wasit) '' else 'not '
   cat(paste0(n, " is ", str_not, "prime\n"))
}

args <- commandArgs(trailingOnly=TRUE)
n <- as.numeric(args[1])
verbose_answer(n)