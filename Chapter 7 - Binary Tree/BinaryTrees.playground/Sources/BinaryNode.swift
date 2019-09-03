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

    public static func diagram2(for node: BinaryNode?, height: Int = 0) {
        guard let value = node?.value else {
            print("\n\(space(for: height))nil")
            return
        }

        if node?.leftChild == nil, node?.rightChild == nil {
            print("\n\(space(for: height))\(value)")
            return
        }

        let newHeight = height + 1
        diagram2(for: node?.rightChild, height: newHeight)
        print("\n\(space(for: height))\(value)")
        diagram2(for: node?.leftChild, height: newHeight)
    }

    private static func space(for level: Int) -> String {
        return (0..<level).map { _ in "    " }.joined()
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

    public static func serialize(rootNode: BinaryNode?) -> [Element?] {
        guard let rootNode = rootNode else { return [nil] }
        let leftSerialization = serialize(rootNode: rootNode.leftChild)
        let rightSerialization = serialize(rootNode: rootNode.rightChild)

        return [rootNode.value] + leftSerialization + rightSerialization
    }

    public static func deserialize(values: inout [Element?]) -> BinaryNode? {
        guard let value = values.removeFirst() else { return nil }

        let node = BinaryNode<Element>(value: value)
        let leftDeserialization = deserialize(values: &values)
        node.leftChild = leftDeserialization
        let rightDeserialization = deserialize(values: &values)
        node.rightChild = rightDeserialization

        return node
    }

}
