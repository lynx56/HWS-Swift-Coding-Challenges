/*
 Challenge 4: Does one string contain another?
 Difficulty: Easy Write your own version of the contains() method on String that ignores letter case, and
 without using the existing contains() method.
 */

import Foundation

extension String{
    func fuzzyContains(_ otherString: String)->Bool{
        return range(of: otherString, options: .caseInsensitive) != nil
    }
    
    func fuzzyContains2(_ otherString: String)->Bool{
       return self.uppercased().range(of: otherString.uppercased()) != nil
    }
}

"Hello, world".fuzzyContains("Hello")
"Hello, world".fuzzyContains("WORLD")
"Hello, world".fuzzyContains("Goodbye")

/*
 •    The code "Hello, world".fuzzyContains("Hello") should return true.  
 •    The code "Hello, world".fuzzyContains("WORLD") should return true.  
 •    The code "Hello, world".fuzzyContains("Goodbye") should return  false.  
*/

