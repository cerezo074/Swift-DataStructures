// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//: ![sampleGraph](sampleGraph.png)

//let graph = AdjacencyList<String>()
//
//let a = graph.createVertex(data: "A")
//let b = graph.createVertex(data: "B")
//let c = graph.createVertex(data: "C")
//let d = graph.createVertex(data: "D")
//let e = graph.createVertex(data: "E")
//let f = graph.createVertex(data: "F")
//let g = graph.createVertex(data: "G")
//let h = graph.createVertex(data: "H")
//
//graph.add(.directed, from: a, to: b, weight: 8)
//graph.add(.directed, from: a, to: f, weight: 9)
//graph.add(.directed, from: a, to: g, weight: 1)
//graph.add(.directed, from: b, to: f, weight: 3)
//graph.add(.directed, from: b, to: e, weight: 1)
//graph.add(.directed, from: f, to: a, weight: 2)
//graph.add(.directed, from: h, to: f, weight: 2)
//graph.add(.directed, from: h, to: g, weight: 5)
//graph.add(.directed, from: g, to: c, weight: 3)
//graph.add(.directed, from: c, to: e, weight: 1)
//graph.add(.directed, from: c, to: b, weight: 3)
//graph.add(.undirected, from: e, to: c, weight: 8)
//graph.add(.directed, from: e, to: b, weight: 1)
//graph.add(.directed, from: e, to: d, weight: 2)
//
//let dijkstra = Dijkstra(graph: graph)
//let pathsFromA = dijkstra.shortestPath(from: h)
//let path = dijkstra.shortestPath(to: c, paths: pathsFromA)
//for edge in path {
//    print("\(edge.source) --|\(edge.weight ?? 0.0)|--> \(edge.destination)")
//}

import UIKit
import PlaygroundSupport

// Create a view to display the result in playground
let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view;

//: Add a CAShapeLayer to it, configure its line & fill colors
let shape = CAShapeLayer()
shape.frame = view.bounds.insetBy(dx: 10, dy: 10)
shape.fillColor = UIColor.orange.withAlphaComponent(0.3).cgColor
shape.strokeColor = UIColor.orange.cgColor
shape.lineWidth = 3
view.layer.addSublayer(shape)

//: Function to create a BezierPath drawing a 4-branches star
func star(center: CGPoint, ray: CGFloat, curvature: CGPoint) -> UIBezierPath {
  // Build a ✧ star
  var path = UIBezierPath()
  path.move(to: CGPoint(x: center.x+ray, y: center.y))
  path.addQuadCurve(to: CGPoint(x: center.x, y: center.y+ray), controlPoint: CGPoint(x: center.x-curvature.y, y: center.y-curvature.x))
  path.addQuadCurve(to: CGPoint(x: center.x-ray, y: center.y), controlPoint: CGPoint(x: center.x+curvature.x, y: center.y-curvature.y))
  path.addQuadCurve(to: CGPoint(x: center.x, y: center.y-ray), controlPoint: CGPoint(x: center.x+curvature.y, y: center.y+curvature.x))
  path.addQuadCurve(to: CGPoint(x: center.x+ray, y: center.y), controlPoint: CGPoint(x: center.x-curvature.x, y: center.y+curvature.y))
  return path
}

let star1 = star(center: view.center, ray: 200, curvature: CGPoint(x: 250, y: -20))
let star2 = star(center: view.center, ray: 200, curvature: CGPoint(x: -20, y: 250))

//: Start with star1
shape.path = star1.cgPath

//: Create the animation from star1 to star2 (infinitely repeat, autoreverse)
let animation = CABasicAnimation(keyPath: "path")
animation.toValue = star2.cgPath
animation.duration = 1
animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
animation.fillMode = CAMediaTimingFillMode.both
animation.repeatCount = .greatestFiniteMagnitude // Infinite repeat
animation.autoreverses = true
animation.isRemovedOnCompletion = false

shape.add(animation, forKey: animation.keyPath)
