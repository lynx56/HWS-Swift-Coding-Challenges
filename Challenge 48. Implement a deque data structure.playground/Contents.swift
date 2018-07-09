/*
 Challenge 48: Implement a deque data structure
 Difficulty: Tricky
 Create a new data type that models a double-ended queue using generics, or deque. You should be able to push items to the front or back, pop them from the front or back, and get the number of items.
 */

import Foundation

class Node<T>{
    var data: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(with data: T){
        self.data = data
    }
}

class Queue<T> where T: CustomStringConvertible & Equatable{
    var head: Node<T>?
    var tail: Node<T>?
    
    var count: Int {
        get{
            var currentNode = head
            var c = 0
            while currentNode != nil {
                c += 1
                currentNode = currentNode?.next
            }
            
            return c
        }
    }
    
    func push(_ data: T){
        let newNode = Node<T>(with: data)
        
        if head == nil{
            self.head = newNode
            self.head?.next = tail
            self.head?.prev = nil
            return
        }
        
        if tail == nil{
            self.tail = Node<T>(with: data)
            self.tail!.next = nil
            self.tail!.prev = head
            self.head?.next = self.tail
            return
        }
        
        tail!.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    func printQueue(){
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.data.description)
            currentNode = currentNode?.next
        }
    }
    
    func popFront()->T?{
        let data = head?.data
        
        if count > 1{
            head = head?.next
            head?.prev = nil
        }else{
            head = nil
            tail = nil
        }
        
        return data
    }
    
    func popBack()->T?{
        let data = tail?.data
        if count > 1{
            tail = tail?.prev
            tail?.next = nil
        }else{
            head = nil
            tail = nil
        }
        
        return data
    }
}

class QueueBasedOnArray<T>{
    private var array = [T]()
    
    var count: Int{
        get{
            return array.count
        }
    }
    
    func push(_ data: T){
        array.append(data)
    }
    
    func popFront()->T?{
        if let first = array.first{
            array.remove(at: 0)
            return first
        }
        
        return nil
    }
    
    func popBack()->T?{
        if let last = array.last{
            array.remove(at: array.count - 1)
            return last
        }
        
        return nil
    }
}

var numbers = QueueBasedOnArray<Int>()
numbers.push(5)
numbers.push(8)
numbers.push(3)
assert(numbers.count == 3)
assert(numbers.popFront()! == 5)
assert(numbers.popBack()! == 3)
assert(numbers.popFront()! == 8)
assert(numbers.popBack() == nil)

var numbers1 = Queue<Int>()
numbers1.push(5)
numbers1.push(8)
numbers1.push(3)
assert(numbers1.count == 3)
assert(numbers1.popFront()! == 5)
assert(numbers1.popBack()! == 3)
assert(numbers1.popFront()! == 8)
assert(numbers1.popBack() == nil)

/*
 Once your data structure has been created, this code should compile and run cleanly:
 var numbers = deque<Int>()
 numbers.pushBack(5)
 numbers.pushBack(8)
 numbers.pushBack(3)
 assert(numbers.count == 3)
 assert(numbers.popFront()! == 5)
 assert(numbers.popBack()! == 3)
 assert(numbers.popFront()! == 8)
 assert(numbers.popBack() == nil)
 */

