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


var nums: Set = [1, 2, 3, 4, 4]
print(nums)

nums.insert(-3)
nums.insert(5)
print(nums)

var stringSet: Set<String> = ["Mac", "John", "Chris", "c"]
var anotherSet: Set = ["a", "c"]

//common element between the two sets
var commonElement = stringSet.intersection(anotherSet)
print(commonElement)

var all = stringSet.union(anotherSet)
print(all)

var withoutIntersection = all.subtracting(commonElement)
print(withoutIntersection)

for (index, element) in stringSet.enumerated() {
    print("\(index):\(element)")
}

var newDict: [String: Int] = ["James":4, "John":5, "Chris":6]
print(newDict)
print(newDict["John"] ?? "Value Not found")

if let value = newDict["John"] {
    print(value)
}

newDict["James"] = 10
newDict["Alex"] = 10
newDict["Shaun"] = nil
print(newDict)
print(newDict["Shaun"] ?? "The value is nil for this key")

var name = "James"
@MainActor func useGuard() {
    guard let value = newDict[name] else {
        print("\(name) is not in the dictionary")
        return
    }
    print(value)
}
useGuard()

for (key, val) in newDict {
    if val == 10 {
        print("Found \(key), for whom the value is \(val)")
    }
}
    

print(newDict.keys)



