// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class BinaryNode<Element: Comparable> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
    
    public static func <(leftValue: BinaryNode<Element>, rightValue: BinaryNode<Element>) -> Bool {
        return leftValue.value < rightValue.value
    }
    
    public static func ==(leftNode: BinaryNode<Element>, rightNode: BinaryNode<Element>) -> Bool {
        if leftNode.isLeaf && rightNode.isLeaf {
            return leftNode.value == rightNode.value
        }
        
        if leftNode.leftChild == nil, rightNode.leftChild == nil,
            let leftNodeRightChild = leftNode.rightChild,
            let rightNodeRightChild = rightNode.rightChild {
            return leftNodeRightChild.value == rightNodeRightChild.value
        }
        
        if leftNode.rightChild == nil, rightNode.rightChild == nil,
            let leftNodeLeftChild = leftNode.leftChild,
            let rightNodeLeftChild = rightNode.leftChild {
            return leftNodeLeftChild.value == rightNodeLeftChild.value
        }
        
        guard  let leftNodeRightChild = leftNode.rightChild,
            let rightNodeRightChild = rightNode.rightChild,
            let leftNodeLeftChild = leftNode.leftChild,
            let rightNodeLeftChild = rightNode.leftChild else {
                return false
        }
        
        return leftNodeRightChild.value == rightNodeRightChild.value && leftNodeLeftChild.value == rightNodeLeftChild.value
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
