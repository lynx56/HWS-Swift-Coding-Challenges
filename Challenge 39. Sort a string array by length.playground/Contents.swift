/*
 Challenge 39: Sort a string array by length
 Difficulty: Easy Extend collections with a function that returns an array of strings sorted by their lengths,
 longest first.
 */

import Foundation

extension Array where Element == String{
    func sortByLength()->[Element]{
        return self.sorted(by: {$0.count > $1.count})
    }
}

["a", "abc", "ab"].sortByLength()
["paul", "taylor", "adele"].sortByLength()
[String]().sortByLength()

/*
 •    The code ["a", "abc", "ab"].challenge39() should return ["abc", "ab", "a"].  
 •    The code ["paul", "taylor", "adele"].challenge39() should return ["taylor", "adele", "paul"].  
 •    The code [String]().challenge39() should return [].
 */

