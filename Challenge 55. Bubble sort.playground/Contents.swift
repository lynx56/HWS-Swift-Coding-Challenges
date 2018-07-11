/*
 Challenge 55: Bubble sort
 Difficulty: Easy Create an extension for arrays that sorts them using the bubble sort algorithm.
 */

import Foundation

extension Array where Element: Comparable{
    func bubbleSort()->[Element]{
        var result = self
        for i in 0..<result.count{
            for j in i..<result.count{
                if result[j] < result[i]{
                    result.swapAt(i, j)
                }
            }
        }
        
        return result
    }
}

[12, 5, 4, 9, 3, 2, 1].bubbleSort()
["f", "a", "b"].bubbleSort()
[String]().bubbleSort()
/*
 The following values should create balanced trees:
 •    The array[12, 5, 4, 9, 3, 2, 1]should become[1, 2, 3, 4, 5, 9, 12].  
 •    The array ["f", "a", "b"] should become ["a", "b", "f"].  
 •    The array [String]() should become [].
 */

