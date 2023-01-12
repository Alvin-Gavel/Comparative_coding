#!/usr/bin/env bash

n=$1
path=$(pwd)
file_regex='^Fibonacci\..*'

bash ../Utilities/Test_contents_of_directory.sh $path $file_regex $n
