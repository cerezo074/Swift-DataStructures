// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

var exampleTree2: BinaryNode<Int> {
    let treeNode = BinaryNode<Int>(value: 3)
    let oneNode = BinaryNode<Int>(value: 1)
    let fourNode = BinaryNode<Int>(value: 4)
    let zeroNode = BinaryNode<Int>(value: 0)
    let twoNode = BinaryNode<Int>(value: 2)
    let fiveNode = BinaryNode<Int>(value: 5)
    
    treeNode.leftChild = oneNode
    treeNode.rightChild = fourNode
    oneNode.leftChild = zeroNode
    oneNode.rightChild = twoNode
    fourNode.rightChild = fiveNode
    
    return treeNode
}

//example(of: "Building a BST") {
//    print(exampleTree)
//}
//
//example(of: "finding a node") {
//    let target: Int = 7
//    if exampleTree.contains2(value: target) {
//        print("Found \(target)!")
//    } else {
//        print("Couldn't find \(target)")
//    }
//}
//
//example(of: "Removing a node") {
//    var tree = exampleTree
//    print("Tree before removal")
//    print(tree)
//    tree.remove(value: 4)
//    print("Tree after removing root:")
//    print(tree)
//}

example(of: "Challenge, check if a Binary Tree is BST") {
    print(exampleTree2)
    print(exampleTree2.isBST)
}
