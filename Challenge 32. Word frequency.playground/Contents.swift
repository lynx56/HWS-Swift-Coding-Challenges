/*
 Challenge 32: Word frequency
 Difficulty: Tricky
 Write a function that accepts a filename on disk, loads it into a string, then returns the frequency of a word in that string, taking letter case into account. How you define “word” is worth considering carefully.
 */

import Foundation
import PlaygroundSupport

func countWords(in file: URL, word: String)->Int{
    if let content = try? String(contentsOfFile: file.path){
        var nonletters = CharacterSet.letters.inverted
        nonletters.remove("'")
        let words = Array(content.components(separatedBy: nonletters))
        return words.filter{ $0.lowercased() == word.lowercased() }.count
      //  let wordSet = NSCountedSet()
      //  wordSet.addObjects(from: words)
       // return wordSet.count(for: word)
    }
    
    return 0
}

let source = playgroundSharedDataDirectory.appendingPathComponent("sample.txt")
countWords(in: source, word: "Unknown")

/*
 •    A file containing “Hello, world!” should return 1 for “Hello”  
 •    A file containing “Hello, world!” should return 0 for “Hello,” – note the comma at the  end.  
 •    A file containing “The rain in Spain falls mainly on the plain” should return 1 for  Spain, and 1 for “in”; the “in” inside rain, Spain, mainly, and plain does not count  because it’s not a word by itself.  
 •    A file containing “I’m a great coder” should return 1 for “I’m”.  
*/

