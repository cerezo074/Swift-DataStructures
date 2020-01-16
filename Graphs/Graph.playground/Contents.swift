// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//Using adjacency list
//let graph = AdjacencyList<String>()
//
//let singapore = graph.createVertex(data: "Singapore")
//let tokyo = graph.createVertex(data: "Tokyo")
//let hongKong = graph.createVertex(data: "Hong Kong")
//let detroit = graph.createVertex(data: "Detroit")
//let sanFrancisco = graph.createVertex(data: "San Francisco")
//let washingtonDC = graph.createVertex(data: "Washington DC")
//let austinTexas = graph.createVertex(data: "Austin Texas")
//let seattle = graph.createVertex(data: "Seattle")
//
//graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
//graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
//graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
//graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
//
//print(graph)

//Using adjacency matrix
//let graph = AdjacencyMatrix<String>()
//
//let singapore = graph.createVertex(data: "Singapore")
//let tokyo = graph.createVertex(data: "Tokyo")
//let hongKong = graph.createVertex(data: "Hong Kong")
//let detroit = graph.createVertex(data: "Detroit")
//let sanFrancisco = graph.createVertex(data: "San Francisco")
//let washingtonDC = graph.createVertex(data: "Washington DC")
//let austinTexas = graph.createVertex(data: "Austin Texas")
//let seattle = graph.createVertex(data: "Seattle")
//
//graph.add(.undirected, from: singapore, to: hongKong, weight: nil)
//graph.add(.undirected, from: singapore, to: tokyo, weight: 0)
//graph.add(.undirected, from: hongKong, to: tokyo, weight: 0)
//graph.add(.undirected, from: tokyo, to: detroit, weight: nil)
//graph.add(.undirected, from: tokyo, to: washingtonDC, weight: nil)
//graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 0)
//graph.add(.undirected, from: detroit, to: austinTexas, weight: 0)
//graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 0)
//graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 0)
//graph.add(.undirected, from: washingtonDC, to: seattle, weight: 0)
//graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 0)
//graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 0)
//
//print(graph)

import XCTest

class GraphTests: XCTestCase {
    
    lazy var listGraph: AdjacencyList<String> = {
        let graph = AdjacencyList<String>()

        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")


        graph.add(.directed, from: a, to: b, weight: 0)
        graph.add(.directed, from: a, to: d, weight: 0)
        graph.add(.directed, from: a, to: e, weight: 0)
        graph.add(.directed, from: a, to: c, weight: 0)
        graph.add(.directed, from: b, to: d, weight: 0)
        graph.add(.directed, from: b, to: c, weight: 0)
        graph.add(.directed, from: c, to: e, weight: 0)
        graph.add(.directed, from: d, to: e, weight: 0)
        graph.add(.directed, from: e, to: c, weight: 0)
        
        return graph
    }()
    
    lazy var matrixGraph: AdjacencyMatrix<String> = {
        let graph = AdjacencyMatrix<String>()

        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")

        graph.add(.directed, from: a, to: b, weight: 0)
        graph.add(.directed, from: a, to: d, weight: 0)
        graph.add(.directed, from: a, to: e, weight: 0)
        graph.add(.directed, from: a, to: c, weight: 0)
        graph.add(.directed, from: b, to: d, weight: 0)
        graph.add(.directed, from: b, to: c, weight: 0)
        graph.add(.directed, from: c, to: e, weight: 0)
        graph.add(.directed, from: d, to: e, weight: 0)
        graph.add(.directed, from: e, to: c, weight: 0)
        
        return graph
    }()
    
    lazy var friendsGraph: AdjacencyList<String> = {
        let graph = AdjacencyList<String>()
        
        let vincent = graph.createVertex(data: "Vincent")
        let chesley = graph.createVertex(data: "Chesley")
        let ruiz = graph.createVertex(data: "Ruiz")
        let patrick = graph.createVertex(data: "Patrick")
        let ray = graph.createVertex(data: "Ray")
        let sun = graph.createVertex(data: "Sun")
        let cole = graph.createVertex(data: "Cole")
        let kerry = graph.createVertex(data: "Kerry")
        
        graph.add(.undirected, from: vincent, to: chesley, weight: 0)
        graph.add(.undirected, from: vincent, to: ruiz, weight: 0)
        graph.add(.undirected, from: vincent, to: patrick, weight: 0)
        graph.add(.undirected, from: ruiz, to: ray, weight: 0)
        graph.add(.undirected, from: ruiz, to: sun, weight: 0)
        graph.add(.undirected, from: patrick, to: cole, weight: 0)
        graph.add(.undirected, from: patrick, to: kerry, weight: 0)
        graph.add(.undirected, from: cole, to: ruiz, weight: 0)
        graph.add(.undirected, from: cole, to: vincent, weight: 0)
        
        return graph
    }()
    
