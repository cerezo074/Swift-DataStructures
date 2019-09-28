// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func binarySearch<Element: Comparable>(for value: Element, in range: Range<Int>? = nil, collection: [Element]) -> Int? {
    let range = range ?? collection.startIndex..<collection.endIndex
    
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middle = collection.index(range.lowerBound, offsetBy: size / 2)
    
    if collection[middle] == value {
        return middle
    } else if collection[middle] > value {
        return binarySearch(for: value, in: range.lowerBound..<middle, collection: collection)
    } else {
        return binarySearch(for: value, in: middle..<range.upperBound, collection: collection)
    }
}

public func findIndices<Element: Comparable>(for value: Element, in range: Range<Int>? = nil, collection: [Element]) -> Range<Int>? {
    guard let index = binarySearch(for: value, collection: collection) else {
        return nil
    }
    
    var lastIndex = -1
    let initialIndex = index + 1
    let finalIndex = collection.count
    
    guard initialIndex < finalIndex else { return nil }
    
    for newIndex in initialIndex..<finalIndex {
        if collection[newIndex] == value {
            lastIndex = newIndex
        } else {
            break
        }
    }
    
    //Iterate in inverse sense.
    if lastIndex != -1 {
        var lastIndex = -1
        let initialIndex = index + 1
        let finalIndex = collection.count
        
        guard initialIndex < finalIndex else { return nil }
        
        for newIndex in initialIndex..<finalIndex {
            if collection[newIndex] == value {
                lastIndex = newIndex
            } else {
                break
            }
        }
        
    }
    
    return initialIndex..<(lastIndex + 1)
}

let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31)
//print("index(of:): \(String(describing: search31))")
//print("binarySearch(for:): \(String(describing: binarySearch31))")
//
////Challenge 1
//print(binarySearch(for: 31, collection: array))

//Challenge 2
let array2 = [1, 2, 3, 3, 3, 4, 5, 5]
findIndices(for: 3, collection: array2)
