//: [Previous](@previous)

import Foundation

extension String {
    
    func coincidences(with delimiters: Set<Character>) -> [String: Int] {
        guard count > 0, delimiters.count > 0 else { return [:] }
        var marker = 0
        var repeatedWords: [String: Int] = [:]

        for offset in 0..<count {
            let isLastPosition = count - 1 == offset
            
            let realOffset: Int
            if let characterAt = getCharacter(at: offset), delimiters.contains(characterAt) {
                realOffset = offset - 1
            } else if isLastPosition {
                realOffset = offset
            } else {
                continue
            }
            
            let distance = realOffset - marker
            
            guard distance >= 0 else {
                marker = offset + 1
                continue
            }
            
            let lowerIndex = index(startIndex, offsetBy: marker)
            let upperIndex = index(startIndex, offsetBy: realOffset)
            guard lowerIndex <= upperIndex,
                lowerIndex >= startIndex,
                upperIndex < endIndex else {
                    continue
            }

            let substring = self[lowerIndex...upperIndex]
            let word = String(substring)

            if let wordCounter = repeatedWords[word] {
                repeatedWords[word] = wordCounter + 1
            } else {
               repeatedWords[word] = 1
            }
            
            marker = offset + 1
        }
        
        return repeatedWords
    }
    
}

let testString = "    a a a, ,a ,a,,,, a,,,,,"
let delimiters: Set<Character> = [Character(","), Character(" ")]
print(testString.coincidences(with: delimiters))
