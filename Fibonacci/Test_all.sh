#!/usr/bin/env bash

# Left to my own devices I would have used ls here, so thanks to this guy for deterring me: https://stackoverflow.com/a/938052/11890275

languages=('python' 'R' 'php' 'bash')
declare -A regexen=( ['python']='.*\.py' ['R']='.*\.R' ['php']='.*\.php' ['bash']='.*\.sh' )
declare -A run_commands=( ['python']='python3' ['R']='Rscript' ['php']='php' ['bash']='bash' )

file_regex='Fibonacci\..*'

n=10

for filename in $(find .)
do
  if [[ $filename =~ $file_regex ]]
  then
    for language in ${languages[@]}
    do
      if [[ $filename =~ ${regexen[$language]} ]]
      then
        echo $"Testing $language script:"
        ${run_commands[$language]} $filename $n
      fi
    done
  fi
done
