import UIKit

public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else {
    return a
  }
  let pivot = a[a.count / 2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }
  return quicksortNaive(less) + equal + quicksortNaive(greater)
}

var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
let lastIndex = array.index(before: array.indices.endIndex)
quickSortLomuto(&array, low: array.indices.startIndex, high: lastIndex)
print(array)

var array2 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
let lastIndex2 = array2.index(before: array2.indices.endIndex)
quickSortHoare(&array2, low: array2.indices.startIndex, high: lastIndex2)
print(array2)

var array3 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
let lastIndex3 = array3.index(before: array3.indices.endIndex)
quickSortMedian(&array3, low: array3.indices.startIndex, high: lastIndex3)
print(array3)

var array4 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
let lastIndex4 = array4.index(before: array4.indices.endIndex)
quickSortMedian(&array4, low: array4.indices.startIndex, high: lastIndex4)
print(array4)
