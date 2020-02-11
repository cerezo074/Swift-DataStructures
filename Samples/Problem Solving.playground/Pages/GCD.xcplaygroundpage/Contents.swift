//: [Previous](@previous)

import Foundation

func generalizedGCD(num:Int, arr:[Int]) -> Int
{
    var allDivisors: Array<Set<Int>> = []

    for number in arr {
        let result: Set<Int> = getDivisors(for: number)
        allDivisors.append(result)
    }

    if allDivisors.isEmpty {
        return 0
    }

    if num == 1 {
        return allDivisors[0].max() ?? 0
    }

    var commonDivisors: Set<Int> = allDivisors[0]

    for index in 1..<allDivisors.count {
        commonDivisors = commonDivisors.intersection(allDivisors[index])
    }

    return commonDivisors.max() ?? 0

}
// FUNCTION SIGNATURE ENDS

func getDivisors(for number: Int) -> Set<Int> {
    guard number != 0 else {
        return []
    }

    var divisors: Set<Int> = []

    for divisor in 1...number {
        if isDivisor(divisor, for: number) {
            divisors.insert(divisor)
        }
    }

    return divisors
}

func isDivisor(_ number: Int, for dividend: Int) -> Bool {
    return dividend % number == 0
}

print(generalizedGCD(num: 5, arr: [2,3,4,5,6]))
