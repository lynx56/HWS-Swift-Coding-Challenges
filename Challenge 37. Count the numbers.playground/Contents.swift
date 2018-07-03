/*
 Challenge 37: Count the numbers
 Difficulty: Easy Write an extension for collections of integers that returns the number of times a specific digit
 appears in any of its numbers.
 */

import Foundation

extension Array where Element == Int{
    func count(number: Character)->Int{
        return self.reduce("") { $0 + String($1)}.filter{ $0 == number }.count
    }
    
    func count2(number: Character)->Int{
        var total = 0
        for item in self{
            let str = String(item)
            
            total += str.filter({$0 == number}).count
        }
        
        return total
    }
}

[5, 15, 55, 515].count(number: "5")
[5, 15, 55, 515].count2(number: "5")

[5, 15, 55, 515].count(number: "1")
[5, 15, 55, 515].count2(number: "1")

[55555].count(number: "5")
[55555].count2(number: "5")

[55555].count(number: "1")
[55555].count2(number: "1")
/*
 •    The code [5, 15, 55, 515].challenge37(count: "5") should return 6.  
 •    The code [5, 15, 55, 515].challenge37(count: "1") should return 2.  
 •    The code [55555].challenge37(count: "5") should return 5.  
 •    The code [55555].challenge37(count: "1") should return 0.
 */

