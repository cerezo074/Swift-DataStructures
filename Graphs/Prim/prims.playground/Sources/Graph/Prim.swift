// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Prim<T: Hashable> {
    public typealias Graph = AdjacencyList<T>
    public typealias Sort = (_ left: Edge<T>, _ right: Edge<T>) -> Bool
    private let sorting: Sort
    
    public init(sorting: @escaping Sort) {
        self.sorting = sorting
    }
}

internal extension Prim {
    
    func addAvailablesEdges(
        for vertex: Vertex<T>,
        in graph: Graph,
        check visited: Set<Vertex<T>>,
        to priorityQueue: inout PriorityQueue<Edge<T>>) {
        for edge in graph.edges(from: vertex) {
            if !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
    }
    
}

public extension Prim {
    
    func produceMinimunSpanningTree(for graph: Graph, from start: Vertex<T>? = nil) -> (cost: Double, mst: Graph) {
        var cost = 0.0
        let mst = Graph()
        var visited: Set<Vertex<T>> = []
        var priorityQueue: PriorityQueue<Edge<T>> = PriorityQueue(sort: sorting)
        
        mst.copyVertices(from: graph)
        
        guard let start = start ?? graph.vertices.first else {
            return (cost, mst)
        }
        
        visited.insert(start)
        addAvailablesEdges(for: start, in: graph, check: visited, to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            let vertex = smallestEdge.destination
            guard !visited.contains(vertex) else {
                continue
            }
            
            visited.insert(vertex)
            cost += smallestEdge.weight ?? 0.0
            
            mst.add(.undirected,
                    from: smallestEdge.source,
                    to: smallestEdge.destination,
                    weight: smallestEdge.weight)
            
            addAvailablesEdges(for: vertex, in: graph, check: visited, to: &priorityQueue)
        }
        
        return (cost, mst)
    }
    
}
