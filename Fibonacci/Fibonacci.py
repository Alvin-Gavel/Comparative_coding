#!/usr/local/bin/python3

import sys

def fibonacci(n):
   F_n = 1
   F_nm1 = 0
   for i in range(n):
     F_n, F_nm1 = F_n + F_nm1, F_n
   print(F_nm1)
   return

n = int(sys.argv[1])
fibonacci(n)
