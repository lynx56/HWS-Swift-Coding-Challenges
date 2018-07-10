/*
 Challenge 51: Reversing linked lists
 Difficulty: Tricky Expand your code from challenge 43 so that it has a reversed() method that returns a copy
 of itself in reverse.
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
    
    init(array: [T]){
        array.forEach { self.append(data: $0) }
    }
    
    init(){}
    
    func printlist(separator: String){
        var node = head
        
        while node != nil{
            print("\(node!.data)")
            node = node?.next
        }
    }
    
    func append(data: T){
        if head == nil{
            head = Node<T>(with: data)
            head?.next = nil
            return
        }
        
        var lastNode = head
        
        while lastNode?.next != nil{
            lastNode = lastNode?.next
        }
        
        let newNode = Node(with: data)
        lastNode?.next = newNode
        newNode.next = nil
    }
    
    func reverse(){
        var currentNode = head
        
        var newNext: Node<T>? = nil
        while let node = currentNode{
            let next = node.next
            node.next = newNext
            newNext = node
            currentNode = next
        }
        
        head = newNext
    }
    
    func copy() -> LinkedList<T> {
        let copy = LinkedList<T>()
        if let startNode = head {
            copy.head = Node(with: startNode.data)
            var previousCopyNode = copy.head
            var currentNode = head?.next
            while let node = currentNode {
                let copyNode = Node(with: node.data)
                previousCopyNode?.next = copyNode
                previousCopyNode = copyNode
                currentNode = currentNode?.next
            }
        }
        return copy
        
    }

}

let list = LinkedList<Character>(array: Array("abcdefghijklmnopqrstuvwxyz"))
list.printlist(separator: "  ")

print("------ REVERSED ---------")

let copy = list.copy()
copy.reverse()
copy.printlist(separator: "  ")



/*
• When you call reversed() on your alphabet list, running printNodes() on the return value should print the English alphabet printed to the screen in reverse, i.e. “z y x ... d b c a”.
 */

