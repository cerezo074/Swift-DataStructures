import Foundation

struct Matrix<Data: Comparable> {
    
    private var values: [[Data?]]
    
    init?(rows: Int, columns: Int) {
        guard rows > 0, columns > 0 else { return nil }
        
        values = Array<Array<Data?>>.init(repeating: [], count: rows)
        
        for row in 0..<rows {
            let column = Array<Data?>.init(repeating: nil, count: columns)
            values[row] = column
        }
    }
    
}

extension Matrix {
    
    var columns: Int {
        return values.first?.count ?? 0
    }
    
    var rows: Int {
        return values.count
    }
    
    func getValue(_ row: Int, _ column: Int) -> Data? {
        guard validateIndexes(row, column)  else {
            return nil
        }
        
        return values[row][column]
    }
    
    mutating func setValue(_ newValue: Data?, row: Int, column: Int) {
        guard validateIndexes(row, column) else {
            return
        }
        
        values[row][column] = newValue
    }
    
    subscript(_ row: Int, _ column: Int) -> Data? {
        get {
            return getValue(row, column)
        }
        set {
            setValue(newValue, row: row, column: column)
        }
        
    }
    
    private func validateIndexes(_ row: Int, _ column: Int) -> Bool {
        return row >= 0 && row < self.rows && column >= 0 && column < self.columns
    }
    
}

extension Matrix: CustomStringConvertible {
    
    var description: String {
        var result = ""
        
        for row in values {
            var rowString = row.map { (value) -> String in
                guard let value = value else {
                    return "nil"
                }
                
                return String(describing: value)
                }
            .joined(separator: ",")
            
            rowString += "\n"
            result += rowString
        }
        
        return result
    }
    
}

var testMatrix = Matrix<Int>(rows: 3, columns: 2)!
print(testMatrix)
testMatrix[1,1] = 1
print(testMatrix)
testMatrix[1,1] = nil
print(testMatrix)
testMatrix[2,1] = 20
print(testMatrix)

