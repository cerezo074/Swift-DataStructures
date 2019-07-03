// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Node<T> {
  
  public var value: T
  public var next: Node<T>?
  public var previous: Node<T>?
  
  public init(value: T) {
    self.value = value
  }
}

extension Node: CustomStringConvertible {
  
  public var description: String {
    return String(describing: value)
  }
}

public class DoublyLinkedList<T> {
  
  private var head: Node<T>?
  private var tail: Node<T>?
  
  public init() { }
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var first: Node<T>? {
    return head
  }
  
  public func append(_ value: T) {
    let newNode = Node(value: value)
    
    guard let tailNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    
    newNode.previous = tailNode
    tailNode.next = newNode
    tail = newNode
  }
  
  public func remove(_ node: Node<T>) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    
    next?.previous = prev
    
    if next == nil {
      tail = prev
    }
    
    node.previous = nil
    node.next = nil
    
    return node.value
  }
}

extension DoublyLinkedList: CustomStringConvertible {
  
  public var description: String {
    var string = ""
    var current = head
    while let node = current {
      string.append("\(node.value) -> ")
      current = node.next
    }
    return string + "end"
  }
}

public class LinkedListIterator<T>: IteratorProtocol {
  
  private var current: Node<T>?
  
  init(node: Node<T>?) {
    current = node
  }
  
  public func next() -> Node<T>? {
    defer { current = current?.next }
    return current
  }
}

extension DoublyLinkedList: Sequence {
  
  public func makeIterator() -> LinkedListIterator<T> {
    return LinkedListIterator(node: head)
  }
}

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
