/*
 Challenge 22: Binary reverse
 Difficulty: Tricky Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded
 so that it holds precisely eight binary digits.
 */

import Foundation

extension Int{
    func binaryReverse()->(binary: String, value: UInt){
        let binary = String(self, radix: 2)
        let leadingZeros = 8 - binary.count
        
        let reversedBinary = String((String(repeating: "0", count: leadingZeros) + binary).reversed())
        
        return (binary: reversedBinary, value: UInt(reversedBinary, radix: 2)!)
    }
}

32.binaryReverse()
41.binaryReverse()

/*
 •    The number 32 is 100000 in binary, and padded to eight binary digits that’s 00100000. Reversing that binary sequence gives 00000100, which is 4. So, when given the input 32 your function should return 4.  
 •    The number 41 is 101001 in binary, and padded to eight binary digits that 00101001. Reversing that binary sequence gives 10010100, which is 148. So, when given the input 41 your function should return 148.  
 •    It should go without saying that your function should be symmetrical: when fed 4 it should return 32, and when fed 148 it should return 41.
 */

