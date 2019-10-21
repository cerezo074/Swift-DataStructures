// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

struct PriorityQueue<Element: Equatable>: Queue {

    private var heap: Heap<Element>
    typealias SortHeap = (Element, Element) -> Bool

    init(sort: @escaping SortHeap, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

    var peek: Element? {
        return heap.peek()
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    mutating func dequeue() -> Element? {
        return heap.remove()
    }

}
//
//var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
//
//while !priorityQueue.isEmpty {
//    print(priorityQueue.dequeue()!)
//}

//func quickSort<Element: Comparable>(elements: [Element]) -> [Element] {
//    if elements.count == 0 {
//        return elements
//    }
//
//    let randomPivot: Int = Int.random(in: 0..<elements.count)
//
//    let pivotElement = elements[randomPivot]
//    var smallerElements: [Element] = []
//    var biggerElements: [Element] = []
//
//    for (index, element) in elements.enumerated() {
//        guard index != randomPivot else { continue }
//
//        if element < pivotElement {
//            smallerElements.append(element)
//        } else {
//            biggerElements.append(element)
//        }
//    }
//
//    return quickSort(elements: smallerElements) + [pivotElement] + quickSort(elements: biggerElements)
//}

/*
 Challenge 1

 You have learned to use a heap to construct a priority queue by conforming to the Queue protocol. Now, construct a priority queue using an Array.
 */

//struct PriorityQueue<Element: Equatable>: Queue {
//
//    typealias SortHeap = (Element, Element) -> Bool
//    private let sort: SortHeap
//    private var elements: [Element]
//
//    init(sort: @escaping SortHeap, elements: [Element] = []) {
//        self.elements = elements.sorted(by: sort)
//        self.sort = sort
//    }
//
//    var peek: Element? {
//        return elements.first
//    }
//
//    var isEmpty: Bool {
//        return elements.isEmpty
//    }
//
//    mutating func enqueue(_ element: Element) -> Bool {
//        let elementIndex = findIndex(for: element)
//
//        if elementIndex == elements.count {
//            elements.append(element)
//        } else {
//            elements.insert(element, at: elementIndex)
//        }
//
//        return true
//    }
//
//    mutating func dequeue() -> Element? {
//        guard !elements.isEmpty else { return nil }
//        return elements.removeFirst()
//    }
//
//    func findIndex(for element: Element) -> Int {
//        var elementIndex: Int = elements.count
//        for (index, item) in elements.enumerated() {
//            if sort(element, item) {
//                elementIndex = index
//                break
//            } else {
//                continue
//            }
//        }
//
//        return elementIndex
//    }
//
//}

//var priorityQueue = PriorityQueue(sort: <, elements: [1,12,3,4,1,6,8,7])
//
//while !priorityQueue.isEmpty {
//    print(priorityQueue.dequeue()!)
//}

/*
 Challenge 2

 Your favorite T-Swift concert was sold out. Fortunately there is a waitlist for people who still want to go! However the ticket sales will first prioritize someone with a military background, followed by seniority. Write a sort function that will return the list of people on the waitlist by the priority mentioned. The Person struct is provided below:

 public struct Person: Equatable {
   let name: String
   let age: Int
   let isMilitary: Bool
 }
 */
public struct Person: Equatable {
  let name: String
  let age: Int
  let isMilitary: Bool
}

let persons: [Person] = [
    Person(name: "Esteban", age: 31, isMilitary: false),
    Person(name: "Jaime", age: 18, isMilitary: false),
    Person(name: "Ramon", age: 40, isMilitary: true),
    Person(name: "Forest Gump", age: 50, isMilitary: true),
    Person(name: "Casemiro", age: 22, isMilitary: false),
    Person(name: "Lina Tejeiro", age: 28, isMilitary: false),
    Person(name: "Carme del Viboral", age: 28, isMilitary: true),
    Person(name: "Jaime Garzon", age: 50, isMilitary: false),
    Person(name: "Fausto Asprilla", age: 45, isMilitary: false),
]

// Prioritize military by age in case we have both as military
var priorityQueue: PriorityQueue<Person> = PriorityQueue(sort: { (leftPerson, rightPerson) -> Bool in
    if leftPerson.isMilitary && !rightPerson.isMilitary {
        return true
    } else if leftPerson.isMilitary && rightPerson.isMilitary {
        return leftPerson.age >= rightPerson.age
    } else if !leftPerson.isMilitary && !rightPerson.isMilitary {
        return leftPerson.age >= rightPerson.age
    } else {
        return false
    }
}, elements: persons)

// Prioritize when is not military by age in case we have both as no military
//var priorityQueue: PriorityQueue<Person> = PriorityQueue(sort: { (rightPerson, leftPerson) -> Bool in
//    if leftPerson.isMilitary && !rightPerson.isMilitary {
//        return true
//    } else if leftPerson.isMilitary && rightPerson.isMilitary {
//        return leftPerson.age >= rightPerson.age
//    } else if !leftPerson.isMilitary && !rightPerson.isMilitary {
//        return leftPerson.age >= rightPerson.age
//    } else {
//        return false
//    }
//}, elements: persons)

while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue()!)
}
