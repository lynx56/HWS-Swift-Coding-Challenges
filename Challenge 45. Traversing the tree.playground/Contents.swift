/*
 Challenge 45: Traversing the tree
 Difficulty: Easy
 Note: this challenge cannot be attempted until you have first completed challenge 54.
 Write a new method for your binary search tree that traverses the tree in order, running a closure on each node.
 */

import Foundation

class Node<T>{
    var key: T
    var  left: Node<T>?
    var  right: Node<T>?
    
    init(with key: T){
        self.key = key
    }
}

class BinaryTree<T> where T: CustomStringConvertible & Comparable{
    var root: Node<T>?
    
    init(array: [T]){
        array.forEach { insert(value: $0) }
    }
    
    func insert(value: T){
        if root == nil{
            root = Node(with: value)
        }else{
           insert(value: value, node: root!)
        }
    }
    
    func insert(value: T, node: Node<T>){
        if value < node.key{
            if node.left == nil{
                node.left = Node(with: value)
            }else{
                insert(value: value, node: node.left!)
            }
        }else if value > node.key{
            if node.right == nil{
                node.right = Node(with: value)
            }else{
                insert(value: value, node: node.right!)
            }
        }
    }
    
    func traverse(node: Node<T>, apply: (Node<T>)->Void){
        if node.left != nil{
            traverse(node: node.left!, apply: apply)
        }
        apply(node)
        if node.right != nil{
            traverse(node: node.right!, apply: apply)
        }
    }
}

let tree = BinaryTree<Int>.init(array: [1, 2, 3])
tree.traverse(node: tree.root!){ print($0.key) }

var sum = 0
tree.traverse(node: tree.root!){ sum += $0.key }
print("Sum: \(sum)")

var values = [Int]()
tree.traverse(node: tree.root!){ values.append($0.key)}
print("Values count: \(values.count)")

/*
 •    The code tree.root?.traverse { print($0.key) } should print 1, 2, 3.  
 •    The code var sum = 0; tree.root?.traverse { sum += $0.key };  print(sum) should print 6.  
 •    The code var values = [Int](); tree.root?.traverse  { values.append($0.key) }; print(values.count) should print 3. 
 */

