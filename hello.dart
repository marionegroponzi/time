import 'dart:io';

void main() {
  final count = int.parse(Platform.environment['COUNT']!);
  final primes = fillPrimesTil(count);
  print("${primes.length} primes between 1 and $count");
}

List<int> fillPrimesTil(int i) {
  List<int> l = [];
  for (int count = 0; count < i; count++) {
    if (isPrime(count)) {
      l.add(count);
    }
  }
  return l;
}

bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i < number; i++) {
    if (number % i == 0) return false;
  }
  return true;
}
