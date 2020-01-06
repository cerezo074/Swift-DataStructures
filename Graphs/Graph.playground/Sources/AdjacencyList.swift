import Foundation

public class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, wieght: weight)
        adjacencies[source]?.append(edge)
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source)
            .first { $0.destination == destination }?
            .wieght
    }
}

extension AdjacencyList: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            
            for (index, edge) in edges.enumerated() {
                edgeString.append("\(edge.destination)" + (index != edges.count - 1 ?  ", " : ""))
            }
            
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }
        
        return result
    }
    
}
