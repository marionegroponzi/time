#!/usr/bin/python3
import os


def fillPrimesTil(i):
    l = []
    for count in range(i):
        if isPrime(count):
            l.append(count)
    return l

def isPrime(number):
    if number <= 1: return False
    for i in range(2, number):
        if number%i == 0: return False
    return True

count = int(os.getenv('COUNT'))
primes = fillPrimesTil(count)
print(f"{len(primes)} primes between 1 and {count}");

