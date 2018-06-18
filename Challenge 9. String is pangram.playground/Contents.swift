/*
 Difficulty: Tricky Write a function that returns true if it is given a string that is an English pangram, ignoring
 letter case.
 */

import Foundation

extension String{
    func isPangram()->Bool{
        let filtered = Array(Set(self.lowercased())).filter{$0 >= "a" && $0 <= "z"}
        return filtered.count == 26
    }
}
"The quick brown fox jumps over the lazy dog".isPangram()
"The quick brown fox jumped over the lazy dog".isPangram()
/*
 •    The string “The quick brown fox jumps over the lazy dog” should return true.  
 •    The string “The quick brown fox jumped over the lazy dog” should return false,  because it’s missing the S.   
 */

