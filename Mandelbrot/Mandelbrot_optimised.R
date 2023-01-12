#!/usr/bin/env Rscript


mandelbrot <- function(x_steps, y_steps, iterations) {
   
   min_x <- -2.0
   max_x <- 0.5
   
   min_y <- -1.2
   max_y <- 1.2
   
   real_axis <- seq(from = min_x, to = max_x, length.out = x_steps)
   imag_axis <- seq(from = min_y, to = max_y, length.out = y_steps)
   complex_plane_temp <- complex(real = rep(real_axis, times = 1, each = y_steps),
                            imag = rep(imag_axis, times = x_steps, each = 1))
   complex_plane <- matrix(complex_plane_temp, x_steps, y_steps)
   Z <- matrix(complex_plane_temp, x_steps, y_steps)
   
   for (i in 1:iterations) { 
       Z <- Z^2 + complex_plane
       diverged <- (abs(Z) > 4)
     }
   
   for (y_pos in 1:y_steps) {
      row <- ''
      for (x_pos in 1:x_steps) {
         if (diverged[y_pos, x_pos]) {
            row <- paste(row, " ", sep="")
         } else {
            row <- paste(row, "*", sep="")
         }
      }
      row <- paste(row, "\n", sep="")
      cat(row)
   }
}

args <- commandArgs(trailingOnly=TRUE)
x_steps <- as.numeric(args[1])
y_steps <- as.numeric(args[2])
iterations <- as.numeric(args[3])

mandelbrot(x_steps, y_steps, iterations)