/*
 Challenge 5: Count the characters
 Difficulty: Easy Write a function that accepts a string, and returns how many times a specific character appears,
 taking case into account.
 */

import Foundation

extension String{
    func count(of character: Character)->Int{
        return self.filter{$0 == character}.count
    }
    
    func count2(of character: Character)->Int{
        return self.reduce(0) { $1 == character ? $0 + 1 : $0 }
    }
    
    func count3(of character: Character)->Int{
        let array = Array(self)
        let countedSet = NSCountedSet(array: array)
        
        return countedSet.count(for: character)
    }
    
    func count4(of character: Character)->Int{
        let stringWithoutSpecificCharacter = self.replacingOccurrences(of: String(character), with: "")
        return self.count - stringWithoutSpecificCharacter.count
    }
}

"The rain in Spain".count(of: "a")
"The rain in Spain".count2(of: "a")
"The rain in Spain".count3(of: "a")
"The rain in Spain".count4(of: "a")

"Mississippi".count(of: "i")
"Mississippi".count2(of: "i")
"Mississippi".count3(of: "i")
"Mississippi".count4(of: "i")

"Hacking with Swift".count(of: "i")
"Hacking with Swift".count2(of: "i")
"Hacking with Swift".count3(of: "i")
"Hacking with Swift".count4(of: "i")

/*
 •    The letter “a” appears twice in “The rain in Spain”.  
 •    The letter “i” appears four times in “Mississippi”.  
 •    The letter “i” appears three times in “Hacking with Swift”.
 */
