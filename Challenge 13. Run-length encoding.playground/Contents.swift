/*
 Challenge 13: Run-length encoding
 Difficulty: Taxing Write a function that accepts a string as input, then returns how often each letter is repeated in
 a single run, taking case into account.
 */

import Foundation

extension String{
    func runLengthEncoding()->String{
        var result = ""
        
        var currentCharacter = self.first!
        var count = 1
        
        for character in self.dropFirst(){
            if character == currentCharacter{
                count += 1
            }else{
                result.append("\(currentCharacter)\(count)")
                currentCharacter = character
                count = 1
            }
        }
        
        result.append("\(currentCharacter)\(count)")
        
        return result
    }
    
    func runLengthEncoding2()->String{
        var result = ""
        
        var letterCounter = 0
        var array = Array(self)
        
        for i in 0..<array.count{
            letterCounter += 1
            if i + 1 == array.count || array[i] != array [i + 1]{
                result.append("\(array[i])\(letterCounter)")
                letterCounter = 0
            }
        }
        
        return result
    }
}

"aabbcc".runLengthEncoding()
"aabbcc".runLengthEncoding2()
"aaabaaabaaa".runLengthEncoding()
"aaabaaabaaa".runLengthEncoding2()
"aaAAaa".runLengthEncoding()
"aaAAaa".runLengthEncoding2()
/*
 •    The string “aabbcc” should return “a2b2c2”.  
 •    The strings “aaabaaabaaa” should return “a3b1a3b1a3”  
 •    The string “aaAAaa” should return “a2A2a2”
 */

