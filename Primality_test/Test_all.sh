#!/usr/bin/env bash

path=$(pwd)
file_regex='Primality_test\..*'
n=13

bash ../Utilities/Test_contents_of_directory.sh $path $file_regex $n
