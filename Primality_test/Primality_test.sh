#!/usr/bin/env bash

isprime() {
  n=$1
  local found_divisor=false
  if (($n <= 1))
  then
    echo "0"
  elif [ $n == 2 ]
  then
    echo "1"
  else
    for i in $(seq 2 $[$n-1])
    do
      found_divisor=$[$found_divisor || $[$[$n % $i] == 0]]
    done
    echo "$[! $found_divisor]"
  fi
}

verbose_answer() {
  n=$1
  local wasit=$(isprime $n)
  if [ $wasit == 1 ]
  then
    local str_not=''
  else
    local str_not=' not'
  fi
  echo "${n} is${str_not} prime"
}

verbose_answer $1
