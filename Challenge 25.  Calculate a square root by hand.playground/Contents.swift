/*
 Challenge 25: Calculate a square root by hand
 Difficulty: Taxing Write a function that returns the square root of a positive integer, rounded down to the nearest
 integer, without using sqrt().
 */

import Foundation

extension Int{
    
    func sqrtByHandle()->Int{
        guard self != 1 else { return 1 }
        var lower = 0
        var upper = (1 + self)/2
     
        while lower + 1 < upper{
            let mid = lower + ((upper - lower) / 2)
            let sqrMid = mid * mid
            
            if sqrMid == self{
                return mid
            }else if sqrMid < self{
                lower = mid
            }else{
                upper = mid
            }
        }
        
        return lower
    }
    
    func sqrtByHandle2()->Int{
        
        for i in 0...self/2{
            if i * i > self{
                return i - 1
            }
        }
        
        return 0
    }
}

9.sqrtByHandle()
9.sqrtByHandle2()

16777216.sqrtByHandle()
16777216.sqrtByHandle2()

16.sqrtByHandle()
16.sqrtByHandle2()

15.sqrtByHandle()
15.sqrtByHandle2()

/*
 •    The number 9 should return 3.  
 •    The number 16777216 should return 4096.  
 •    The number 16 should return 4.  
 •    The number 15 should return 3.
 */

