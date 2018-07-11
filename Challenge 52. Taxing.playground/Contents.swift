/*
 Difficulty: Taxing Write one function that sums an array of numbers. The array might contain all integers, all
 doubles, or all floats.
 */

import Foundation
import Accelerate

extension Array where Element: Numeric{
    func sum()->Element{
        return self.reduce(0, +)
    }
}

func sumDouble(numbers: [Double]) -> Double {
    var result: Double = 0.0
    vDSP_sveD(numbers, 1, &result, vDSP_Length(numbers.count))
    return result
}

[1, 2, 3].sum()
[1.0, 2.0, 3.0].sum()
Array<Float>([1.0, 2.0, 3.0]).sum()
/*
 •    The code challenge52(numbers: [1, 2, 3]) should return 6.  
 •    The code challenge52(numbers: [1.0, 2.0, 3.0]) should return 6.0.  
 •    The code challenge52(numbers: Array<Float>([1.0, 2.0, 3.0]))
 */

