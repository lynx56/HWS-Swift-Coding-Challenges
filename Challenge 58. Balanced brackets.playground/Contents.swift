/*
 Challenge 58: Balanced brackets
 Difficulty: Easy
 Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.
 */

import Foundation

extension String{
    func isBalancedBrackets()->Bool{
        let restrictedSymbols = CharacterSet(charactersIn: "([{<>}])").inverted
        guard self.rangeOfCharacter(from: restrictedSymbols) == nil
        else { return false }
        
        let openedBracketsPairs:[Character : Character] = ["(" : ")", "[" : "]", "{" : "}", "<" : ">"]
      
        let stack = Stack<Character>()
        for character in self{
            if openedBracketsPairs.keys.contains(character){
                stack.push(value: character)
            }else{
                if stack.isEmpty || openedBracketsPairs[stack.pop()!] != character{
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

class Stack<T>{
    private var array = [T]()
    
    var isEmpty: Bool{
        return array.isEmpty
    }
    
    func push(value: T){
        self.array.append(value)
    }
    
    func pop()->T?{
        guard array.count > 0
            else { return nil }
        let result = array[array.count - 1]
        array.remove(at: array.count - 1)
        return result
    }
}

"()".isBalancedBrackets()
"([])".isBalancedBrackets()
"([])(<{}>)".isBalancedBrackets()
"".isBalancedBrackets()

"}{".isBalancedBrackets()
"([)]".isBalancedBrackets()
"([)]".isBalancedBrackets()
"([)".isBalancedBrackets()
"([".isBalancedBrackets()
"[<<<{}>>]".isBalancedBrackets()
"hello".isBalancedBrackets()

/*
 Sample input and output
 •    The string “()” should return true.  
 •    The string “([])” should return true.  
 •    The string “([])(<{}>)” should return true.  
 •    The string “([]{}<[{}]>)” should return true.  
 •    The string “” should return true.  
 •    The string “}{” should return false.  
 •    The string “([)]” should return false.  
 •    The string “([)” should return false.  
 •    The string “([” should return false.  
 •    The string “[<<<{}>>]” should return false.  
 •    The string “hello” should return false.  
 */

