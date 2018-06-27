/*
 Challenge 29: Documents directory
 Difficulty: Easy Write a function that returns a URL to the user’s documents directory.
 */

import Foundation

func documentsDirectory()->URL?{
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls.first
}

print(documentsDirectory()!)

/*
 • Your function should need no input, and return a URL pointing to /Users/ yourUserName/Documents on macOS, and /path/to/container/Documents on iOS.
 */

