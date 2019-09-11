// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class BinaryNode<Element: Comparable> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
    
}

extension BinaryNode: Equatable {
    
    public static func ==(leftNode: BinaryNode<Element>, rightNode: BinaryNode<Element>) -> Bool {
        return inOrderTraverse(leftNode: leftNode, rightNode: rightNode)
    }
    
    public static func inOrderTraverse(leftNode: BinaryNode<Element>?, rightNode: BinaryNode<Element>?) -> Bool {
        if let leftNode = leftNode, let rightNode = rightNode,
            leftNode.value == rightNode.value {
            
            let leftResult = inOrderTraverse(leftNode: leftNode.leftChild, rightNode: rightNode.leftChild)
            guard leftResult else { return false }
            
            let rightResult = inOrderTraverse(leftNode: leftNode.rightChild, rightNode: rightNode.rightChild)
            guard rightResult else { return false }
            
            return true
        } else if leftNode == nil, rightNode == nil {
            return true
        } else {
            return false
        }
    }
    
}

extension BinaryNode: CustomStringConvertible {
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
  }
}

extension BinaryNode {
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    public var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
}