    override class func tearDown() {
        super.tearDown()
    }
    
    override class func setUp() {
        super.setUp()
    }
    
    func testTotalEdgesBetween2NodesShouldCount5Edges() {
        guard let aList = listGraph.vertex(for: "A"),
            let aMatrix = matrixGraph.vertex(for: "A"),
            let eList = listGraph.vertex(for: "E"),
            let eMatrix = matrixGraph.vertex(for: "E") else {
            assertionFailure("Invalid nodes")
            return
        }

        let listEdges = listGraph.edges(from: aList, to: eList)
        let matrixEdges = matrixGraph.edges(from: aMatrix, to: eMatrix)
        XCTAssertEqual(listEdges.count, 5, "List graph is invalid")
        XCTAssertEqual(matrixEdges.count, 5, "Matrix graph is invalid")
    }

    func testTotalEdgesBetween2NodesShouldCount0Edges() {
        guard let aList = listGraph.vertex(for: "A"),
            let aMatrix = matrixGraph.vertex(for: "A"),
            let bList = listGraph.vertex(for: "B"),
            let bMatrix = matrixGraph.vertex(for: "B") else {
            assertionFailure("Invalid nodes")
            return
        }

        let listEdges = listGraph.edges(from: bList, to: aList)
        let matrixEdges = matrixGraph.edges(from: bMatrix, to: aMatrix)
        XCTAssertEqual(listEdges.count, 0, "List graph is invalid")
        XCTAssertEqual(matrixEdges.count, 0, "Matrix graph is invalid")
    }

    func testShouldCount1EdgesForTotalEdgesBetween2Nodes() {
        guard let aList = listGraph.vertex(for: "A"),
            let aMatrix = matrixGraph.vertex(for: "A"),
            let bList = listGraph.vertex(for: "B"),
            let bMatrix = matrixGraph.vertex(for: "B") else {
            assertionFailure("Invalid nodes")
            return
        }

        let listEdges = listGraph.edges(from: aList, to: bList)
        let matrixEdges = matrixGraph.edges(from: aMatrix, to: bMatrix)
        XCTAssertEqual(listEdges.count, 1, "List graph is invalid")
        XCTAssertEqual(matrixEdges.count, 1, "Matrix graph is invalid")
    }
    
    func testTotalEdgesBetween2NodesShouldCount3Edges() {
        guard let aList = listGraph.vertex(for: "A"),
            let aMatrix = matrixGraph.vertex(for: "A"),
            let cList = listGraph.vertex(for: "C"),
            let cMatrix = matrixGraph.vertex(for: "C") else {
            assertionFailure("Invalid nodes")
            return
        }

        let listEdges = listGraph.edges(from: aList, to: cList)
        let matrixEdges = matrixGraph.edges(from: aMatrix, to: cMatrix)
        XCTAssertEqual(listEdges.count, 4, "List graph is invalid")
        XCTAssertEqual(matrixEdges.count, 4, "Matrix graph is invalid")
    }

    func testCommomVertexShouldContaints1() {
        print(friendsGraph)
        let vincent: Vertex<String> = Vertex(index: 0, data: "Vincent")
        let ruiz: Vertex<String> = Vertex(index: 2, data: "Ruiz")
        let cole: Vertex<String> = Vertex(index: 6, data: "Cole")

        let mutualFriends = friendsGraph.mutualVertex(between: vincent, and: ruiz)
        var expectedResult: Set<Vertex<String>> = Set()
        expectedResult.insert(cole)
        
        XCTAssertEqual(mutualFriends, expectedResult)
    }
    
}

GraphTests.defaultTestSuite.run()
