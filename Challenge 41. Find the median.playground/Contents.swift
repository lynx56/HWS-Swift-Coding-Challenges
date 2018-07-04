/*
 Challenge 41: Find the median
 Difficulty: Easy Write an extension to collections that accepts an array of Int and returns the median average,
 or nil if there are no values.
 */

import Foundation

extension Array where Element == Int{
    func median()->Double?{
        guard !self.isEmpty
            else { return nil }
        let middle = self.count/2
        let sorted = self.sorted()
        
        if self.count%2 == 0{
            return Double(sorted[middle - 1] + sorted[middle])/2.0
        }else{
            return Double(sorted[middle])
        }
    }
}

[1, 2, 3].median()
[1, 2, 9].median()
[1, 3, 5, 7, 9].median()
[1, 2, 3, 4].median()
[Int]().median()

/*
 •    The code [1, 2, 3].challenge41() should return 2.  
 •    The code [1, 2, 9].challenge41() should return 2.  
 •    The code [1, 3, 5, 7, 9].challenge41() should return 5.  
 •    The code [1, 2, 3, 4].challenge41() should return 2.5.  
 •    The code [Int]().challenge41() should return nil.
 */

