/*
 Challenge 24: Add numbers inside a string
 Difficulty: Tricky Given a string that contains both letters and numbers, write a function that pulls out all the
 numbers then returns their sum.
 */

import Foundation

extension String{
    func sum()->Int{
        let regex = try! NSRegularExpression(pattern: "(\\d+)", options: .caseInsensitive)
        
        let matches = regex.matches(in: self, options: .init(rawValue: 0), range: NSRange(location: 0, length: utf16.count))
        
        let numbers = matches.compactMap({ Int((self as NSString).substring(with: $0.range))! })
        
        return numbers.reduce(0, +)
    }
    
    func sum2()->Int{
        var currentNumber = ""
        var sum = 0
        
        for character in self{
             if Int(String.init(character)) != nil{
                currentNumber.append(character)
            }else{
                sum += Int(currentNumber) ?? 0
                currentNumber = ""
            }
        }
        
        sum += Int(currentNumber) ?? 0
        
        return sum
    }
}

"a1b2c3".sum()
"a1b2c3".sum2()
"a10b20c30".sum()
"a10b20c30".sum2()
"h8ers".sum()
"h8ers".sum2()
/*
 •    The string “a1b2c3” should return 6 (1 + 2 + 3).  
 •    The string “a10b20c30” should return 60 (10 + 20 + 30).  
 •    The string “h8ers” should return “8”.
 */

