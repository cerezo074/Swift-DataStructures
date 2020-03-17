import Foundation

public extension String {
    
    func getCharacter(at index: Int) -> Character? {
        guard index >= 0, index < count else { return nil }
        let lowIndex = self.index(startIndex, offsetBy: index)
        let substring = self[lowIndex...lowIndex]
        
        return substring.first
    }
    
}
