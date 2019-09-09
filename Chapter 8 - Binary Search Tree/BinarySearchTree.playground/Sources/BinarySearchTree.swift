import Foundation

public struct BinarySearchTree<Element: Comparable> {

    public private(set) var root: BinaryNode<Element>?

    public init() {}

}

extension BinarySearchTree: CustomStringConvertible {

    public var description: String {
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
    }

}

//Mark: Insert
extension BinarySearchTree {

    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }

    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }

        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }

        return node
    }

}

//Mark: Search
extension BinarySearchTree {

    public func contains(value: Element) -> Bool {
        return contains(on: root, value: value)
    }

    private func contains(on node: BinaryNode<Element>?, value: Element) -> Bool {
        guard let node = node else {
            return false
        }

        if node.value == value {
            return true
        } else if value > node.value {
            return contains(on: node.rightChild, value: value)
        } else {
            return contains(on: node.leftChild, value: value)
        }
    }

    public func contains2(value: Element) -> Bool {
        guard let root = root else {
            return false
        }

        var nextNode: BinaryNode<Element>? = root
        while let currentNode = nextNode {

            if currentNode.value == value {
                return true
            }

            nextNode = value < currentNode.value ? currentNode.leftChild : currentNode.rightChild
        }

        return false
    }
    
}

//Mark: Delete
private extension BinaryNode {
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
}

extension BinarySearchTree {
    
    public mutating func remove(value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            if node.isLeaf {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
    
}

//Challenge
extension BinaryNode {
    
    public var isBST: Bool {
        return passBSTRules(on: self) == nil
    }
    
    private func passBSTRules(on node: BinaryNode<Element>?) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if node.isLeaf {
            return nil
        }
        
        if let rightChild = node.rightChild, rightChild.value < node.value {
            print("\(node.value) ----- \(rightChild.value)")
            print("Tree is not BST, this node \(rightChild.value), doesnt fit right condition")
            return node
        }
        
        if let leftChild = node.leftChild, leftChild.value >= node.value {
            print("Tree is not BST, this node \(leftChild.value), doesnt fit left condition")
            return node
        }
        
        if let leftSubTreeResult = passBSTRules(on: node.leftChild) {
            return leftSubTreeResult
        }
        
        if let rightSubTreeResult = passBSTRules(on: node.rightChild) {
            return rightSubTreeResult
        }
            
        return nil
    }
    
}
