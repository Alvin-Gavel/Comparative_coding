#!/usr/local/bin/python3
import sys
import math

def isprime(n):
   found_divisor = False
   for i in range(2, int(math.ceil((math.sqrt(n))))):
      found_divisor = found_divisor or n % i == 0
   return not(found_divisor)

def verbose_answer(wasit):
   str_not = '' if wasit else 'not ' 
   print("{} is {}prime".format(n, str_not))
   return

n = int(sys.argv[1])
verbose_answer(isprime(n))
