// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "Bubble Sort") {
    var array =  [9, 4, 10, 3]
    print("Original \(array)")
    bubbleSort(&array)
    print("Bubble sorted: \(array)")
}

example(of: "Selection Sort") {
    var array =  [9, 4, 10, 3]
    print("Original \(array)")
    selectionSort(&array)
    print("Selection sort: \(array)")
}

