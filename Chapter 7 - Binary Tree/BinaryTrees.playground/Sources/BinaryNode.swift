import Foundation

public class BinaryNode<Element> {
    public let value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {

    public var description: String {
        return diagram(for: self, top: "", root: "", bottom: "")
    }
    
    private func diagram(for node: BinaryNode?, top: String, root: String, bottom: String) -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild, top: top + " ", root: top + "┌──", bottom: top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, top: bottom +  "│ ", root: bottom + "└──", bottom: bottom + " ")
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
    
}

extension BinaryNode {
    
    public var height: Int {
        return height(currenValue: -1)
    }
    
    func height(currenValue: Int) -> Int {
        let newCurrentValue = currenValue + 1
        let leftMaxValue = leftChild?.height(currenValue: newCurrentValue) ?? currenValue
        let rightMaxValue = rightChild?.height(currenValue: newCurrentValue) ?? currenValue
        
        if rightMaxValue > newCurrentValue, rightMaxValue > leftMaxValue {
            return rightMaxValue
        }
        
        if leftMaxValue > newCurrentValue, leftMaxValue > rightMaxValue {
            return leftMaxValue
        }
        
        return newCurrentValue
    }
    
}
