/*
 Challenge 12: Find longest prefix
 Difficulty: Tricky Write a function that accepts a string of words with a similar prefix, separated by spaces, and
 returns the longest substring that prefixes all words.
 */

import Foundation

extension String{
    func commonPrefix()->String{
        let array = self.components(separatedBy: .whitespaces)
        guard !array.isEmpty else { return "" }
        
        var betterPrefix = ""
        var currentPrefix = ""
        
        for character in array.first!{
            currentPrefix.append(character)
            
            for word in array{
                if !word.hasPrefix(currentPrefix){
                    return betterPrefix
                }
            }
            
            betterPrefix = currentPrefix
        }
        
        return betterPrefix
    }
}

"swift switch swill swim".commonPrefix()
"flip flap flop".commonPrefix()

/*
 •    The string “swift switch swill swim” should return “swi”.  
 •    The string “flip flap flop” should return “fl”.
 */

