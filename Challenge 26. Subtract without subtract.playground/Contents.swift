/*
 Challenge 26: Subtract without subtract
 Difficulty: Taxing Create a function that subtracts one positive integer from another, without using -.
 */

import Foundation

func substract(subtract: Int, from: Int)->Int{
    return from + (-1) * subtract
}

func substract2(subtract: Int, from: Int)->Int{
    return from + (~subtract + 1)
}

substract(subtract: 5, from: 9)
substract2(subtract: 5, from: 9)
substract(subtract: 10, from: 30)
substract2(subtract: 10, from: 30)
/*
 •    The code challenge26(subtract: 5, from: 9) should return 4.  
 •    The code challenge26(subtract: 10, from: 30) should return 20.
 */

