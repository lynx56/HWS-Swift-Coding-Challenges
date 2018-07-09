/*
 Challenge 47: Recreate min()
 Difficulty: Tricky Write an extension for all collections that reimplements the min() method.
 */

import Foundation

extension Collection where Element: Comparable{
    func customMin()->Element?{
        guard !self.isEmpty
            else { return nil }
        
        var min = self.first!
        
        for element in self{
            if element < min{
                min = element
            }
        }
        
        return min
    }
    
    func customMin2()->Element?{
        guard let first = self.first
            else { return nil }
        
        return reduce(first) { $1 < $0 ? $1 : $0 }
    }
    
    func customMin3()->Element?{
        var it = makeIterator()
        
        guard var min = it.next()
            else { return nil }
        
        while let current = it.next() {
            if current < min{
                min = current
            }
        }
        
        return min
    }
}

[1, 2, 3].customMin()
[1, 2, 3].customMin2()
[1, 2, 3].customMin3()
["q", "f", "k"].customMin()
["q", "f", "k"].customMin2()
["q", "f", "k"].customMin3()
[4096, 256, 16].customMin()
[4096, 256, 16].customMin2()
[4096, 256, 16].customMin3()
[String]().customMin()
[String]().customMin2()
[String]().customMin3()
/*
 •    The code [1, 2, 3].challenge47() should return 1.  
 •    The code ["q", "f", "k"].challenge47() should return “f”.  
 •    The code [4096, 256, 16].challenge47() should return 16.  
 •    The code [String]().challenge47() should return nil.
 */

