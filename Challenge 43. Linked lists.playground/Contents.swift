/*
 Challenge 43: Linked lists
 Difficulty: Easy Create a linked list of lowercase English alphabet letters, along with a method that traverses all
 nodes and prints their letters on a single line separated by spaces.
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
}

var list = LinkedList<Character>()
"abcdefghijklmnopqrstuvwxyz".forEach { list.add(value: $0) }

list.printList(with: " ")

/*
• The output of your code should be the English alphabet printed to the screen, i.e. “a b c d ... x y z”.
 */

