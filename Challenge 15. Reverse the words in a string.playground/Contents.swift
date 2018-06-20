/*
 Challenge 15: Reverse the words in a string
 Difficulty: Taxing Write a function that returns a string with each of its words reversed but in the original order,
 without using a loop.
 */

import Foundation

extension String{
    func reverseEachWord()->String{
        let words = self.components(separatedBy: .whitespaces)
        
        return String(words.map {$0.reversed()}.joined(separator: " "))
    }
}

"Swift Coding Challenges".reverseEachWord()
"The quick brown fox".reverseEachWord()

/*
 •    The string “Swift Coding Challenges” should return “tfiwS gnidoC segnellahC”.  
 •    The string “The quick brown fox” should return “ehT kciuq nworb xof”.
 */

