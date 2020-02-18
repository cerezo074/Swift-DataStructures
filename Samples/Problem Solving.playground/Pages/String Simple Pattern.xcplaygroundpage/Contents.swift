//: [Previous](@previous)

import Foundation

func match(in words: String, _ pattern: String) -> Bool {
    let wordsCollection = words.split(separator: " ").map { String($0) }
    let patternCollection = Array(pattern).map { String($0) }
    let wordsIdentifiers = transform(collection: wordsCollection)
    let patternIdentifiers = transform(collection: patternCollection)
    
    guard wordsIdentifiers.count == patternIdentifiers.count else { return false }
    
    return wordsIdentifiers.intersection(patternIdentifiers).count == wordsIdentifiers.count
}

func transform(collection: [String]) -> Set<String> {
    var indexIdentifiers: Set<String> = []
    var indexMap: [String: String] = [:]
    
    for (index, word) in collection.enumerated() {
        if let wordIndexes = indexMap[word] {
            indexMap[word] = wordIndexes + "," + "\(index)"
        } else {
            indexMap[word] = "\(index)"
        }
    }
    
    for (_, value) in indexMap {
        indexIdentifiers.insert(value)
    }
    
    return indexIdentifiers
}

let pattern = "abca"
let words = "cat dog rabbit cat"
print("Is pattern(\(pattern)) match with words(\(words)): \(match(in: words, pattern))")
let pattern2 = "aca"
let words = "cat dog rabbit cat"
print("Is pattern(\(pattern2)) match with words(\(words)): \(match(in: words, pattern2))")
