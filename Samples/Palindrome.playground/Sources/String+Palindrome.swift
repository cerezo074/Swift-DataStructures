import Foundation

public extension String {

    var isPalindrome: Bool {
        guard count > 1 else {
            return false
        }

        let iterations = 0..<(count / 2)
        let lastIndex = index(before: endIndex)

        for i in iterations {
            let leftCharacter = self[index(startIndex, offsetBy: i)]
            let rightCharacter = self[index(lastIndex, offsetBy: (i * -1))]

            if leftCharacter == rightCharacter {
                continue
            } else {
                return false
            }
        }

        return true
    }

}
