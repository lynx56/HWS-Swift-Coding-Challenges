import PlaygroundSupport
import Foundation

func generatePermutation(array: [Character]){
    var mutable = array
    var found = true
    
     while (found == true){
        found = false
        for i in (1..<mutable.count).reversed(){
        if mutable[i-1] < mutable[i]{
            found = true
            let m = i - 1
            var k = i
            var min = mutable[m]
        
            for j in i..<mutable.count{
               if mutable[j] < min, mutable[j] > mutable[m]{
                    min = mutable[j]
                    k = j
                }
            }
            
            mutable.swapAt(m, k)
            
            mutable[i..<mutable.count].sort()
            
            print(mutable.description)
        }
    }
  }
}

generatePermutation(array: Array("нос"))

PlaygroundPage.current.needsIndefiniteExecution = true


