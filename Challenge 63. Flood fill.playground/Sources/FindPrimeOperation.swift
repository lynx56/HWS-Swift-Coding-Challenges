import Foundation

public class FindPrimeOperation: AsyncOperation{
    let lowerBound: Int
    let upperBound: Int
    public var output: [Int]
    
    public init(_ from: Int, to: Int){
        self.lowerBound = from
        self.upperBound = to
        self.output = [Int]()
    }
    
    override public func main() {
        for i in lowerBound..<upperBound{
            if i.isPrime(){
                output.append(i)
            }
        }
        
        self.state = .finished
    }
}

public extension Int{
    public func isPrime2()->Bool{
        guard self > 1 && self != 2 else { return false }
        
        //if the number n is not prime, it means it can be reached by multiplying two factors, x and y. If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible. So, we can be sure that at least one of x or y is less than or equal to the square root of n.
        let max = Int(ceil(sqrt(Double(self))))
        
        for i in 2..<max{
            if self % i == 0{
                return false
            }
        }
        
        return true
    }
    
    public func isPrime()->Bool{
        guard self > 1 else { return false }
        
        for i in 2..<self{
            if self % i == 0{
                return false
            }
        }
        
        return true
    }
}
