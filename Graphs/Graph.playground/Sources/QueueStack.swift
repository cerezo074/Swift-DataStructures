import Foundation

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []

    public init() {}

    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }

    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}

public protocol Queue {
  
  associatedtype Element
  @discardableResult mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}
