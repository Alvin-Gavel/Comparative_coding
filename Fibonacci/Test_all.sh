#!/usr/bin/env bash

# Left to my own devices I would have used ls here, so thanks to this guy for deterring me: https://stackoverflow.com/a/938052/11890275

py_regex='.*\.py'
R_regex='.*\.R'
php_regex='.*\.php'
sh_regex='.*\.sh'

file_regex='Fibonacci\..*'

n=10

for filename in $(find .)
do
  if [[ $filename =~ $file_regex ]]
  then
     if [[ $filename =~ $py_regex ]]
     then
         python3 $filename $n
     elif [[ $filename =~ $R_regex ]]
     then
         Rscript $filename $n
     elif [[ $filename =~ $php_regex ]]
     then
         php $filename $n
     elif [[ $filename =~ $sh_regex ]]
     then
         sh $filename $n
     fi
  fi
done
