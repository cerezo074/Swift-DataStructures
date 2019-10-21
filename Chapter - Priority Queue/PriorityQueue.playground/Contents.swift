// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

struct PriorityQueue<Element: Equatable>: Queue {

    private var heap: Heap<Element>
    typealias SortHeap = (Element, Element) -> Bool


    init(sort: @escaping SortHeap, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

    var peek: Element? {
        return heap.peek()
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    mutating func dequeue() -> Element? {
        return heap.remove()
    }

}


var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])

while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}
