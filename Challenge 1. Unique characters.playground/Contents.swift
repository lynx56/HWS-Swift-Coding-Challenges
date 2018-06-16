/*
 Challenge 1: Are the letters unique?
 Difficulty: Easy Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account. 
 */
extension String{
    func isContainsUniqSymbols()->Bool{
        guard !self.isEmpty
            else { return true }
        
        var checkedCharacters = [Character]()

        for symbol in self{
            if checkedCharacters.contains(symbol){
                return false
            }
            checkedCharacters.append(symbol)
        }
        
        return true
    }
    
    func isContainsUniqSymbols2()->Bool{
        return Set(self).count == self.count
    }
}

"No duplicates".isContainsUniqSymbols()  //should return true
"abcdefghijklmnopqrstuvwxyz".isContainsUniqSymbols() //should return true
"AaBbCc".isContainsUniqSymbols() // should return true
"Hello, world".isContainsUniqSymbols() //should return false

"No duplicates".isContainsUniqSymbols2()
"abcdefghijklmnopqrstuvwxyz".isContainsUniqSymbols2()
"AaBbCc".isContainsUniqSymbols2()
"Hello, world".isContainsUniqSymbols2()

