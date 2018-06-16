/*
 Challenge 6: Remove duplicate letters from a string
 Difficulty: Easy Write a function that accepts a string as its input, and returns the same string just with
 duplicate letters removed.
 */

import Foundation

extension String{
    func removeDuplicates()->String{
        var result = ""
        for symbol in self{
            if !result.contains(symbol){
                result.append(symbol)
            }
        }
        
        return result
    }
    
    func removeDuplicates2()->String{
        let orderedSet = NSOrderedSet(array: Array(self))
        
        return String(orderedSet.array as! [Character])
    }
    
    func removeDuplicates3()->String{
        var used = [Character: Bool]()
        
        let result = self.filter { used.updateValue(true, forKey: $0) == nil }
        
        return String(result)
    }
}

"wombat".removeDuplicates()
"wombat".removeDuplicates2()
"wombat".removeDuplicates3()

"hello".removeDuplicates()
"hello".removeDuplicates2()
"hello".removeDuplicates3()

"Mississippi".removeDuplicates()
"Mississippi".removeDuplicates2()
"Mississippi".removeDuplicates3()

/*
 •    The string “wombat” should print “wombat”.  
 •    The string “hello” should print “helo”.  
 •    The string “Mississippi” should print “Misp”.
 */
