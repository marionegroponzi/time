#include <stdio.h>
#include <stdlib.h>

int isPrime(int number) {
    if (number <= 1) return 0;
    for (int i = 2; i < number; i++) {
        if (number % i == 0) return 0;
    }
    return 1;
}

int* fillPrimesTil(int i, int* size) {
    int* l = malloc(i * sizeof(int));
    *size = 0;
    for (int count = 0; count < i; count++) {
        if (isPrime(count)) {
            l[(*size)++] = count;
        }
    }
    return l;
}

int main() {
    char* countStr = getenv("COUNT");
    int count = countStr ? atoi(countStr) : 0;
    int size;
    int* primes = fillPrimesTil(count, &size);
    printf("%d primes between 1 and %d\n", size, count);
    free(primes);
    return 0;
}