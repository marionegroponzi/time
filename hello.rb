#!/usr/bin/env ruby

def fill_primes_til(i)
    l = []
    (0...i).each do |count|
      if is_prime(count)
        l.push(count)
      end
    end
    l
  end

  def is_prime(number)
    return false if number <= 1
    (2...number).each do |i|
      return false if number % i == 0
    end
    true
  end

  count = ENV['COUNT'].to_i
  primes = fill_primes_til(count)
  puts "#{primes.length} primes between 1 and #{count}"