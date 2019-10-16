// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

struct Heap<Element: Equatable> {

    typealias SortBuilder = (Element, Element) -> Bool

    var elements: [Element] = []
    let sort: SortBuilder

    init(sort: @escaping SortBuilder, elements: [Element] = []) {
        self.sort = sort

        if !elements.isEmpty {
            for i in elements {
                insert(i)
            }
        }
    }

    mutating func getNthElement(_ order: Int) -> Element? {
        guard order > 0 else { return nil }
        var currentOrder = 1

        while !elements.isEmpty {
            if order == currentOrder {
                break
            }

            remove()
            currentOrder += 1
        }

        return peek()
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

            if right < count, sort(elements[right], elements[candidate]) {
                candidate = right
            }

            if left < count, sort(elements[left], elements[candidate]) {
                candidate = left
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

    mutating func merge(_ heap: Heap) {
        guard let firtPeek = peek() else { return }
        guard let secondPeek = peek() else { return }

        var heapToDesapear: Heap
        var heapToBeUpdated: Heap
        var isSelfDeleted = false
        if sort(firtPeek, secondPeek) {
            heapToDesapear = heap
            heapToBeUpdated = self
        } else {
            heapToDesapear = self
            heapToBeUpdated = heap
            isSelfDeleted = true
        }

        while !heapToDesapear.isEmpty {
            guard let newElement = heapToDesapear.remove() else {
                continue
            }

            heapToBeUpdated.insert(newElement)
        }

        if isSelfDeleted {
            self = heapToBeUpdated
        }
    }
    
    func index(of element:  Element, statingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, statingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, statingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }

}

//Challenge 1
//var minHeap = Heap(sort: <, elements: [3, 10, 18, 5, 21, 100])
//print(minHeap.getNthElement(3))

//Challenge 3
var minHeap2_1 = Heap(sort: <, elements: [3, 10, 18, 5, 21, 100])
var minHeap2_2 = Heap(sort: <, elements: [30, 21, 39, 50, 11])
minHeap2_2.merge(minHeap2_1)
print(minHeap2_2.elements)

//Challenge 4
