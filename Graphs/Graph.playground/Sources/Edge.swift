import Foundation

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let wieght: Double?
}

extension Edge: CustomStringConvertible {
    
    public var description: String {
        let defaultDescription = "source: \(source.data), destination: \(destination.data)"
        
        if let wieght = wieght {
            return defaultDescription + ", weight: \(wieght)"
        } else {
            return defaultDescription + ", weight: nil"
        }
    }
    
}

extension Edge: Hashable where T: Hashable {
    
}

extension Edge: Equatable where T: Equatable {
    
}
