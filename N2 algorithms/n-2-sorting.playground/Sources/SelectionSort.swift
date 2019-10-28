import Foundation

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }

    let endIndex = array.count - 1
    for start in (1...endIndex) {
        var lowestPosition = start - 1
        var needSwap = false
        for current in start...endIndex {
            if array[lowestPosition] > array[current] {
                lowestPosition = current
                needSwap = true
            }
        }

        if needSwap {
            array.swapAt(start - 1, lowestPosition)
        }
    }
}
