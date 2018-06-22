/*
 Challenge 20: Number is prime
 Difficulty: Tricky Write a function that accepts an integer as its parameter and returns true if the number is prime.
 Tip: A number is considered prime if it is greater than one and has no positive divisors other than 1 and itself.
 */

import Foundation

extension Int{
    func isPrime()->Bool{
        guard self > 1 else { return false }
        
        for i in 2..<self{
            if self % i == 0{
                return false
            }
        }
        
        return true
    }
    
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
}

11.isPrime()
11.isPrime2()
13.isPrime()
13.isPrime2()
4.isPrime()
4.isPrime2()
9.isPrime()
9.isPrime2()
16777259.isPrime()
16777259.isPrime2()

/*
 •    The number 11 should return true.  
 •    The number 13 should return true.  
 •    The number 4 should return false.  
 •    The number 9 should return false.  
 •    The number 16777259 should return true.
 */

