import Foundation

extension String{
    func isPalindrome()->Bool{
        guard !self.isEmpty
            else { return true }
        
        return  self.caseInsensitiveCompare(String(self.reversed())) == .orderedSame
    }
    
    func isPalindrome2()->Bool{
        guard !self.isEmpty
            else { return true }
        
        let characters = Array(self.uppercased())
        for i in 0..<characters.count/2{
            if characters[i] != characters[self.count - i - 1]{
                return false
            }
        }
        
        return true
    }
}

"rotator".isPalindrome()
"Rats live on no evil star".isPalindrome()
"Never odd or even".isPalindrome()


"rotator".isPalindrome2()
"Rats live on no evil star".isPalindrome2()
"Never odd or even".isPalindrome2()


