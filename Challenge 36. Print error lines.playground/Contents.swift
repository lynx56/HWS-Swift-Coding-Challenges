/*
 Challenge 36: Print error lines
 Difficulty: Taxing Write a function that accepts accepts a path to a log file on disk, and returns how many lines
 start with “[ERROR]”. The log file could be as large as 10GB, but may also not exist.
 */

import Foundation
import PlaygroundSupport
import UIKit

class ChunkedFileReader{
    var chunkSize: Int = 1024
    var lineDelimeter = "\n".data(using: .utf8)!
    var buffer: Data
    var handle: FileHandle
    
    init(filePath: String, chunkSize: Int){
        handle = FileHandle(forReadingAtPath: filePath)!
        self.chunkSize = chunkSize
        buffer = Data(capacity: chunkSize)
    }
    
    func readLine()->String?{
        var rangeDelimeter = buffer.range(of: lineDelimeter)
        
        while rangeDelimeter == nil{
            let chunk = handle.readData(ofLength: chunkSize)
            if chunk.count == 0{
                if buffer.count > 0{
                    defer {
                        buffer.count = 0
                    }
                    return String(data: buffer, encoding: .utf8)
                }
                
                return nil
            }else{
                buffer.append(chunk)
                
                rangeDelimeter = buffer.range(of: lineDelimeter)
            }
        }
        
        let rangeOfLine = Range(0..<rangeDelimeter!.upperBound)
        
        let line = String(data: buffer, encoding: .utf8)
        
        buffer.removeSubrange(rangeOfLine)
        
        line?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return line
    }
    
}

func errorLines(in file: URL)->Int{
    var totalErrors = 0
    let reader = ChunkedFileReader(filePath: file.path, chunkSize: 1024)
    
    while let line = reader.readLine(){
        if line.hasPrefix("[ERROR]"){
            totalErrors += 1
        }
    }
    
    return totalErrors
}

let source = playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true).appendingPathComponent("log.txt")
errorLines(in: source)

/*
 •    If the file contains 100,000,000 lines and eight start with “[ERROR]” your function should return 8.  
 •    If the file does not exist, cannot be loaded, or contains zero lines starting with “[ERROR]” your function should return 0.
 */

