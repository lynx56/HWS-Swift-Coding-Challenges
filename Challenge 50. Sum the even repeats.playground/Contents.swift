/*
 Challenge 49: Sum the even repeats
 Difficulty: Tricky Write a function that accepts a variadic array of integers and return the sum of all numbers that
 appear an even number of times.
 */

import Foundation

extension Array where Element == Int{
    func sumEvenTimes()->Int{
        let set = NSCountedSet(array: self)
        var sum = 0
        for case let item as Int in set{
            if set.count(for: item)%2 == 0{
                sum += item
            }
        }
        
        return sum
    }
}

[1, 2, 2, 3, 3, 4].sumEvenTimes()
[5, 5, 5, 12, 12].sumEvenTimes()
[1, 1, 2, 2, 3, 3, 4, 4].sumEvenTimes()

/*
 •    The code challenge49(1, 2, 2, 3, 3, 4) should return 5, because the numbers 2 and 3 appear twice each.  
 •    The code challenge49(5, 5, 5, 12, 12) should return 12, because that’s the only number that appears an even number of times.  
 •    The code challenge49(1, 1, 2, 2, 3, 3, 4, 4)` should return 10.
 */

