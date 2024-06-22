use std::env;

fn fill_primes_til(i: usize) -> Vec<usize> {
    let mut l = Vec::new();
    for count in 0..i {
        if is_prime(count) {
            l.push(count);
        }
    }
    l
}

fn is_prime(number: usize) -> bool {
    if number <= 1 {
        return false;
    }
    for i in 2..number {
        if number % i == 0 {
            return false;
        }
    }
    true
}

fn main() {
    let count: usize = env::var("COUNT")
        .unwrap_or_else(|_| "100".to_string()) // Default to 100 if COUNT is not set
        .parse()
        .expect("COUNT must be a number");
    let primes = fill_primes_til(count);
    println!("{} primes between 1 and {}", primes.len(), count);
}