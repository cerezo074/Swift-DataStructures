// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var tree: BinaryNode<Int> {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    let twelve = BinaryNode(value: 12)
    let thirdteen = BinaryNode(value: 13)

    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    five.leftChild = twelve
    twelve.rightChild = thirdteen
    
    return seven
}

var tree2: BinaryNode<Int> {
    let fifthTeen = BinaryNode(value: 15)
    let ten = BinaryNode(value: 10)
    let five = BinaryNode(value: 5)
    let sevenTeen = BinaryNode(value: 17)
    let twentyFive = BinaryNode(value: 25)
    let twelve = BinaryNode(value: 12)

    fifthTeen.leftChild = ten
    fifthTeen.rightChild = twentyFive
    ten.leftChild = five
    ten.rightChild = twelve
    twentyFive.leftChild = sevenTeen

    return fifthTeen
}

example(of: "tree diagram") {
    print(tree)
}

//example(of: "Traverse in order") {
//    tree.traverseInOrder(visit: { print($0) })
//}
//
//example(of: "Traverse pre order") {
//    tree.traversePreOrder(visit: { print($0) })
//}

//example(of: "Traverse post order") {
//    tree.traversePostOrder(visit: { print($0) })
//}

//example(of: "Result of challenge 1, Tree Height") {
//    print("Three height: \(tree.height)")
//}

//example(of: "Serialization & Deserialization") {
//    var serializedTree = BinaryNode.serialize(rootNode: tree2)
//    print("\n\nSerialization")
//    print(serializedTree)
//
//    if let treeDeserialized = BinaryNode.deserialize(values: &serializedTree) {
//        print("\n\nDeserialization")
//        print(treeDeserialized)
//    }
//}

example(of: "Second diagram") {
    BinaryNode.diagram2(for: tree)
}
