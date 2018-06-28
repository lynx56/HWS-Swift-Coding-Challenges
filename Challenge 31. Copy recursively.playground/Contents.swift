/*
 Challenge 31: Copy recursively
 Difficulty: Easy
 Write a function that accepts two paths: the first should point to a directory to copy, and the second should be where the directory should be copied to. Return true if the directory and all its contents were copied successfully; false if the copy failed, or the user specified something other than a directory.
 */

import Foundation
import PlaygroundSupport

var isDirectory: ObjCBool = false

func copyFiles(from sourceDirectory: URL, to destinationDirectory: URL)->Bool{
    let fileManager = FileManager.default
   
    guard fileManager.fileExists(atPath: sourceDirectory.path, isDirectory: &isDirectory)
        || isDirectory.boolValue == false else { return false }
    
    do{
        try fileManager.copyItem(at: sourceDirectory, to: destinationDirectory)
        return true
    }catch{
        print(error)
        return false
    }
}

let source = playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true)
let dest = playgroundSharedDataDirectory.appendingPathComponent("dir2", isDirectory: true)
copyFiles(from: source, to: dest)

/*
 •    If your directory exists and is readable, the destination is writeable, and the copy succeeded, your function should return true.  
 •    Under all other circumstances you should return false: if the directory does not exist or was not readable, if the destination was not writeable, if a file was specified rather than a directory, or if the copy failed for any other reason.
*/

