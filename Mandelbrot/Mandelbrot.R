#!/usr/bin/env Rscript

mandelbrot <- function(x_steps, y_steps, iterations) {
  
  min_x <- -2.0
  max_x <- 0.5
  span_x <- max_x - min_x
  step_x <- span_x / (x_steps - 1)
  
  min_y <- -1.2
  max_y <- 1.2
  span_y <- max_y - min_y
  step_y <- span_y / (y_steps - 1)
  
  complex_plane <- list()
  for (x_pos in 1:x_steps) {
    re <- min_x + x_pos * step_x
    column <- list()
    for (y_pos in 1:y_steps) {
      im <- min_y + y_pos * step_y
      column <- append(column, list(list(re, im, re, im, FALSE)), y_pos)
    }
    complex_plane <- append(complex_plane, list(column), x_pos)
  }
  
  for (x_pos in 1:x_steps) {
    for (y_pos in 1:y_steps) {
      for (i in 1:iterations) { 
        diverged <- complex_plane[[x_pos]][[y_pos]][[5]]
        
        if (!diverged) {
          re <- complex_plane[[x_pos]][[y_pos]][[1]]
          im <- complex_plane[[x_pos]][[y_pos]][[2]]
          
          zi_re <- complex_plane[[x_pos]][[y_pos]][[3]]
          zi_im <- complex_plane[[x_pos]][[y_pos]][[4]]
          
          zi1_re <- zi_re^2 - zi_im^2 + re
          zi1_im <- 2 * zi_re * zi_im + im
          
          diverged <- (zi1_re * zi1_re + zi1_im * zi1_im > 4)
          
          complex_plane[[x_pos]][[y_pos]][[3]] <- zi1_re
          complex_plane[[x_pos]][[y_pos]][[4]] <- zi1_im
          complex_plane[[x_pos]][[y_pos]][[5]] <- diverged
        }
      }
    }
  }
  
  for (y_pos in 1:y_steps) {
    row <- ''
    for (x_pos in 1:x_steps) {
      if (complex_plane[[x_pos]][[y_pos]][[5]]) {
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