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

var array = [2,4,4,12,3,45,6,7,8]
let lastIndex = array.index(before: array.indices.endIndex)
quicksortLomuto(&array, low: array.indices.startIndex, high: lastIndex)
print(array)

