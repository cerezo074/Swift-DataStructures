import Foundation

public extension Int {
    
    var compositeNumbers: [Int] {
        guard self > 3 else { return [] }
        return (1...self).filter { !$0.isPrime }
    }
    
    var isPrime: Bool {
        guard self > 1 else { return true }
        let numbers = Set(1...self)
        let divisors = numbers.filter { self % $0 == 0 }
        let primeDivisors = Set([1, self])
        
        return divisors.subtracting(primeDivisors).isEmpty
    }
    
}
