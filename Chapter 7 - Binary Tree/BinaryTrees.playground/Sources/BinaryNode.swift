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
