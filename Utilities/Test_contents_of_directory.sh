#!/usr/bin/env bash

test_all() {
  directory_path=$1
  file_regex=$2
  arguments=${@:3}

  languages=('Python' 'R' 'PHP' 'bash')
  declare -A regexen=( ['Python']='.*\.py' ['R']='.*\.R' ['PHP']='.*\.php' ['bash']='.*\.sh' )
  declare -A run_commands=( ['Python']='python3' ['R']='Rscript' ['PHP']='php' ['bash']='bash' )

  # Left to my own devices I would have used ls here, so thanks to this guy for deterring me: https://stackoverflow.com/a/938052/11890275
  for filepath in $(find $directory_path)
  do
    words=($(echo $filepath | tr "/" "\n"))
    filename=${words[-1]}
    
    if [[ $filename =~ $file_regex ]]
    then
      for language in ${languages[@]}
      do
        if [[ $filename =~ ${regexen[$language]} ]]
        then
          echo $"Testing $language script $filename:"
          ${run_commands[$language]} $filepath $arguments
        fi
      done
    fi
  done
}

test_all $1 $2 ${@:3}
