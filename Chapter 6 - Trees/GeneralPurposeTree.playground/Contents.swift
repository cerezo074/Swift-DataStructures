// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//example(of: "Creating a tree") {
//    let beverages = TreeNode("Beverages")
//
//    let hot = TreeNode("Hot")
//    let cold = TreeNode("Cold")
//
//    beverages.add(hot)
//    beverages.add(cold)
//}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

var challengeTree: TreeNode<Int> {
    
    let tree = TreeNode(15)
    
    // Second level
    let one = TreeNode(1)
    tree.add(one)
    
    let seventeen = TreeNode(17)
    tree.add(seventeen)
    
    let twenty = TreeNode(20)
    tree.add(twenty)
    
    // Third level
    let one2 = TreeNode(1)
    let five = TreeNode(5)
    let zero = TreeNode(0)
    one.add(one2)
    one.add(five)
    one.add(zero)
    
    let two = TreeNode(2)
    seventeen.add(two)
    
    let five2 = TreeNode(5)
    let seven = TreeNode(7)
    twenty.add(five2)
    twenty.add(seven)

    return tree
}

//example(of: "depth-first traversal") {
//    let tree = makeBeverageTree()
//    tree.forEachDepthFirst(visit: { print($0.value) })
//}

//example(of: "level-order traversal") {
//    let tree = makeBeverageTree()
//    tree.forEachLevelOrder(visit: { print($0.value) })
//}

//example(of: "searching for a node") {
//    let tree = makeBeverageTree()
//
//    if let searchResult1 = tree.search("ginger ale") {
//        print("Found node: \(searchResult1.value)")
//    }
//
//    if let searchResult2 = tree.search("WKD Blue") {
//        print("Found node: \(searchResult2.value)")
//    } else {
//        print("Couldn't find WKD Blue")
//    }
//}

example(of: "Challenge print") {
    challengeTree.printChallenge()
}
