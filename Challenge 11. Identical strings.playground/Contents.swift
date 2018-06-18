/*
 Challenge 11: Three different letters
 Difficulty: Tricky Write a function that accepts two strings, and returns true if they are identical in length but
 have no more than three different letters, taking case and string order into account.
 */

import Foundation

extension String{
    func isSimilar(to otherString: String)->Bool{
        guard self.count == otherString.count else { return false }
        var difference = 0
        var otherStringCharacters = Array(otherString.lowercased())
        
        for (index, character) in self.lowercased().enumerated(){
            if character != otherStringCharacters[index]{
                difference += 1
                if difference > 3{
                    return false
                }
            }
        }
        
        return true
    }
}

"Clamp".isSimilar(to: "Cramp")
"Clamp".isSimilar(to: "Crams")
"Clamp".isSimilar(to: "Grams")
"Clamp".isSimilar(to: "Grans")
"Clamp".isSimilar(to: "Clam")
"clamp".isSimilar(to: "maple")

/*
 •    The strings “Clamp” and “Cramp” would return true, because there is one letter difference.  
 •    The strings “Clamp” and “Crams” would return true, because there are two letter differences.  
 •    The strings “Clamp” and “Grams” would return true, because there are three letter differences.  
 •    The strings “Clamp” and “Grans” would return false, because there are four letter differences.  
 •    The strings “Clamp” and “Clam” would return false, because they are different lengths.  
 •    The strings “clamp” and “maple” should return false. Although they differ by only one
 */

