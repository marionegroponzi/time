fun main() {
    val count = System.getenv("COUNT").toInt()
    val primes = fillPrimesTil(count)
    println("${primes.size} primes between 1 and $count")
}

fun fillPrimesTil(i: Int): List<Int> {
    val l = mutableListOf<Int>()
    for (count in 0 until i) {
        if (isPrime(count)) {
            l.add(count)
        }
    }
    return l
}

fun isPrime(number: Int): Boolean {
    if (number <= 1) return false
    for (i in 2 until number) {
        if (number % i == 0) return false
    }
    return true
}