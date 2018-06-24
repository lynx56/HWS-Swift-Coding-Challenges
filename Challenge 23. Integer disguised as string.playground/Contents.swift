/*
 Challenge 23: Integer disguised as string
 Difficulty: Tricky Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits
 0 through 9.
 */

import Foundation

extension String{
    func containsNumbers()->Bool{
        let nonNumericSet = CharacterSet.decimalDigits.inverted
    
        return self.rangeOfCharacter(from: nonNumericSet) == nil
    }
    
    //restricted by Int length
    func containsNumbers2()->Bool{
       return Int64(self) != nil
    }
    
    //restricted
    func containsNumbers3()->Bool{
        for character in self{
            if Int(String(character)) == nil{
                return false
            }
        }
        
        return true
    }
}

"01010101".containsNumbers()
"01010101".containsNumbers2()
"01010101".containsNumbers3()

"123456789".containsNumbers()
"123456789".containsNumbers2()
"123456789".containsNumbers3()

"9223372036854775808".containsNumbers()
"9223372036854775808".containsNumbers2()
"9223372036854775808".containsNumbers3()

"1.01".containsNumbers()
"1.01".containsNumbers2()
"1.01".containsNumbers3()

/*
 •    The input “01010101” should return true.  
 •    The input “123456789” should return true.  
 •    The letter “9223372036854775808” should return true.  
 •    The letter “1.01” should return false; “.” is not a number.
 */

