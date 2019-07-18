/*
 Challenge 2: Is a string a palindrome?
 Difficulty: Easy Write a function that accepts a String as its only parameter, and returns true if the string
 reads the same when reversed, ignoring case. 
 */

import Foundation
import PlaygroundSupport

//m,n must be positive, m > n
func unsafe_euclidean(m: Int, n: Int) -> Int {
    return n != 0 ? unsafe_euclidean(m: n, n: m % n) : m
}

func gcdByEuclidean(a: Int, b: Int) -> Int? {
    guard a > 0, b > 0 else { return nil }
    
    var m = a
    var n = b
    
    if n > m {
        swap(&m, &n)
    }
    
    return unsafe_euclidean(m: m, n: n)
}

func primesByEratosthenesSieve(upTo: Int) -> [Int] {
    guard upTo > 1 else { return [] }
    
    var sieve = Array(repeating: false, count: upTo)
    sieve[0] = true
    sieve[1] = true
    
    for i in 2..<upTo {
        if sieve[i] == false {
            for multiple in stride(from: i*i, to: sieve.count, by: i) {
                sieve[multiple] = true
            }
        }
    }
    
    return sieve.enumerated().compactMap { $0.element == false ? $0.offset : nil }
}

func factorizing(_ number: Int) -> [Int] {
    let primes = primesByEratosthenesSieve(upTo: number)
    
    return primes.filter { number % $0 == 0 }
}

func gcdBySchoolMethod(a: Int, b: Int) -> Int? {
    guard a > 0, b > 0 else { return nil }
    
    let a_multiples = factorizing(a).sorted()
    let b_multiples = factorizing(b).sorted()
    
    var commonMultiples = [Int]()
    for i in 0 ..< min(a_multiples.count, b_multiples.count) {
        if a_multiples[i] == b_multiples[i] {
            commonMultiples.append(a_multiples[i])
            commonMultiples.append(b_multiples[i])
        }
    }
    
    return commonMultiples.reduce(1, { $0 * $1 })
}


gcdByEuclidean(a: 24, b: 100)
gcdBySchoolMethod(a: 24, b: 100)

PlaygroundPage.current.needsIndefiniteExecution = true
