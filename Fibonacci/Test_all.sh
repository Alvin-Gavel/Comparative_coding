#!/usr/bin/env bash

path=$(pwd)
file_regex='Fibonacci\..*'
n=10

bash ../Utilities/Test_contents_of_directory.sh $path $file_regex $n
