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
enum SortValuePosition {
    case left
    case right
}

func sort<Element>(value: Element, at position: SortValuePosition = .left, on array: inout [Element]) where Element: Equatable {
    guard array.count > 1 else { return }
    let lowestIndex = 0
    let hightestIndex = array.count - 1
    let outterRange: ClosedRange = position == .right ? lowestIndex...(hightestIndex - 1) : (lowestIndex + 1)...hightestIndex
    let outterIndexes: Array<Int> = position == .right ? outterRange.reversed() : Array(outterRange)
    
    for outterIndex in outterIndexes {
        let firstIndex = position == .right ? hightestIndex - 1 : lowestIndex + 1
        let innerRange = position == .right ? outterIndex...firstIndex : firstIndex...outterIndex
        
        for innerIndex in innerRange {
            if position == .right, array[innerIndex] == value && array[innerIndex + 1] != value {
                array.swapAt(innerIndex, innerIndex + 1)
            }
            
            if position == .left, array[innerIndex] == value && array[innerIndex - 1] != value {
                array.swapAt(innerIndex, innerIndex - 1)
            }
        }
    }
}

var array = [4,2,4,3,4,4,2,5,1]
print("Before sort, \(array)")
sort(value: 4, at: .right, on: &array)
print("After sort\(array)")
