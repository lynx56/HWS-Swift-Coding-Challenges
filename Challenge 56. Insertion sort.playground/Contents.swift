/*
 Challenge 56: Insertion sort
 Difficulty: Easy Create an extension for arrays that sorts them using the insertion sort algorithm.
 */

import Foundation

extension Array where Element: Comparable{
    func insertionSort()->[Element]{
        guard count > 1 else { return self }
        var result = self
        for i in 1..<result.count{
            var currentIndex = i
            let currentItem = result[i]
            
            while currentIndex > 0 && currentItem < result[currentIndex-1]{
                result[currentIndex] = result[currentIndex - 1]
                currentIndex -= 1
            }
            
            result[currentIndex] = currentItem
        }
        
        return result
    }
    
    func insertionSort2()->[Element]{
        guard count > 1 else { return self }
        var result = [Element]()
        
         for unsorted in self{
            if result.count == 0{
                result.append(unsorted)
            }else{
                var placed = false
                for (idx, val) in result.enumerated(){
                    if unsorted < val{
                        result.insert(unsorted, at: idx)
                        placed = true
                        break
                    }
                }
                
                if !placed{
                    result.append(unsorted)
                }
            }
        }
        
        return result
    }
}

[12, 5, 4, 9, 3, 2, 1].insertionSort()
[12, 5, 4, 9, 3, 2, 1].insertionSort2()
["f", "a", "b"].insertionSort()
["f", "a", "b"].insertionSort2()
[String]().insertionSort()
[String]().insertionSort2()
/*
 •    The array[12, 5, 4, 9, 3, 2, 1]should become[1, 2, 3, 4, 5, 9, 12].  
 •    The array ["f", "a", "b"] should become ["a", "b", "f"].  
 •    The array [String]() should become [].
 */

