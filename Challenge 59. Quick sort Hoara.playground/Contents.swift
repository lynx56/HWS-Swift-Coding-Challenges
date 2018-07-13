/*
 Challenge 59: Quicksort
 Difficulty: Tricky
 Create an extension for arrays that sorts them using the quicksort algorithm.
 */

import Foundation

extension Array where Element: Comparable{
    func quickSort()->[Element]{
        guard self.count > 0
            else { return self }
        
        var sortingArray = self
        
        quickSort(array: &sortingArray, lo: 0, hi: sortingArray.count - 1)
        
        return sortingArray
    }
    
    private func quickSort(array: inout [Element], lo: Int, hi: Int){
        if lo < hi{
        let part = partition(array: &array, lo: lo, hi: hi)
        
        quickSort(array: &array, lo: lo, hi: part)
        quickSort(array: &array, lo: part + 1, hi: hi)
        }
    }
    
    private func partition(array: inout [Element], lo: Int, hi: Int)->Int{
        let p = array[lo]
        var i = lo - 1
        var j = hi + 1
        
        while(true){
            repeat{
                i += 1
            }
            while array[i] < p
            
            repeat{
                j -= 1
            }
            while array[j] > p
            
            if i >= j{
                return j
            }
            
            array.swapAt(i, j)
        }
    }
}

[12, 5, 4, 9, 3, 2, 1].quickSort()
 ["f", "a", "b"].quickSort()
[String]().quickSort()

/*
 Sample input and output
 •    The array[12, 5, 4, 9, 3, 2, 1]should become[1, 2, 3, 4, 5, 9, 12].  
 •    The array ["f", "a", "b"] should become ["a", "b", "f"].  
 •    The array [String]() should become [].
 */

