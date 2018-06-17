/*
 Challenge 8: String is rotated
 Difficulty: Tricky Write a function that accepts two strings, and returns true if one string is rotation of the other,
 taking letter case into account.
 */

import Foundation

extension String{
    func isRotated(by otherString: String)->Bool{
        guard self.count == otherString.count else { return false }
        
        return (self + self).contains(otherString)
    }
}


"abcde".isRotated(by: "eabcd")
"abcde".isRotated(by: "cdeab")
"abcde".isRotated(by: "abced")
"abc".isRotated(by: "a")

/*
 •    The string “abcde” and “eabcd” should return true.  
 •    The string “abcde” and “cdeab” should return true.  
 •    The string “abcde” and “abced” should return false; this is not a string rotation.  
 •    The string “abc” and “a” should return false; this is not a string rotation.  
 */

