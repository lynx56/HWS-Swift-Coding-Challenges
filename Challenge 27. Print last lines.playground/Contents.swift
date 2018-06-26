/*
 Challenge 27: Print last lines
 Difficulty: Easy Write a function that accepts a filename on disk, then prints its last N lines in reverse order, all
 on a single line separated by commas.
 */

import Foundation

func printLastLines(_ count: Int, from fileName: String){
    let file = Bundle.main.path(forResource: fileName, ofType: nil)!
    
    if let contents = try? String(contentsOfFile: file, encoding: .utf8){
    
        let lines = Array(contents.components(separatedBy: CharacterSet.newlines).filter{!$0.isEmpty}.reversed())
        let countLines = min(count, lines.count)
        
        for i in 0..<countLines{
            print(lines[i])
        }
    }else{
        print("Can't read file")
    }
}

printLastLines(3, from: "sampleInput.txt")
print("********************")
printLastLines(100, from: "sampleInput.txt")
print("********************")
printLastLines(0, from: "sampleInput.txt")
print("********************")

/*
 Sample input and output
 Here is your test input file:
 Antony And Cleopatra
 Coriolanus
 Cymbeline
 Hamlet
 Julius Caesar
 King Lear
 Macbeth
 Othello
 Twelfth Night
 
 •    If asked to print the last 3 lines, your code should output “Twelfth Night, Othello, Macbeth”.  
 •    If asked to print the last 100 lines, your code should output “Twelfth Night, Othello, Macbeth, King Lear, Julius Caesar, Hamlet, Cymbeline, Coriolanus, Antony and Cleopatra”.  
 •    If asked to print the last 0 lines, your could should print nothing.
 */

