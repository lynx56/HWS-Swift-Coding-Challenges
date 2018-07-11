/*
 Challenge 54: Binary search trees
 Difficulty: Taxing Create a binary search tree data structure that can be initialized from an unordered array of
 comparable values, then write a method that returns whether the tree is balanced.
 */

import Foundation
import Accelerate

class Node<T>{
    var key: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(with data: T){
        self.key = data
    }
}

class BinaryTree<T> where T: Comparable{
    var root: Node<T>?
    
    init(with array: [T]){
        array.forEach { insert(value: $0) }
    }
    
    func insert(value: T){
        if root == nil{
            root = Node<T>(with: value)
        }else{
            insert(data: value, node: root!)
        }
    }
    
    func insert(data: T, node: Node<T>){
        if data < node.key{
            if node.left == nil{
                node.left = Node<T>(with: data)
            }else{
                insert(data: data, node: node.left!)
            }
        }else if data > node.key{
            if node.right == nil{
                node.right = Node<T>(with: data)
            }else{
                insert(data: data, node: node.right!)
            }
        }
    }
    
    func isBalanced()->Bool{
        guard let root = self.root
            else { return true }
        
        let minDepth = depth(from: root, applyfunc: min)
        let maxDepth = depth(from: root, applyfunc: max)
        let returnValue = (maxDepth - minDepth) - 1
        return  returnValue <= 1
    }
    
    func depth(from node: Node<T>?, applyfunc: (Int, Int)->Int)->Int{
        guard let node = node
            else { return 0 }
        
        let result = 1 + applyfunc(depth(from: node.left, applyfunc: applyfunc), depth(from: node.right, applyfunc: applyfunc))
        
        return result
    }
}

BinaryTree<Int>(with: [2, 1, 3]).isBalanced()
BinaryTree<Int>(with: [5, 1, 7, 6, 2, 1, 9]).isBalanced()
BinaryTree<Int>(with: [5, 1, 7, 6, 2, 1, 9, 1]).isBalanced()
BinaryTree<Int>(with: [5, 1, 7, 6, 2, 1, 9, 1, 3]).isBalanced()
BinaryTree<Int>(with: [50, 25, 100, 26, 101, 24, 99]).isBalanced()
BinaryTree(with: ["k", "t", "d", "a", "z", "m", "f"] ).isBalanced()
BinaryTree(with: [1]).isBalanced()
BinaryTree(with: [Character]() ).isBalanced()

BinaryTree(with: [1, 2, 3, 4, 5]).isBalanced()
BinaryTree(with: [10, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15]).isBalanced()
BinaryTree(with: ["f", "d", "c", "e", "a", "b"]).isBalanced()
/*
 The following values should create balanced trees:
 •    [2, 1, 3]  
 •    [5, 1, 7, 6, 2, 1, 9]  
 •    [5, 1, 7, 6, 2, 1, 9, 1]  
 •    [5, 1, 7, 6, 2, 1, 9, 1, 3]  
 •    [50, 25, 100, 26, 101, 24, 99]  
 •    ["k", "t", "d", "a", "z", "m", "f"]  
 •    [1]  
 •    [Character]()  The following values should not create balanced trees:  
 •    [1, 2, 3, 4, 5]  
 •    [10, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15]  
 •    ["f", "d", "c", "e", "a", "b"]
 */

