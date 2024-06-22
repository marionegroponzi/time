import platform.posix.*
import kotlinx.cinterop.*

@OptIn(ExperimentalForeignApi::class)
fun main() {
    val count = getenv("COUNT")?.toKString()?.toInt() ?: 0
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