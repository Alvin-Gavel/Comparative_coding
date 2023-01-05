#!/usr/bin/env bash

test_all() {
  directory_path=$1
  file_regex=$2
  argument=$3

  languages=('python' 'R' 'php' 'bash')
  declare -A regexen=( ['python']='.*\.py' ['R']='.*\.R' ['php']='.*\.php' ['bash']='.*\.sh' )
  declare -A run_commands=( ['python']='python3' ['R']='Rscript' ['php']='php' ['bash']='bash' )

  # Left to my own devices I would have used ls here, so thanks to this guy for deterring me: https://stackoverflow.com/a/938052/11890275
  for filename in $(find $directory_path)
  do
    if [[ $filename =~ $file_regex ]]
    then
      for language in ${languages[@]}
      do
        if [[ $filename =~ ${regexen[$language]} ]]
        then
          echo $"Testing $language script:"
          ${run_commands[$language]} $filename $argument
        fi
      done
    fi
  done
}

test_all $1 $2 $3
