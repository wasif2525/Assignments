import UIKit

var scores: [Int] = [4, 7, 9, 3, 2]
print(scores)
print(scores.sorted())

let avgScore = 5
let goodScore = 8

var i = 0
while i < scores.count {
    
    if scores[i] >= goodScore {
        print("Score \(scores[i]) is a good score")
    }
    else if scores[i] >= avgScore {
        print("Score \(scores[i]) is an averge score")
    }
    else {
        print("Score \(scores[i]) is not a good score")
    }
    i += 1
}

var mixArray: [Any] = [1, "Hello", true, 4.5]
mixArray.append("Assignment 2")
print(mixArray)

for (index, element) in mixArray.enumerated() {
    print("Index: \(index), Element: \(element)")
}

mixArray.remove(at: 2)
print(mixArray)

