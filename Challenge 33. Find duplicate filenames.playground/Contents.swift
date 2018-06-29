/*
 Challenge 33: Find duplicate filenames
 Difficulty: Tricky
 Write a function that accepts the name of a directory to scan, and returns an array of filenames that appear more than once in that directory or any of its subdirectories. Your function should scan all subdirectories, including subdirectories of subdirectories.
 */

import Foundation
import PlaygroundSupport

var isDirectory: ObjCBool = false

func scanForDuplicates(in directory: URL)->[String]{
    let fileManager = FileManager.default
    
    guard fileManager.fileExists(atPath: directory.path, isDirectory: &isDirectory)
        || isDirectory.boolValue == false, let files = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil)
        else { return [] }
    
    var seen = Set<String>()
    var duplicates = Set<String>()
    for case let file as URL in files{
        guard file.hasDirectoryPath == false else { continue }
        let fileName = file.lastPathComponent
        if seen.contains(fileName){
            duplicates.insert(fileName)
        }
        seen.insert(fileName)
    }
    return Array(duplicates)
    
}

let source = playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true)
scanForDuplicates(in: source)

/*
 •    If directory/subdir/a.txt exists and directory/sub/sub/sub/sub/subdir/a.txt exists, “a.txt” should be in the array you return.  
 •    Ignore directories that have the same name; you care only about files.  
 •    If there are no files with duplicate names, return an empty array.
 */

