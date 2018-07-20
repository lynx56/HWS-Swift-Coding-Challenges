/*
 Challenge 50: Count the largest range
 Difficulty: Tricky
 Write a function that accepts an array of positive and negative numbers and returns a closed range containing the position of the contiguous positive numbers that sum to the highest value, or nil if nothing were found.
 */

import Foundation

extension Array where Element == Int{
    func largestRange()->CountableClosedRange<Int>?{
        var bestRange: CountableClosedRange<Int>?
        var bestSum = 0
        
        var currentStart: Int?
        var currentSum = 0
        for (index, number) in self.enumerated(){
            if number > 0{
                currentStart = currentStart ?? index
                currentSum += number
                
                if currentSum > bestSum{
                    bestRange = currentStart! ... index
                    bestSum = currentSum
                }
            }else{
                currentSum = 0
                currentStart = nil
            }
        }
        
        return bestRange
    }
}

[0, 1, 1, -1, 2, 3, 1].largestRange() == 4...6
[10, 20, 30, -10, -20, 10, 20].largestRange() == 0...2
[1, -1, 2, -1].largestRange() == 2...2
[2, 0, 2, 0, 2].largestRange() == 0...0
[Int]().largestRange() == nil
/*
 •    The array [0, 1, 1, -1, 2, 3, 1] should return 4...6 because the highest sum of contiguous positive numbers is 2 + 3 + 1, which lie at positions 4, 5, and 6 in the array.  
 •    The array [10, 20, 30, -10, -20, 10, 20] should return 0...2.  
 •    The array [1, -1, 2, -1] should return 2...2.  
 •    The array [2, 0, 2, 0, 2] should return 0...0.  
 •    The array [Int]() should return nil.
 */

