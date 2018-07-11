/*
 Challenge 40: Missing numbers in array
 Difficulty: Easy Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more
 numbers might be missing, and returns an array of the missing numbers.
 */

import Foundation

extension Array where Element == Int{
    func missingNumbers()->[Element]{
        var allNumbers = Set(1...100)
        allNumbers.subtract(self)
        
        return Array(allNumbers)
    }
    
    func missingNumbers2()->[Element]{
        let allNumbers = Array(1...100)
        let set = Set(self)
        
        var result = [Int]()
        
        for number in allNumbers{
            if !set.contains(number){
                result.append(number)
            }
        }
        
        return result
    }
    
    func missingNumber()->Element{
        let sum = self.reduce(0, +)
        let upperBound = self.max()!
        let lowerBound = self.min()!
        
        //Gausse sum [(N * (N + 1)) / 2] - [(M * (M - 1)) / 2]
        let upperLimitSum = (upperBound*(upperBound + 1)) / 2
        let lowerLimitSum = (lowerBound*(lowerBound - 1)) / 2
        
        return (upperLimitSum - lowerLimitSum) - sum
    }
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.missingNumber()
testArray.remove(at: 20)
testArray.remove(at: 6)

testArray.missingNumbers()
testArray.missingNumbers2()

/*
 If your test array were created like this:
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 
 Then your method should [7, 21, 26], because those are the numbers missing from the array.
 */

