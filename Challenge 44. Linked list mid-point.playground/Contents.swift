/*
 Challenge 44: Linked list mid-point
 Difficulty: Easy Extend your linked list class with a new method that returns the node at the mid point of the
 linked list using no more than one loop.
 */

import Foundation

class Node<T>{
    var data: T
    var next: Node<T>?
    
    init(with data: T){
        self.data = data
    }
}

class LinkedList<T> where T: CustomStringConvertible{
    var head: Node<T>?
    
    func add(value: T){
        let newNode = Node(with: value)
        newNode.next = nil
        
        if head == nil{
            head = newNode
        }else{
            var tmp = head!
            while tmp.next != nil{
                tmp = tmp.next!
            }
            
            tmp.next = newNode
        }
    }
    
    func printList(with separator: String){
        var tmp = head
        while let node = tmp{
            print("\(node.data)", terminator: separator)
            tmp = tmp?.next
        }
    }
    
    func center()->Node<T>?{
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}

var list = LinkedList<Int>()
[1, 2, 3, 4, 5, 6, 7, 8, 9].forEach { list.add(value: $0) }

list.printList(with: " ")
list.center()?.data

list = LinkedList<Int>()
[1, 2, 3, 4].forEach { list.add(value: $0) }

list.printList(with: " ")
list.center()?.data

/*
 •    If the linked list contains 1, 2, 3, 4, 5, your method should return 3.  
 •    If the linked list contains 1, 2, 3, 4, your method may return 2 or 3.  
 •    If the linked list contains the English alphabet, your method may return M or N.
 */

