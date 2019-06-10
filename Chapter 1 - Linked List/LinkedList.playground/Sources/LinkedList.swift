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
    
    @discardableResult
    public mutating func pop() -> Node<Value>? {
        guard let newHead = head?.next else {
            return nil
        }
        
        let oldHead = head
        head = newHead
        
        return oldHead
    }
    
    @discardableResult
    public mutating func removeLast() -> Node<Value>? {
        guard let tail = tail else {
            return nil
        }
        
        guard let head = head else {
            return nil
        }
        
        var current: Node<Value>? = head
        var previous: Node<Value>? = head
        
        while current !== tail {
            guard let next = current?.next else {
                return nil
            }
            
            previous = current
            current = next
        }
        
        previous?.next = nil
        self.tail = previous
        
        return current
    }
    
    public mutating func remove(after node: Node<Value>) -> Node<Value>? {
        guard node !== tail else {
            return nil
        }
        
        let nodeToDelete = node.next
        if nodeToDelete === tail {
            node.next = nil
            tail = node
        } else {
            node.next = nodeToDelete?.next
        }
        
        return nodeToDelete
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

extension LinkedList: Collection {
    
    public func index(after i: LinkedList<Value>.Index) -> LinkedList<Value>.Index {
        return Index(node: i.node?.next)
    }
    
    public var startIndex: LinkedList<Value>.Index {
        return Index(node: head)
    }
    
    public var endIndex: LinkedList<Value>.Index {
        return Index(node: tail?.next)
    }
    
    public subscript(position: LinkedList<Value>.Index) -> Value {
        return position.node!.value
    }
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        public static func ==(left: Index, right: Index) -> Bool {
            switch (left.node, right.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        public static func <(left: Index, right: Index) -> Bool {
            guard left != right else {
                return false
            }
            
            let nodes = sequence(first: left.node) { $0?.next }
            
            return nodes.contains(where: { (node) -> Bool in
                node === right.node
            })
        }
        
    }
    
}
