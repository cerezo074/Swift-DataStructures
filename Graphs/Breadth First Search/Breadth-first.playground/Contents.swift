// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//: ![sampleGraph](sampleGraph.png)

//let graph = AdjacencyList<String>()
//let a = graph.createVertex(data: "A")
//let b = graph.createVertex(data: "B")
//let c = graph.createVertex(data: "C")
//let d = graph.createVertex(data: "D")
//let e = graph.createVertex(data: "E")
//let f = graph.createVertex(data: "F")
//let g = graph.createVertex(data: "G")
//let h = graph.createVertex(data: "H")
//
//graph.add(.undirected, from: a, to: b, weight: nil)
//graph.add(.undirected, from: a, to: c, weight: nil)
//graph.add(.undirected, from: a, to: d, weight: nil)
//graph.add(.undirected, from: b, to: e, weight: nil)
//graph.add(.undirected, from: c, to: f, weight: nil)
//graph.add(.undirected, from: c, to: g, weight: nil)
//graph.add(.undirected, from: e, to: h, weight: nil)
//graph.add(.undirected, from: e, to: f, weight: nil)
//graph.add(.undirected, from: f, to: g, weight: nil)

extension Graph where Element: Hashable {
    
    func maxEnqueuedItems(from source: Vertex<Element>) -> Int {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        var maxEnqueuedItems: Int = 0
        var enqueuedItems: Int = 0
        queue.enqueue(source)
        enqueuedItems += 1
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            enqueuedItems -= 1
            visited.append(vertex)
            
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueuedItems += 1
                    enqueued.insert(edge.destination)
                }
            }
            
            if maxEnqueuedItems <= enqueuedItems {
                  maxEnqueuedItems = enqueuedItems
            }
        }
        
        return maxEnqueuedItems
    }
    
    func breadthFirstSearchRecursive(from source: Vertex<Element>) -> [Vertex<Element>] {
        var enqueued: Set<Vertex<Element>> = [source]
        var visited: [Vertex<Element>] = []
        var queue: QueueStack<Vertex<Element>> = QueueStack()
        queue.enqueue(source)
        
        return breadthFirstSearchRecursive(visited: &visited, queue: &queue, enqueued: &enqueued)
    }
    
    private func breadthFirstSearchRecursive(visited: inout [Vertex<Element>],
                                             queue: inout QueueStack<Vertex<Element>>,
                                             enqueued: inout Set<Vertex<Element>>) -> [Vertex<Element>]
    {
        guard let vertex = queue.dequeue() else {
            return visited
        }
        
        visited.append(vertex)
        
        let neighborEdges = edges(from: vertex)
        neighborEdges.forEach { edge in
            if !enqueued.contains(edge.destination) {
                queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)
            }
        }
        
        return breadthFirstSearchRecursive(visited: &visited, queue: &queue, enqueued: &enqueued)
    }
    
}

let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")
let i = graph.createVertex(data: "I")
let j = graph.createVertex(data: "J")

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: d, to: i, weight: nil)
graph.add(.undirected, from: c, to: i, weight: nil)
graph.add(.undirected, from: i, to: f, weight: nil)
graph.add(.undirected, from: i, to: g, weight: nil)
graph.add(.undirected, from: i, to: j, weight: nil)
graph.add(.undirected, from: g, to: f, weight: nil)
graph.add(.undirected, from: f, to: e, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)

print(graph.breadthFirstSearch(from: a))
print(graph.maxEnqueuedItems(from: a)) // Challenge 1
print(graph.breadthFirstSearchRecursive(from: a)) // Challenge 2
print(graph.isDisconnected) // Challenge 3

//let invalidGraph = AdjacencyList<String>()
//let a = invalidGraph.createVertex(data: "A")
//let b = invalidGraph.createVertex(data: "B")
//let c = invalidGraph.createVertex(data: "C")
//let d = invalidGraph.createVertex(data: "D")
//let e = invalidGraph.createVertex(data: "E")
//let f = invalidGraph.createVertex(data: "F")
//let g = invalidGraph.createVertex(data: "G")
//let h = invalidGraph.createVertex(data: "H")
//
//invalidGraph.add(.undirected, from: a, to: b, weight: nil)
//invalidGraph.add(.undirected, from: a, to: c, weight: nil)
//invalidGraph.add(.undirected, from: a, to: d, weight: nil)
//invalidGraph.add(.undirected, from: g, to: f, weight: nil)
//invalidGraph.add(.undirected, from: f, to: e, weight: nil)
//invalidGraph.add(.undirected, from: e, to: h, weight: nil)
//
//print(invalidGraph.isDisconnected) // Challenge 3
