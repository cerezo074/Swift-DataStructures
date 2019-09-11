// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
import XCTest
import Foundation

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

var BSTTree: BinaryNode<Int> {
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

class BSTChallengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testWhenLeftConditionFailsThenTestGetsException() {
        let rootNode = BinaryNode<Int>(value: 3)
        let oneNode = BinaryNode<Int>(value: 1)
        let fourNode = BinaryNode<Int>(value: 4)
        let zeroNode = BinaryNode<Int>(value: 0)
        let twoNode = BinaryNode<Int>(value: 2)
        let fiveNode = BinaryNode<Int>(value: 5)
        
        rootNode.leftChild = oneNode
        rootNode.rightChild = fourNode
        oneNode.leftChild = zeroNode
        oneNode.rightChild = twoNode
        fourNode.leftChild = fiveNode
        
        guard let exception = rootNode.invalidElementForBST() else {
            assertionFailure("Exeption can not be empty")
            return
        }
        
        XCTAssertEqual(exception.side, .left, "\(exception.node.value) node is not greater than parent node")
    }
    
    func testWhenRightConditionFailsThenTestGetsException() {
        let rootNode = BinaryNode<Int>(value: 3)
        let oneNode = BinaryNode<Int>(value: 1)
        let sevenNode = BinaryNode<Int>(value: 7)
        let zeroNode = BinaryNode<Int>(value: 0)
        let twoNode = BinaryNode<Int>(value: 2)
        let fiveNode = BinaryNode<Int>(value: 5)
        
        rootNode.leftChild = oneNode
        rootNode.rightChild = sevenNode
        oneNode.leftChild = zeroNode
        oneNode.rightChild = twoNode
        sevenNode.rightChild = fiveNode
        
        guard let exception = rootNode.invalidElementForBST() else {
            assertionFailure("Exeption can not be empty")
            return
        }
        
        XCTAssertEqual(exception.side, .right, "\(exception.node.value) node is not lesser than parent node")
    }
    
    func testShouldNotGetExepctionWhenTreeIsBST() {
        XCTAssertNil(BSTTree.invalidElementForBST(), "Exeption can not be created from invalidElementForBST api, when tree pass BST conditions")
    }
    
}

BSTChallengeTests.defaultTestSuite.run()
