#!/usr/local/bin/python3
import sys

import numpy as np

def mandelbrot(x_steps, y_steps, iterations):

   min_x = -2.0
   max_x = 0.5

   min_y = -1.2
   max_y = 1.2
   
   real_axis = np.linspace(min_x, max_x, x_steps)
   imag_axis = np.linspace(min_y, max_y, y_steps)

   real_coords, imag_coords = np.meshgrid(real_axis, imag_axis)
   complex_plane = real_coords + 1j * imag_coords
   Z = real_coords + 1j * imag_coords

   for i in range(iterations):
      diverged = np.abs(Z) > 4
      Z[~diverged] = Z[~diverged]**2 + complex_plane[~diverged]

   for y_pos in range(y_steps):
      row = ''
      for x_pos in range(x_steps):
         if diverged[y_pos][x_pos]:
            row += ' '
         else:
            row += '*'
      if '*' in row:
         print(row)
   return

x_steps = int(sys.argv[1])
y_steps = int(sys.argv[2])
iterations = int(sys.argv[3])
mandelbrot(x_steps, y_steps, iterations)
