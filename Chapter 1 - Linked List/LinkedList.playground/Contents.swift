// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "creating and linking nodes") {
    var list: LinkedList<Int> = LinkedList()
    list.append(1)
    list.append(2)
    list.append(3)
    list.insert(1000, at: 4)
    
    print("Before inserting: \(list)")
    guard let middleNode = list.node(at: 1) else {
        print("Invalid node, returned from list")
        return
    }
    
    for _ in 1...4 {
        let insertedNode = list.insert(value: -1, after: middleNode)
    }
    
    print("After inserting: \(list)")
}
