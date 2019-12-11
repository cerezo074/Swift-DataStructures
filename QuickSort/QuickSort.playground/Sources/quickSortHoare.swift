import Foundation

public func partitionHoare<T>(_ array: inout [T], low: Int, high: Int) -> Int where T: Comparable {
    let pivot = array[low]
    var leftIndex = low - 1
    var rightIndex = high + 1
    
    while true {
        repeat { rightIndex -= 1 } while (array[rightIndex] > pivot)
        repeat { leftIndex += 1 } while (array[leftIndex] < pivot)
        
        if leftIndex < rightIndex {
            array.swapAt(leftIndex, rightIndex)
        } else {
            return rightIndex
        }
    }
}


public func quickSortHoare<T>(_ array: inout [T], low: Int, high: Int) where T: Comparable {
    if low < high {
        let pivotIndex = partitionHoare(&array, low: low, high: high)
        quickSortHoare(&array, low: low, high: pivotIndex)
        quickSortHoare(&array, low: pivotIndex + 1, high: high)
    }
}
