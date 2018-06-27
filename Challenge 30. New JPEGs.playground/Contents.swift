/*
 Challenge 30: New JPEGs
 Difficulty: Easy Write a function that accepts a path to a directory and returns an array of all JPEGs that have
 been created in the last 48 hours.
 */

import Foundation
import PlaygroundSupport

extension URL{
    func createdDate()->Date?{
        do{
            let attributes = try FileManager.default.attributesOfItem(atPath: self.path)
            return attributes[FileAttributeKey.creationDate] as? Date
        }catch{
            print(error)
            return nil
        }
    }
}

func allJPEG(path: URL)->[URL]{
    var result = [URL]()
    let files = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
    let targetDate = Date().addingTimeInterval(-60*60*48)
    
    for file in files{
        if file.pathExtension.lowercased() == "jpg" || file.pathExtension.lowercased() == "jpeg", let creationDate = file.createdDate(), creationDate > targetDate{
            result.append(file)
        }
    }
    
    return result
}


let jpegs = allJPEG(path: playgroundSharedDataDirectory.appendingPathComponent("files", isDirectory: true))
print(jpegs.map({$0.absoluteString}))
/*
• If your directory contains three JPEGs older than 48 hours and three newer, your function should return the names of the three newer.
 */

