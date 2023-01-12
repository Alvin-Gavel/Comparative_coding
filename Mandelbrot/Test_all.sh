#!/usr/bin/env bash

x=$1
y=$2
n=$3
path=$(pwd)
file_regex='^Mandelbrot.*\..*'

bash ../Utilities/Test_contents_of_directory.sh $path $file_regex $x $y $n
