import Foundation

public func quickSortMedian<T>(_ array: inout [T], low: Int, high: Int) where T: Comparable {
    if low < high {
        let pivotIndex = medianOfThree(&array, low: low, high: high)
        array.swapAt(pivotIndex, high)
        let pivot = partitionLomuto(&array, low: low, high: high)
        quickSortLomuto(&array, low: low, high: pivot)
        quickSortLomuto(&array, low: pivot + 1, high: high)
    }
}

public func medianOfThree<T>(_ array: inout [T], low: Int, high: Int) -> Int where T: Comparable {
    let center = (low + high) / 2
    
    if array[low] > array[center] {
        array.swapAt(low, center)
    }
    
    if array[low] > array[high] {
        array.swapAt(low, high)
    }
    
    if array[center] > array[high] {
        array.swapAt(center, high)
    }
    
    return center
}
