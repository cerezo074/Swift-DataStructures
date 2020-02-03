// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//var graph = AdjacencyList<Int>()
//let one = graph.createVertex(data: 1)
//let two = graph.createVertex(data: 2)
//let three = graph.createVertex(data: 3)
//let four = graph.createVertex(data: 4)
//let five = graph.createVertex(data: 5)
//let six = graph.createVertex(data: 6)
//
//graph.add(.undirected, from: one, to: two, weight: 6)
//graph.add(.undirected, from: one, to: three, weight: 1)
//graph.add(.undirected, from: one, to: four, weight: 5)
//graph.add(.undirected, from: two, to: three, weight: 5)
//graph.add(.undirected, from: two, to: five, weight: 3)
//graph.add(.undirected, from: three, to: four, weight: 5)
//graph.add(.undirected, from: three, to: five, weight: 6)
//graph.add(.undirected, from: three, to: six, weight: 4)
//graph.add(.undirected, from: four, to: six, weight: 2)
//graph.add(.undirected, from: five, to: six, weight: 6)
//
//print(graph)
//
//let prims = Prim<Int>() { leftEdge, rightEdge in
//    let leftWeight = leftEdge.weight ?? 0
//    let rightWeight = rightEdge.weight ?? 0
//    return leftWeight < rightWeight
//}
//
//let(cost, mst) = prims.produceMinimunSpanningTree(for: graph)
//print("cost: \(cost)")
//print("mst: ")
//print(mst)

//Challenge 2
var graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")

graph.add(.undirected, from: b, to: a, weight: 2)
graph.add(.undirected, from: b, to: c, weight: 6)
graph.add(.undirected, from: b, to: e, weight: 2)
graph.add(.undirected, from: b, to: d, weight: 8)
graph.add(.undirected, from: a, to: c, weight: 21)
graph.add(.undirected, from: c, to: e, weight: 4)
graph.add(.undirected, from: e, to: d, weight: 12)
graph.add(.undirected, from: d, to: a, weight: 3)

let prims = Prim<String>() { leftEdge, rightEdge in
    let leftWeight = leftEdge.weight ?? 0
    let rightWeight = rightEdge.weight ?? 0

    if leftWeight == rightWeight {
        return leftEdge.destination.data < rightEdge.destination.data
    }

    return leftWeight < rightWeight
}

let(cost, mst) = prims.produceMinimunSpanningTree(for: graph, from: b)
print("cost: \(cost)")
print("mst: ")
print(mst)
