/*
 Challenge 18: Recreate the pow() function
 Difficulty: Easy Create a function that accepts positive two integers, and raises the first to the power of the
 second.
 */

import Foundation

extension Int{
    func pow(_ power: Int)->Int{
        guard power >= 0, self >= 0
            else { return 0 }
        
        if power == 0{
            return 1
        }
        
        return self*self.pow(power - 1)
    }
    
    func pow2(_ power: Int)->Int{
        guard power >= 0, self >= 0
            else { return 0 }
        
        var result = self
        for _ in 1..<power{
            result *= self
        }
        
        return result
    }
}

4.pow(3)
2.pow(8)
4.pow2(3)
2.pow2(8)

/*
 •    The inputs 4 and 3 should return 64, i.e. 4 multiplied by itself 3 times.  
 •    The inputs 2 and 8 should return 256, i.e. 2 multiplied by itself 8 times.
 */

