/*
 Challenge 61: Find prime numbers
 Difficulty: Tricky Write a function that returns an array of prime numbers from 2 up to but excluding N, taking
 care to be as efficient as possible.
 */

import Foundation

var countOps = 50
let queue = OperationQueue()

func getPrimes(upTo: Int)->[Int]{
    var results = [[Int]]()
    countOps = min(countOps, upTo)
    
    for i in 1..<countOps + 1{
        let lowerBound = upTo/countOps*(i-1)
        let upperBound = upTo/countOps*i
        print("\(lowerBound)...\(upperBound)")
        let op = FindPrimeOperation(lowerBound, to: upperBound)
        op.completionBlock = { [unowned op] in
            if op.output.isEmpty == false{
                results.append(op.output)
            }
        }
        
        queue.addOperation(op)
    }
    
    queue.waitUntilAllOperationsAreFinished()
    
    return results.flatMap{$0}.sorted()
}

func getPrimesBySieveofEratosthenes(upTo: Int)->[Int]{
    guard upTo > 1
        else { return [] }
    
    var sieve = [Bool](repeating: false, count: upTo)
    
    sieve[0] = true
    sieve[1] = true
    
    for number in  2..<upTo{
        if sieve[number] == false{
            for multiple in stride(from: number*number, to: sieve.count, by: number){
                sieve[multiple] = true
            }
        }
    }
    
    return sieve.enumerated().compactMap { $0.element == false ? $0.offset : nil }
}



getPrimes(upTo: 10)
getPrimes(upTo: 11)
getPrimes(upTo: 12)

startClock()
getPrimesBySieveofEratosthenes(upTo: 500)
stopClock()

startClock()
getPrimes(upTo: 500)
stopClock()



/*
 •    The code challenge61(upTo: 10) should return 2, 3, 5, 7.  
 •    The code challenge61(upTo: 11) should return 2, 3, 5, 7; remember to exclude  the upper bound.  
 •    The code challenge61(upTo: 12) should return 2, 3, 5, 7, 11.
 */

