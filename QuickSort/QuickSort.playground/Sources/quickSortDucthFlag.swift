import Foundation

public func partitionDutchFlag<T>(_ array: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) where T: Comparable {
    let pivot = array[pivotIndex]
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if array[equal] < pivot {
            array.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if array[equal] == pivot {
            equal += 1
        } else {
            array.swapAt(equal, larger)
            larger -= 1
        }
    }
    
    return (smaller, larger)
}


public func quicksortDutchFlag<T>(_ array: inout [T], low: Int, high: Int) where T: Comparable {
    if low < high {
        let (middleFirst, middleLast) = partitionDutchFlag(&array, low: low, high: high, pivotIndex: high)
        quicksortDutchFlag(&array, low: low, high: middleFirst - 1)
        quicksortDutchFlag(&array, low: middleFirst + 1, high: high)
    }
}
