/*
 Challenge 7: Condense whitespace
 Difficulty: Easy Write a function that returns a string with any consecutive spaces replaced with a single space.
 */

import Foundation

extension String{
    func removeCondenseWhitespace()->String{
        return self.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    }
    
    func removeCondenseWhitespace2()->String{
        var seenWhitespace = false
        var result = ""
        for character in self{
            if character == " "{
                if seenWhitespace{
                    continue
                }
                seenWhitespace = true
            }else{
                seenWhitespace = false
            }
            result.append(character)
        }
        
        return result
    }
    
    func removeCondenseWhitespace3()->String{
        var result = self.split(separator: " ").filter { !$0.isEmpty }.joined(separator: " ")
        if self.first == " "{
            result = " " + result
        }
        if self.last == " "{
            result = result + " "
        }
        
        return result
    }
}

"a   b    c".removeCondenseWhitespace()
"a   b    c".removeCondenseWhitespace2()
"a   b    c".removeCondenseWhitespace3()

"    a".removeCondenseWhitespace()
"    a".removeCondenseWhitespace2()
"    a".removeCondenseWhitespace3()

"abc".removeCondenseWhitespace()
"abc".removeCondenseWhitespace2()
"abc".removeCondenseWhitespace3()
/*
 •    The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.  
 •    The string “[space][space][space][space]a” should return “[space]a”.  
 •    The string “abc” should return “abc”.
 */

