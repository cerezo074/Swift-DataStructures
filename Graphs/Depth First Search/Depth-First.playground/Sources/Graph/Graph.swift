// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public enum EdgeType {
    
    case directed
    case undirected
}

public protocol Graph {
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
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
}

extension Graph where Element: Hashable {
    
    var hasCycle: Bool {
        return false
    }
    
    public func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
        outer: while let vertex = stack.peek() {
            let neighbors = edges(from: vertex)
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            
            for neighbor in neighbors {
                let nodeToVisit = neighbor.destination
                if !pushed.contains(nodeToVisit) {
                    pushed.insert(nodeToVisit)
                    stack.push(nodeToVisit)
                    visited.append(nodeToVisit)
                    continue outer
                }
            }
            
            stack.pop()
        }
        
        return visited
    }
    
    public func depthFirstSearchRecursive(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        let visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        
        return depthFirstSearchRecursive(stack: &stack, pushed: &pushed, visited: visited)
    }
    
    public func depthFirstSearchRecursive(stack: inout Stack<Vertex<Element>>,
                                          pushed: inout Set<Vertex<Element>>,
                                          visited: [Vertex<Element>]) -> [Vertex<Element>]
    {
        guard let vertex = stack.peek() else {
            return visited
        }
        
        var newVisited = visited + [vertex]
        
        let neighbors = edges(from: vertex)
        guard !neighbors.isEmpty else {
            stack.pop()
            return newVisited
        }
        
        for neighbor in neighbors {
            let nodeToVisit = neighbor.destination
            if !pushed.contains(nodeToVisit) {
                pushed.insert(nodeToVisit)
                stack.push(nodeToVisit)
                
                newVisited = depthFirstSearchRecursive(stack: &stack, pushed: &pushed, visited: newVisited)
            }
        }
        
        stack.pop()
        
        return newVisited
    }
    
    public func containsCycle(from source: Vertex<Element>) -> Vertex<Element>? {
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        
        stack.push(source)
        pushed.insert(source)
        
        return containsCycle(stack: &stack, pushed: &pushed)
    }
    
    func containsCycle(stack: inout Stack<Vertex<Element>>,
                       pushed: inout Set<Vertex<Element>>) -> Vertex<Element>?
    {
        guard let vertex = stack.peek() else {
            return nil
        }
                
        let neighbors = edges(from: vertex)
        guard !neighbors.isEmpty else {
            stack.pop()
            return nil
        }
        
        for neighbor in neighbors {
            let nodeToVisit = neighbor.destination
            
            if !pushed.contains(nodeToVisit) {
                pushed.insert(nodeToVisit)
                stack.push(nodeToVisit)
                
                if let cycledNode = containsCycle(stack: &stack, pushed: &pushed) {
                    return cycledNode
                }
            } else {
                return nodeToVisit
            }
        }
        
        stack.pop()
        
        return nil
    }

}
