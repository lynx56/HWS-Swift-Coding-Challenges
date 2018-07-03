/*
 Challenge 38: Find N smallest
 Difficulty: Easy Write an extension for all collections that returns the N smallest elements as an array, sorted
 smallest first, where N is an integer parameter.
 */

import Foundation

extension Collection where Element: Comparable{
    func smallest(n: Int)->[Element]{
        return Array(self.sorted().prefix(n))
    }
}

[1, 2, 3, 4].smallest(n: 3)
["q", "f", "k"].smallest(n: 10)
[256, 16].smallest(n: 3)
[String]().smallest(n: 3)

/*
 •    The code [1, 2, 3, 4].challenge38(count: 3) should return [1, 2, 3].  
 •    The code ["q", "f", "k"].challenge38(count: 10) should return [“f”,  “k”, “q”].  
 •    The code [256, 16].challenge38(count: 3) should return [16, 256].  
 •    The code [String]().challenge38(count: 3) should return an empty
 */

