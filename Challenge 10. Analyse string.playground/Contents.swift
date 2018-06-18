/*
 Challenge 10: Vowels and consonants
 Difficulty: Tricky Given a string in English, return a tuple containing the number of vowels and consonants.
 */

import Foundation

extension String{
    func analyse()->(vowels: Int, consonants: Int){
        var result = (vowels: 0, consonants: 0)
        let vowels = "aeiouy"
        let letters = self.replacingOccurrences(of: "[^A-Za-z]", with: "", options: .regularExpression)
        for letter in letters{
            if vowels.contains(letter){
                result.vowels += 1
            }else{
                result.consonants += 1
            }
        }
        return result
    }
    
    func analyse2()->(vowels: Int, consonants: Int){
        var result = (vowels: 0, consonants: 0)
        let vowels = "aeiouy"
        let consonants = "bcdfghjklmnpqrstvwxyz"

        for character in self.lowercased(){
            if vowels.contains(character){
                result.vowels += 1
            }else if consonants.contains(character){
                result.consonants += 1
            }
        }
        return result
    }
}

"Swift Coding Challenges".analyse()
"Swift Coding Challenges".analyse2()
"Mississippi".analyse()
"Mississippi".analyse2()

/*
 •    The input “Swift Coding Challenges” should return 6 vowels and 15 consonants.  
 •    The input “Mississippi” should return 4 vowels and 7 consonants.
 */

