<?php

function mandelbrot($x_steps, $y_steps, $iterations) {
   
   $min_x = -2.0;
   $max_x = 0.5;
   $span_x = $max_x - $min_x;
   $step_x = $span_x / ($x_steps - 1);
   
   $min_y = -1.2;
   $max_y = 1.2;
   $span_y = $max_y - $min_y;
   $step_y = $span_y / ($y_steps - 1);
   
   $complex_plane = array();
   for ($x_pos = 0; $x_pos <= $x_steps; $x_pos++) {
      $re = $min_x + $x_pos * $step_x;
      $column = array();
      for ($y_pos = 0; $y_pos <= $y_steps; $y_pos++) {
         $im = $min_y + $y_pos * $step_y;
         $column[] = array($re, $im, $re, $im, False);
      }
      $complex_plane[] = $column;
   }
   
   for ($x_pos = 0; $x_pos <= $x_steps; $x_pos++) {
      for ($y_pos = 0; $y_pos <= $y_steps; $y_pos++) {
         for ($i = 0; $i <= $iterations; $i++) { 
            $diverged = $complex_plane[$x_pos][$y_pos][4];
            
            if (!$diverged) {
               $re = $complex_plane[$x_pos][$y_pos][0];
               $im = $complex_plane[$x_pos][$y_pos][1];
               
               $zi_re = $complex_plane[$x_pos][$y_pos][2];
               $zi_im = $complex_plane[$x_pos][$y_pos][3];
               
               $zi1_re = $zi_re**2 - $zi_im**2 + $re;
               $zi1_im = 2 * $zi_re * $zi_im + $im;
               
               $diverged = $zi1_re**2 + $zi1_im**2 > 4;
               
               $complex_plane[$x_pos][$y_pos][2] = $zi1_re;
               $complex_plane[$x_pos][$y_pos][3] = $zi1_im;
               $complex_plane[$x_pos][$y_pos][4] = $diverged;
            }
         }
      }
   }
   
   for ($y_pos = 0; $y_pos <= $y_steps; $y_pos++) {
      $row = '';
      for ($x_pos = 0; $x_pos <= $x_steps; $x_pos++) {
         if ($complex_plane[$x_pos][$y_pos][4]) {
            $row .= " ";
         } else {
            $row .= "*";
         }
      }
      $row .= "\n";
      echo($row);
   }
}

$x_steps = $argv[1];
$y_steps = $argv[2];
$iterations = $argv[3];

mandelbrot($x_steps, $y_steps, $iterations);
?>
