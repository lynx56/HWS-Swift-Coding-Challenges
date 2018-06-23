/*
 Challenge 21: Counting binary ones
 Difficulty: Tricky
 Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.
 */

import Foundation

extension Int{
    func nearestByOnes()->(lowest: Int?, highest: Int?){
        let binaryString = String(self, radix: 2)
        let ones = binaryString.filter({$0 == "1"}).count
        var lowest: Int? = nil
        var highest: Int? = nil
        
        for i in self + 1 ... Int.max{
            if equalOnes(val: i, ones){
                highest = i
                break
            }
        }
        
        for i in (0 ..< self).reversed(){
            if equalOnes(val: i, ones){
                lowest = i
                break
            }
        }
        
        return (lowest: lowest, highest: highest)
    }
    
    private func equalOnes(val:Int, _ ones: Int)->Bool{
        let currentBinary = String(val, radix: 2)
        
        if currentBinary.filter({$0 == "1"}).count == ones{
            return true
        }
        
        return false
    }
}

12.nearestByOnes()
28.nearestByOnes()

/*
 •    The number 12 is 1100 in binary, so it has two 1s. The next highest number with that many 1s is 17, which is 10001. The next lowest is 10, which is 1010.  
 •    The number 28 is 11100 in binary, so it has three 1s. The next highest number with that many 1s is 35, which is 100011. The next lowest is 26, which is 11010.
 */

