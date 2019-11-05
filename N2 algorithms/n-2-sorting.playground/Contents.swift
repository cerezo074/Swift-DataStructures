// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//example(of: "Bubble Sort") {
//    var array =  [9, 4, 10, 3]
//    print("Original \(array)")
//    bubbleSort(&array)
//    print("Bubble sorted: \(array)")
//}
//
//example(of: "Selection Sort") {
//    var array =  [9, 4, 10, 3]
//    print("Original \(array)")
//    selectionSort(&array)
//    print("Selection sort: \(array)")
//}
//
//example(of: "Insertion Sort") {
//    var array =  [9, 4, 10, 3]
//    print("Original \(array)")
//    insertionSort(&array)
//    print("Insertion sort: \(array)")
//}

//Challenge 1

//Given a collection of Equatable elements, bring all instances of a given value in the array to the right side of the array.

//enum SortValuePosition {
//    case left
//    case right
//}
//
//func sort<Element>(value: Element, at position: SortValuePosition = .left, on array: inout [Element]) where Element: Equatable {
//    guard array.count > 1 else { return }
//    let lowestIndex = 0
//    let hightestIndex = array.count - 1
//    let outterRange: ClosedRange = position == .right ? lowestIndex...(hightestIndex - 1) : (lowestIndex + 1)...hightestIndex
//    let outterIndexes: Array<Int> = position == .right ? outterRange.reversed() : Array(outterRange)
//
//    for outterIndex in outterIndexes {
//        let firstIndex = position == .right ? hightestIndex - 1 : lowestIndex + 1
//        let innerRange = position == .right ? outterIndex...firstIndex : firstIndex...outterIndex
//
//        for innerIndex in innerRange {
//            if position == .right, array[innerIndex] == value && array[innerIndex + 1] != value {
//                array.swapAt(innerIndex, innerIndex + 1)
//            }
//
//            if position == .left, array[innerIndex] == value && array[innerIndex - 1] != value {
//                array.swapAt(innerIndex, innerIndex - 1)
//            }
//        }
//    }
//}
//
//var array = [4,2,4,3,4,4,2,5,1]
//print("Before sort, \(array)")
//sort(value: 4, at: .right, on: &array)
//print("After sort\(array)")

// Challenge 2

// Given a collection of Equatable elements, return the first element that is a duplicate in the collection.

//struct RepeatedElement<Element> where Element: Equatable {
//    let element: Element
//    let indexes: (Int, Int)
//}
//
//func firstRepeatedElement<Element>(on elements: [Element]) -> RepeatedElement<Element>? where Element: Equatable {
//    guard elements.count > 1 else {
//        return nil
//    }
//
//    for outerIndex in (0..<elements.count).reversed() {
//        let innerRange = outerIndex + 1..<elements.count
//        for innerIndex in innerRange {
//            if elements[outerIndex] == elements[innerIndex] {
//                return RepeatedElement(element: elements[outerIndex], indexes: (outerIndex, innerIndex))
//            }
//        }
//    }
//
//    return nil
//}
//
//let elements = [4,1,2,3,4]
//print("Elements: \(elements)")
//if let repeatedElement = firstRepeatedElement(on: elements) {
//    print("This element \(repeatedElement.element) is repeated for the next indexes \(repeatedElement.indexes)")
//} else {
//    print("Array doesn't contains repeated elements!!!")
//}

// Challenge 3

//Reverse a collection of elements by hand. Do not rely on the reverse or reversed methods.

//func reversed(elements: [Any]) -> [Any] {
//    guard elements.count > 1 else { return elements }
//
//    var index = elements.count - 1
//    var array: [Any] = []
//
//    while index >= 0 {
//        array.append(elements[index])
//        index -= 1
//    }
//
//    return array
//}
//
//print(reversed(elements: [1,2,3,4]))
