import java.util.ArrayList;
import java.util.List;

class HelloWorld {
  public static void main(String[] args) {
    int count = Integer.parseInt(System.getenv("COUNT"));
    List<Integer> primes = fillPrimesTil(count);
    System.out.println(String.format("%d primes between 1 and %d", primes.size(), count));
  }

  private static List<Integer> fillPrimesTil(int i) {
    List<Integer> l = new ArrayList<Integer>(1);
    for (int count = 0; count < i; count++) {
      if (isPrime(count)) {
        l.add(count);
      }
    }
    return l;
  }

  private static boolean isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i < number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }
}