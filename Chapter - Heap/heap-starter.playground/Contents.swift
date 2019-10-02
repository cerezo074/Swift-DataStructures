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

}
