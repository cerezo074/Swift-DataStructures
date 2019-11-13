// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

extension Array where Element == Int {
    
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            
            forEach {
                number in
                let remainigPart = number / digits
                let digit = remainigPart % base
                buckets[digit].append(number)
                
                if remainigPart > 0 {
                    done = false
                }
            }
            
            digits *= base
            self = buckets.flatMap { $0 }
            print(buckets)
        }
    }
    
}

example(of: "radix sort") {
  var array = [88, 410, 1772, 20]
  print("Original array: \(array)")
  array.radixSort()
  print("Radix sorted: \(array)")
}


