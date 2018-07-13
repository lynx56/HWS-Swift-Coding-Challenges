/*
 Challenge 57: Isomorphic values
 Difficulty: Easy Write a function that accepts two values and returns true if they are isomorphic. That is, each
 part of the value must map to precisely one other, but that might be itself.
 */

import Foundation

func isIsomorthic<T: CustomStringConvertible>(one: T, second: T)->Bool{
    guard one.description.count == second.description.count
        else { return false }
    var mapping = [Character: Character]()
    let secondArray = Array(second.description)
  
    for (index, value) in Array(one.description).enumerated(){
        let characterInSecondArray = secondArray[index]
    
        if let existingMap = mapping[value]{
            if existingMap != characterInSecondArray{
                return false
            }
        }else{
            if mapping.values.contains(characterInSecondArray){
                return false
            }
            
            mapping[value] = characterInSecondArray
        }
    }
    
    return true
}

isIsomorthic(one: "clap", second: "slap")
isIsomorthic(one: "rum", second: "mud")
isIsomorthic(one: "pip", second: "did")
isIsomorthic(one: "carry", second: "baddy")
isIsomorthic(one: "cream", second: "lapse")
isIsomorthic(one: 123123, second: 456456)
isIsomorthic(one: 3.14159, second: 2.03048)
isIsomorthic(one: [1, 2, 1, 2, 3], second: [4, 5, 4, 5, 6])

isIsomorthic(one: "carry", second: "daddy")
isIsomorthic(one: "did", second: "cad")
isIsomorthic(one: "maim", second: "same")
isIsomorthic(one: "curry", second: "flurry")
isIsomorthic(one: 112233, second: 112211)
/*
 These are all isomorphic values:
 •    “clap” and “slap”  
 •    “rum” and “mud”  
 •    “pip” and “did”  
 •    “carry” and “baddy”  
 •    “cream” and “lapse”  
 •    123123 and 456456  
 •    3.14159 and 2.03048  
 •    [1, 2, 1, 2, 3] and [4, 5, 4, 5, 6]  These are not isomorphic values:  
 •    “carry” and “daddy” – the Rs have become D, but C has also become D.  
 •    “did” and “cad” – the first D has become C, but the second has remained D.  
 •    “maim” and “same” – the first M has become S, but the second has become E.  
 •    “curry” and “flurry” – the strings have different lengths.  
 •    112233 and 112211 – the number 1 is being mapped to 1, and the number 3 is also  being mapped to 1.
 */

