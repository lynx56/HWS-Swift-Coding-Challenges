/*
 Challenge 46: Recreate map()
 Difficulty: Tricky Write an extension for all collections that reimplements the map() method.
 */

import Foundation

extension Collection{
    func customMap<T>(_ transform: (Element) throws -> T) rethrows->[T]{
        var result = [T]()
        for element in self{
            result.append(try transform(element))
        }
        
        return result
    }
}

[1, 2, 3].customMap { String($0) }
["1", "2", "3"].customMap { Int($0)! }
/*
 •    The code [1, 2, 3].challenge46 { String($0) } should return [“1”, "2", "3"]  
 •    The code ["1", "2", "3"].challenge46 { Int($0)! } should return [1, 2, 3].
 */

