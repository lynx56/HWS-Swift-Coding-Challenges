/*
 Challenge 16: Fizz Buzz
 Difficulty: Easy
 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases. 
 */

import Foundation

func fizzbuzz(){
    for i in 1...100{
        if i%3 == 0 && i%5 == 0{
            print("Fizz Buzz")
        }else if i%3 == 0{
            print("Fizz")
        }else if i%5 == 0{
            print("Buzz")
        }else{
            print("\(i)")
        }
    }
}

func fizzbuzz2(){
    for i in 1...100{
        if i%3 == 0{
            if i%5 == 0{
                print("Fizz Buzz")
            }else{
                 print("Fizz")
            }
        }else if i%5 == 0{
            print("Buzz")
        }else{
            print("\(i)")
        }
    }
}

fizzbuzz()
fizzbuzz2()
/*
 •    1 should print “1”  
 •    2 should print “2”  
 •    3 should print “Fizz”  
 •    4 should print “4”  
 •    5 should print “Buzz”  
 •    15 should print “Fizz Buzz”
 */

