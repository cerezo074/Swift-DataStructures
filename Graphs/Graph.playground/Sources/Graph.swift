import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    
    associatedtype Element: Hashable
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    
}

extension Graph {
    
    public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
    public func edges(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        var visitedVertexes: Set<Vertex<Element>> = [source]
        var pendingVertexes = QueueStack<Vertex<Element>>()
        pendingVertexes.enqueue(source)
        var totalEdges: Int = 0
        
        while !pendingVertexes.isEmpty {
            guard let pendingVertex = pendingVertexes.dequeue() else { continue }
            
            let edges = self.edges(from: pendingVertex)
            edges.forEach {
                if $0.destination == destination {
                    totalEdges += 1
                } else if !visitedVertexes.contains($0.destination) {
                    pendingVertexes.enqueue($0.destination)
                    visitedVertexes.insert($0.destination)
                }
            }
        }
        
        return totalEdges
    }
    
}
