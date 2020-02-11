import UIKit

//Active and Inactive cells after k Days
//https://www.geeksforgeeks.org/active-inactive-cells-k-days/

func cellCompete(states:[Int], days:Int) -> [Int]
{
    var newStates = states
    let lastIndex = states.count - 1
    let startIndex = 0

    for _ in startIndex..<days {
        var previousState = 0

        for currentIndex in startIndex...lastIndex {
            let currentValue = newStates[currentIndex]
            let nextIndex = currentIndex + 1

            if currentIndex == 0 {
                newStates[currentIndex] = cellState(leftNeighbour: previousState,
                                                    rightNeighbour: newStates[nextIndex])
            } else if currentIndex > startIndex, currentIndex < lastIndex {
                newStates[currentIndex] = cellState(leftNeighbour: previousState,
                                                    rightNeighbour: newStates[nextIndex])
            } else {
                newStates[currentIndex] = cellState(leftNeighbour: previousState,
                                                    rightNeighbour: 0)
            }

            previousState = currentValue
        }

    }

    return newStates
}
// FUNCTION SIGNATURE ENDS

func cellState(leftNeighbour: Int, rightNeighbour: Int) -> Int {
    return leftNeighbour == rightNeighbour ? 0 : 1
}

print(cellCompete(states: [0, 1, 0, 1, 0, 1, 0, 1], days: 1))
print(cellCompete(states: [0, 1, 0, 1, 0, 1, 0, 1], days: 3))

