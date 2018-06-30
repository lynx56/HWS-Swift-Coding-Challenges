/*
 Challenge 34: Find executables
 Difficulty: Tricky Write a function that accepts the name of a directory to scan, and returns an array containing
 the name of any executable files in there.
 */

import Foundation
import PlaygroundSupport

var isDirectory: ObjCBool = false

func findExecutableFiles(in directory: URL)->[String]{
    let fileManager = FileManager.default
    
    guard fileManager.fileExists(atPath: directory.path, isDirectory: &isDirectory)
        || isDirectory.boolValue == false, let files = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil)
        else { return [] }
    
    var result: [String] = []
    for case let file as URL in files{
        if fileManager.isExecutableFile(atPath: file.path), file.hasDirectoryPath == false{
           
            result.append(file.lastPathComponent)
        }
    }
    return result
    
}

let source = playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true)
findExecutableFiles(in: source)

/*
 •    If directory/a exists and is executable, “a” should be in the array you return.  
 •    If directory/subdirectory/a exists and is executable, it should not be in the array you  return; only return files in the directory itself, not its subdirectories.  
 •    If there are no executable files, return an empty array.
 */

