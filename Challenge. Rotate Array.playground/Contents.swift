/*
Rotate array by steps
*/

import Foundation

func rotate(array: inout [Int], by k: Int){
    guard array.count > 0, k > 0 else {
        return
    }
    
    let count = array.count
    
    array.append(contentsOf: array)
  
    let startIndex = count - k % array.count
    array = Array(array[startIndex..<startIndex + count])
}

func rotate2(array: inout [Int], by k: Int){
    guard array.count > 0, k > 0 else {
        return
    }
    
    let count = array.count
    let normalizeK = k % array.count
    var result = Array(repeating: 0, count: count)
    for i in 0..<count{
        result[i] = i < normalizeK ? array[count-normalizeK+i] : array[i-normalizeK]
    }
    
    array = result
}


func test(){
    var array1 = [1,2,3,4,5,6,7,8]
    var k = 3
    rotate(array: &array1, by: k)
    assert(array1 == [6,7,8,1,2,3,4,5])
    
    array1 = [1,2,3,4,5,6,7,8]
    rotate2(array: &array1, by: k)
    assert(array1 == [6,7,8,1,2,3,4,5])
    
    array1 = [100, -90, 7, 1]
    k = 10
    rotate(array: &array1, by: k)
    assert(array1 == [7,1,100,-90])
 
    array1 = [100, -90, 7, 1]
    rotate2(array: &array1, by: k)
    assert(array1 == [7,1,100,-90])
}

test()
print("Good")
