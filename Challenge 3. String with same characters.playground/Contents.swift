import Foundation

extension String{
    func containsSameCharacters(where otherString: String)->Bool{
        return self.count == otherString.count && self.sorted() == otherString.sorted()
    }
    
    func containsSameCharacters2(where otherString: String)->Bool{
        var mutableSelf = self
        for symbol in otherString{
            if let idx = mutableSelf.index(of: symbol){
                mutableSelf.remove(at: idx)
            }else{
                return false
            }
        }
        
        return mutableSelf.isEmpty
    }
}

"abca".containsSameCharacters(where: "abca")
"abc".containsSameCharacters(where: "cba")
" a1 b2 ".containsSameCharacters(where: "b 1 a 2")
"abc".containsSameCharacters(where: "abca")
"abc".containsSameCharacters(where: "Abc")
"abc".containsSameCharacters(where: "cbAa")

"abca".containsSameCharacters2(where: "abca")
"abc".containsSameCharacters2(where: "cba")
" a1 b2 ".containsSameCharacters2(where: "b 1 a 2")
"abc".containsSameCharacters2(where: "abca")
"abc".containsSameCharacters2(where: "Abc")
"abc".containsSameCharacters2(where: "cbAa")

/*
The strings “abca” and “abca” should return true.  
The strings “abc” and “cba” should return true.  
The strings “ a1 b2 ” and “b 1 a 2” should return true.  
The strings “abc” and “abca” should return false.  
The strings “abc” and “Abc” should return false.  
The strings “abc” and “cbAa” should return false.  
*/

