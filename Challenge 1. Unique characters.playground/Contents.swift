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

