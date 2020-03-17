import Foundation

public extension String {
    
    func substring(from leftPosition: Int, to rightPosition: Int) -> String? {
        guard rightPosition <= count - 1,
            rightPosition > leftPosition,
            leftPosition >= 0 else {
            return nil
        }

        let leftIndex = index(startIndex, offsetBy: leftPosition)
        let rightOffset = (count - rightPosition) * -1
        let rightIndex = index(endIndex, offsetBy: rightOffset)

        guard leftIndex < rightIndex else {
            return nil
        }

        return String(self[leftIndex...rightIndex])
    }
    
}
