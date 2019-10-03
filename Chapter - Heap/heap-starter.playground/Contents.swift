// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

struct Heap<Element: Equatable> {

    typealias SortBuilder = (Element, Element) -> Bool

    var elements: [Element] = []
    let sort: SortBuilder

    init(sort: @escaping SortBuilder) {
        self.sort = sort
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    private var lastIndex: Int {
        return elements.count - 1
    }

    func peek() -> Element? {
        return elements.first
    }

    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }

    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }

        elements.swapAt(0, lastIndex)
        defer {
            siftDown(from: 0)
        }

        return elements.removeLast()
    }

    mutating func remove(at index: Int) -> Element? {
        guard !isEmpty, index <= lastIndex, index >= 0 else {
            return nil
        }

        if index == lastIndex {
            return elements.removeLast()
        }

        elements.swapAt(index, lastIndex)

        defer {
            siftDown(from: index)
            siftUp(from: index)
        }

        return elements.removeLast()
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent

            if left < count, sort(elements[left], elements[candidate]) {
                candidate = left
            }

            if right < count, sort(elements[right], elements[candidate]) {
                candidate = right
            }

            if candidate == parent {
                return
            }

            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: lastIndex)
    }

    mutating func siftUp(from index: Int) {
        var child = index
        while true {
            let parent = parentIndex(ofChildAt: child)

            if child > 0, sort(elements[child], elements[parent]) {
                elements.swapAt(parent, child)
                child = parent
            } else {
                return
            }
        }
    }

}
