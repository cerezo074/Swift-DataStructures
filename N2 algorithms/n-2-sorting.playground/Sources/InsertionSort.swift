import Foundation

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count > 1 else {
        return
    }

    for index in (1..<array.count).reversed() {
        for lowerIndex in (0...(index - 1)).reversed() {
            if array[lowerIndex] > array[lowerIndex + 1] {
                array.swapAt(lowerIndex, lowerIndex + 1)
            } else {
                break
            }
        }
    }
}
