#!/usr/bin/env bash

fibonacci() {
   n=$1
   local F_n=1
   local F_nm1=0
   for i in $(seq 1 $n)
   do
      F_old=$F_n
      F_n=$(($F_n+$F_nm1))
      F_nm1=$F_old
   done
   echo $F_nm1
}

fibonacci $1
