import Foundation

public class TreeNode<T: Equatable> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

public extension TreeNode {
    
    func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        
        while let child = queue.dequeue() {
            visit(child)
            child.children.forEach { queue.enqueue($0) }
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachLevelOrder {
            if $0.value == value {
                result = $0
            }
        }
        
        return result
    }

}

public extension TreeNode {
    
    func printChallenge() {
        var output: String = ""
        var level: Int = 0
        var queue = Queue<TreeNode>()
        queue.enqueue(self)

        while !queue.isEmpty {
            var nodeLeftCurrentLevel: Int = queue.count
            output.append("Level \(level): ")
            while nodeLeftCurrentLevel > 0 {
                guard let node = queue.dequeue() else { break }
                output.append(contentsOf: "\(node.value) ")
                node.children.forEach { queue.enqueue($0) }
                nodeLeftCurrentLevel -= 1
            }

            level += 1
            output.append("\n")
        }

        print(output)
    }
    
}
