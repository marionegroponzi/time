import Foundation

func fillPrimesTil(_ i: Int) -> [Int] {
    var l = [Int]()
    for count in 0..<i {
        if isPrime(number: count) {
            l.append(count)
        }
    }
    return l
}

func isPrime(number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 { return false }
    }
    return true
}

if let countString = ProcessInfo.processInfo.environment["COUNT"], let count = Int(countString) {
    let primes = fillPrimesTil(count)
    print("\(primes.count) primes between 1 and \(count)")
}