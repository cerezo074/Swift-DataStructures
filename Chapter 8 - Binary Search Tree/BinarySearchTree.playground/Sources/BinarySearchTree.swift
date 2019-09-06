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

            nextNode = currentNode.value < value ? currentNode.leftChild : currentNode.rightChild
            print("\(currentNode.value) < \(value) ? \(currentNode.leftChild?.value) : \(currentNode.rightChild?.value)")
        }

        return false
    }

}
