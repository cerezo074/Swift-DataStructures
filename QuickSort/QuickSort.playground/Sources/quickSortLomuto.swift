import Foundation

public func partitionLomuto<T>(_ array: inout [T], low: Int, high: Int) -> Int where T: Comparable {
    let pivot = array[high]
    
    var i = low
    for j in low ..< high {
        if array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
    }
    
    array.swapAt(i, high)
    return i
}

public func quicksortLomuto<T>(_ array: inout [T], low: Int, high: Int) where T: Comparable {
    if low < high {
        let pivot = partitionLomuto(&array, low: low, high: high)
        quicksortLomuto(&array, low: low, high: pivot - 1)
        quicksortLomuto(&array, low: low, high: pivot - 1)
    }
}
