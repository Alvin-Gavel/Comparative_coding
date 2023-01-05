#!/usr/local/bin/python3
import sys

def mandelbrot(x_steps, y_steps, iterations):
   
   min_x = -2.0
   max_x = 0.5
   span_x = max_x - min_x
   step_x = span_x / (x_steps - 1)
   
   min_y = -1.2
   max_y = 1.2
   span_y = max_y - min_y
   step_y = span_y / (y_steps - 1)
   
   complex_plane = []
   for x_pos in range(x_steps):
      re = min_x + x_pos * step_x
      column = []
      for y_pos in range(y_steps):
         im = min_y + y_pos * step_y
         column.append([re, im, re, im, False])
      complex_plane.append(column)
      
   for x_pos in range(x_steps):
      for y_pos in range(y_steps):
         for i in range(iterations):
            diverged = complex_plane[x_pos][y_pos][4]
            
            if not diverged:
               re = complex_plane[x_pos][y_pos][0]
               im = complex_plane[x_pos][y_pos][1]
            
               zi_re = complex_plane[x_pos][y_pos][2]
               zi_im = complex_plane[x_pos][y_pos][3]
            
               zi1_re = zi_re * zi_re - zi_im * zi_im + re
               zi1_im = 2 * zi_re * zi_im + im
               
               diverged = zi1_re * zi1_re + zi1_im * zi1_im > 4
               
               complex_plane[x_pos][y_pos][2] = zi1_re
               complex_plane[x_pos][y_pos][3] = zi1_im
               complex_plane[x_pos][y_pos][4] = diverged

   for y_pos in range(y_steps):
      row = ''
      for x_pos in range(x_steps):
         if complex_plane[x_pos][y_pos][4]:
            row += ' '
         else:
            row += '*'
      print(row)
   return

x_steps = int(sys.argv[1])
y_steps = int(sys.argv[2])
iterations = int(sys.argv[3])
mandelbrot(x_steps, y_steps, iterations)
