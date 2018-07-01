/*
 Challenge 35: Convert images
 Difficulty: Tricky
 Write a function that accepts a path to a directory, then converts to PNGs any JPEGs it finds in there, leaving the originals intact. If any JPEG can’t be converted the function should just quietly continue.
 */

import Foundation
import PlaygroundSupport
import UIKit

var isDirectory: ObjCBool = false

func convertJPEGtoPNG(in directory: URL){
    let fileManager = FileManager.default
    
    guard fileManager.fileExists(atPath: directory.path, isDirectory: &isDirectory)
        || isDirectory.boolValue == false, let files = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil)
        else { return }
    
    for case let file as URL in files{
        if file.pathExtension.lowercased() == "jpeg" || file.pathExtension.lowercased() == "jpg"{
            if let image = UIImage(contentsOfFile: file.path), let png = UIImagePNGRepresentation(image){
                let newPath = file.deletingPathExtension().appendingPathExtension("png")
                do{
                    try png.write(to: newPath)
                }catch{
                    print(error)
                }
            }else{
                print("\(file.lastPathComponent) cant convert to png")
            }
        }
    }
}

let source = playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true)
convertJPEGtoPNG(in: source)

/*
 •    If your directory exists and is readable, all JPEGs in there should be converted to PNGs.  
 •    If any JPEGs can’t be read, converted, or written, just continue on quietly.
 */

