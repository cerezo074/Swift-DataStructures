public struct QueueLinkedList<T>: Queue {
    private let list = DoublyLinkedList<T>()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: T? {
        return list.first?.value
    }
    
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty, let head = list.first else { return nil }
        return list.remove(head)
    }
}

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String {
        return list.description
    }
    
}

var queue = QueueLinkedList<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Brian")
queue
queue.peek
