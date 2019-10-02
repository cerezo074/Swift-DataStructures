import Foundation

public class Trie<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {

    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}

    public private(set) var collections: Set<CollectionType> = []

}

public extension Trie {

    var count: Int {
        return collections.count
    }

    var isEmpty: Bool {
        return collections.isEmpty
    }

    func insert(_ collection: CollectionType) {
        var current = root

        for element in collection {
            if current.children[element] == nil {
                current.children[element] =  Node(key: element, parent: current)
            }

            current = current.children[element]!
        }

        current.isTerminating = true
        collections.insert(collection)
    }

    func contains(_ collection: CollectionType) -> Bool {
        var current = root

        for element in collection {
            guard let child = current.children[element] else {
                return false
            }

            current = child
        }

        return current.isTerminating
    }

    func remove(_ collection: CollectionType) {
        var current = root

        for element in collection {
            guard let child = current.children[element] else {
                return
            }

            current = child
        }

        guard current.isTerminating else {
            return
        }

        collections.remove(collection)
        current.isTerminating = false

        while let parent = current.parent,
            current.children.isEmpty,
            !current.isTerminating {
                parent.children[current.key!] = nil
                current = parent
        }
    }

}

public extension Trie where CollectionType: RangeReplaceableCollection {

    func collections(startWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }

            current = child
        }

        return collections(startingWith: prefix, after: current)
    }

    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var results: [CollectionType] = []

        if node.isTerminating {
            results.append(prefix)
        }

        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }

        return results
    }

}