/*
 Challenge 61: Find prime numbers
 Difficulty: Tricky Write a function that returns an array of prime numbers from 2 up to but excluding N, taking
 care to be as efficient as possible.
 */

import Foundation

extension Int{
    func isPrime2()->Bool{
        guard self > 1 && self != 2 else { return false }
        
        //if the number n is not prime, it means it can be reached by multiplying two factors, x and y. If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible. So, we can be sure that at least one of x or y is less than or equal to the square root of n.
        let max = Int(ceil(sqrt(Double(self))))
        
        for i in 2..<max{
            if self % i == 0{
                return false
            }
        }
        
        return true
    }
    
    func isPrime()->Bool{
        guard self > 1 else { return false }
        
        for i in 2..<self{
            if self % i == 0{
                return false
            }
        }
        
        return true
    }
}

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

class FindPrimeOperation: AsyncOperation{
    let lowerBound: Int
    let upperBound: Int
    var output: [Int]
    
    init(_ from: Int, to: Int){
        self.lowerBound = from
        self.upperBound = to
        self.output = [Int]()
    }
    
    override func main() {
        for i in lowerBound..<upperBound{
            if i.isPrime(){
                output.append(i)
            }
        }
        
        self.state = .finished
    }
}

getPrimes(upTo: 10)
getPrimes(upTo: 11)
getPrimes(upTo: 12)

startClock()
getPrimesBySieveofEratosthenes(upTo: 400)
stopClock()

startClock()
getPrimes(upTo: 400)
stopClock()



/*
 •    The code challenge61(upTo: 10) should return 2, 3, 5, 7.  
 •    The code challenge61(upTo: 11) should return 2, 3, 5, 7; remember to exclude  the upper bound.  
 •    The code challenge61(upTo: 12) should return 2, 3, 5, 7, 11.
 */

