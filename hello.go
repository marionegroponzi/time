package main

import (
    "fmt"
    "os"
    "strconv"
)

func fillPrimesTil(i int) []int {
    var l []int
    for count := 0; count < i; count++ {
        if isPrime(count) {
            l = append(l, count)
        }
    }
    return l
}

func isPrime(number int) bool {
    if number <= 1 {
        return false
    }
    for i := 2; i < number; i++ {
        if number%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    count, _ := strconv.Atoi(os.Getenv("COUNT"))
    primes := fillPrimesTil(count)
    fmt.Printf("%d primes between 1 and %d\n", len(primes), count)
}