/*
 Challenge 42: Recreate index(of:)
 Difficulty: Easy Write an extension for all collections that reimplements the index(of:) method.
 Tip: This is one of the easiest standard library methods to reimplement, so please give it an especially good try before reading any hints.
 */

import Foundation

extension Array where Element == Int{
    func customIndex(of element: Int) -> Int? {
        for (index, val) in self.enumerated(){
            if val == element{
                return index
            }
        }
        
        return nil
    }
}

[1, 2, 3].customIndex(of: 1)
[1, 2, 3].customIndex(of: 3)
[1, 2, 3].customIndex(of: 5)

/*
 •    The code [1, 2, 3].challenge42(indexOf: 1) should return 0.  
 •    The code [1, 2, 3].challenge42(indexOf: 3) should return 2.  
 •    The code [1, 2, 3].challenge42(indexOf: 5) should return nil.
 */

