function fillPrimesTil(i) {
    let l = [];
    for (let count = 0; count < i; count++) {
        if (isPrime(count)) {
            l.push(count);
        }
    }
    return l;
}

function isPrime(number) {
    if (number <= 1) return false;
    for (let i = 2; i < number; i++) {
        if (number % i === 0) return false;
    }
    return true;
}

let count = 10000;
let primes = fillPrimesTil(10000);
console.log(`${primes.length} primes between 1 and ${count}`);