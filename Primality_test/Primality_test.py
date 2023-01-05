#!/usr/local/bin/python3
import sys
import math

def isprime(n):
    found_divisor = False
    if n <= 1:
        return False
    elif n == 2:
        return True
    else:
        for i in range(2, int(math.ceil((math.sqrt(n)))) + 1):
            found_divisor = found_divisor or n % i == 0
        return not(found_divisor)

def verbose_answer(n):
    wasit = isprime(n)
    str_not = '' if wasit else ' not' 
    print("{} is{} prime".format(n, str_not))
    return

verbose_answer(int(sys.argv[1]))
