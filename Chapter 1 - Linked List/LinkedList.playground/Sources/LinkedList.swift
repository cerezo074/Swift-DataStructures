import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        let newTail = Node(value: value)
        
        if isEmpty {
            push(value)
        } else {
            tail?.next = newTail
            tail = newTail
        }
    }

    public func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode: Node<Value>? = head
        
        repeat {
            if currentIndex == index, currentIndex <= index  {
                break
            }
            
            currentNode = currentNode?.next
            currentIndex += 1
        } while (currentNode != nil)
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, at index: Int) -> Node<Value>? {
        if index == 0 {
            push(value)
            return head
        } else if index < 0 {
            return nil
        }
        
        guard let previousNode = node(at: index - 1) else {
            return nil
        }
        
        let newNode = Node(value: value, next: previousNode.next)
        previousNode.next = newNode
    
        return newNode
    }
    
    @discardableResult
    public mutating func insert(value: Value, after node: Node<Value>) -> Node<Value>? {
        guard tail !== node else {
            append(value)
            return tail
        }
        
        let newNode = Node(value: value, next: node.next)
        node.next = newNode
        
        return newNode
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
    
}
