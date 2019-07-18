/*
 Challenge: Find the greatest common devisor for two numbers
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
    
    var sieve = Array(repeating: false, count: upTo + 1)
    sieve[0] = true
    sieve[1] = true

    for i in 2...upTo {
        if sieve[i] == false {
            for multiple in stride(from: i*i, to: sieve.count, by: i) {
                sieve[multiple] = true
            }
        }
    }
    
    return sieve.enumerated().compactMap { $0.element == false ? $0.offset : nil }
}

func factorizing(_ number: Int, primes: [Int], result: inout [Int]) {
    let prime = primes.filter { number % $0 == 0 }.min()!
    result.append(prime)
    
    let devider = number/prime
    
    if devider == 1 {
        return
    }
    
    return factorizing(devider,
                       primes: primes.filter { $0 <= devider },
                       result: &result)
}

func factorizing(_ number: Int) -> [Int] {
    var multiples = [Int]()
    let primes = primesByEratosthenesSieve(upTo: number)
    factorizing(number, primes: primes, result: &multiples)
    return multiples
}

func gcdBySchoolMethod(a: Int, b: Int) -> Int? {
    guard a > 0, b > 0 else { return nil }
    
    let a_multiples = factorizing(a).sorted()
    let b_multiples = factorizing(b).sorted()
    var intersection = [Int]()
    var a_index = 0
    var b_index = 0
    
    while a_index < a_multiples.count && b_index < b_multiples.count {
        if a_multiples[a_index] == b_multiples[b_index] {
            intersection.append(a_multiples[a_index])
            a_index += 1
            b_index += 1
        } else if a_multiples[a_index] < b_multiples[b_index] {
            a_index += 1
        } else {
            b_index += 1
        }
    }
    
    return intersection.reduce(1, { $0 * $1 })
}


gcdByEuclidean(a: 14144, b: 25454)
gcdBySchoolMethod(a: 14144, b: 25454)

PlaygroundPage.current.needsIndefiniteExecution = true
