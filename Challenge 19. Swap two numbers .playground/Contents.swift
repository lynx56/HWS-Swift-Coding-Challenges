/*
 Challenge 19: Swap two numbers
 Difficulty: Easy Swap two positive variable integers, a and b, without using a temporary variable.
 */

import Foundation

var a = 1
var b = 2

func reset(){
    a = 1
    b = 2
}

func I(){
    a = a + b
    b = a - b
    a = a - b
}

func II(){
    a = a ^ b
    b = a ^ b
    a = a ^ b
}

func III(){
    swap(&a, &b)
}

func IV(){
    (a, b) = (b, a)
}

I()
print("a=\(a) b=\(b)")
reset()

II()
print("a=\(a) b=\(b)")
reset()

III()
print("a=\(a) b=\(b)")
reset()

IV()
print("a=\(a) b=\(b)")
reset()

/*
• Before running your code a should be 1 and b should be 2; afterwards, b should be 1 and a should be 2.
 */

