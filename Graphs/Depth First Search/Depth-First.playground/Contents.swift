import UIKit

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
//graph.add(.undirected, from: c, to: g, weight: nil)
//graph.add(.undirected, from: e, to: f, weight: nil)
//graph.add(.undirected, from: e, to: h, weight: nil)
//graph.add(.undirected, from: f, to: g, weight: nil)
//graph.add(.undirected, from: f, to: c, weight: nil)
//
//print(graph.depthFirstSearch(from: a))
//print(graph.depthFirstSearchRecursive(from: a))

//let cycledGraph = AdjacencyList<String>()
//let a = cycledGraph.createVertex(data: "A")
//let b = cycledGraph.createVertex(data: "B")
//let c = cycledGraph.createVertex(data: "C")
//let d = cycledGraph.createVertex(data: "D")
////
//cycledGraph.add(.directed, from: a, to: b, weight: nil)
//cycledGraph.add(.directed, from: b, to: c, weight: nil)
//cycledGraph.add(.directed, from: c, to: a, weight: nil)
//cycledGraph.add(.directed, from: c, to: d, weight: nil)
////
//print(cycledGraph.depthFirstSearch(from: a))
//print(cycledGraph.depthFirstSearchRecursive(from: a))
//print(cycledGraph.containsCycle(from: a))

let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")

graph.add(.directed, from: a, to: b, weight: nil)
graph.add(.directed, from: a, to: c, weight: nil)
graph.add(.directed, from: c, to: a, weight: nil)
graph.add(.directed, from: b, to: c, weight: nil)
graph.add(.directed, from: c, to: d, weight: nil)

print(graph)
print(graph.containsCycle(from: a))
