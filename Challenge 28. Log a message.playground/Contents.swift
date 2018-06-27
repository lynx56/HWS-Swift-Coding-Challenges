/*
 Challenge 28: Log a message
 Difficulty: Easy
 Write a logging function that accepts accepts a path to a log file on disk as well as a new log message. Your function should open the log file (or create it if it does not already exist), then append the new message to the log along with the current time and date.
 */

import Foundation
import PlaygroundSupport

func log(){
    var documentsUrl = playgroundSharedDataDirectory
    documentsUrl.appendPathComponent("main.log")
 
    var logmessage = (try? String(contentsOf: documentsUrl)) ?? ""
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:s"
 
    let currentLog = dateFormatter.string(from: Date())
    logmessage.append("\n")
    logmessage.append(currentLog)
    try! logmessage.write(to: documentsUrl, atomically: true, encoding: .utf8)
}

log()

/*
 •    If the file does not exist, running your function should create it and save the new message.  
 •    If it does exist, running your function should load the existing content and append the message to the end, along with suitable line breaking.
 */

