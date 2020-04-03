
/*:
 ## This is a demo task.

 Write a function:

 public func **solution(_ A : inout [Int]) -> Int** that, given an array A of N integers,
 returns the smallest positive integer (greater than 0) that does not occur in A. For example:
 
 \
 Given A = [1, 3, 6, 4, 1, 2], the function should return 5.
 
 \
 Given A = [1, 2, 3], the function should return 4. Given A = [−1, −3], the function should return 1.
 
 \
 Write an efficient algorithm for the following assumptions:
 - N is an integer within the range [1..100,000]
 - Each element of array A is an integer within the range [−1,000,000..1,000,000].
 
 */

public func solution(_ A : inout [Int]) -> Int {
    let uniqueIntegers: Set<Int> = Set(A)
    var maxNumber = uniqueIntegers.max() ?? 1
    if maxNumber < 0 {
        maxNumber = 1
    }
    
    for number in 1...maxNumber {
        if !uniqueIntegers.contains(number) {
            return number
        }
    }
    
    return maxNumber + 1
}

var array: [Int] = [-1, -3]
print(solution(&array) == 1)
