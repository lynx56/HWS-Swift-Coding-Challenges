/*
 Challenge 14: String permutations
 Difficulty: Taxing Write a function that prints all possible permutations of a given input string.
 */

import Foundation

func permute(_ prefix: String, current: String = ""){
    let length = prefix.count
    let arr = Array(prefix)
    if length == 0{
        print(current)
        print("*****")
    }else{
        print(current)
        for i in 0..<length{
            let left = String(arr[0 ..< i])
            let right = String(arr[i+1 ..< length])
            permute(left + right, current: current + String(arr[i]))
        }
    }
}

permute("a")
permute("ab")
permute("abc")

/*
 •    The string “a” should print “a”.  
 •    The string “ab” should “ab”, “ba”.  
 •    The string “abc” should print “abc”, “acb”, “bac”, “bca”, “cab”, “cba”.
 */

