//: [Previous](@previous)

import Foundation

struct Item {
    let name: String
    let weight: Int
    let value: Float
}

extension Item: CustomStringConvertible {
    
    var description: String {
        return "name: \(name), weight: \(weight), value: \(value)"
    }
    
}

func knapsack(items: [Item], maxCapacity: Int) -> [Item] {
    //build up dynamic programming table, initialize table - overshooting in size
    var colums: [Float] = [Float](repeating: 0.0, count: maxCapacity + 1)
    var table: [[Float]] = [[Float]](repeating: colums, count: items.count + 1)
    
    for (i, item) in items.enumerated() {
        for capacity in 1...maxCapacity {
            let previousItemsValue = table[i][capacity]
            // item fits in knapsack
            if capacity >= item.weight {
                let valueFreeingWeightForItem = table[i][capacity - item.weight]
                //only take if more valuable than previous combo
                table[i + 1][capacity] = max(valueFreeingWeightForItem + item.value, previousItemsValue)
                
                // no room for this item
            } else {
                //use prior combo
                table[i + 1][capacity] = previousItemsValue
            }
        }
    }
    
    // figure out solution from table
    var solution: [Item] = [Item]()
    var capacity = maxCapacity
    // work backwards
    for i in stride(from: items.count, to: 0, by: -1) {
        if table[i - 1][capacity] != table[i][capacity] {
            // did we use this item?
            solution.append(items[i - 1])
            capacity -= items[i - 1].weight
            // if we used an item, remove its weight
        }
    }
    return solution
}

let items = [Item(name: "television", weight: 50, value: 500),
    Item(name: "candlesticks", weight: 2, value: 300),
    Item(name: "stereo", weight: 35, value: 400),
    Item(name: "laptop", weight: 3, value: 1000),
    Item(name: "food", weight: 15, value: 50),
    Item(name: "clothing", weight: 20, value: 800),
    Item(name: "jewelry", weight: 1, value: 4000),
    Item(name: "books", weight: 100, value: 300),
    Item(name: "printer", weight: 18, value: 30),
    Item(name: "refrigerator", weight: 200, value: 700),
    Item(name: "painting", weight: 10, value: 1000)]

for item in knapsack(items: items, maxCapacity: 75) {
    print(item)
}
