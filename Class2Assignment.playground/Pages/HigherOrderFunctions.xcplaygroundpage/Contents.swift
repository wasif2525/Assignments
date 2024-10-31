//: [Previous](@previous)

import Foundation

print("---Map---")
let names = ["Alice", "John", "Steve"]
let greetings = names.map{"Hello, \($0)!" }
print(greetings)

let nums = [1, 2, 3]
let numsDouble = nums.map{ $0 * 2 }
print(numsDouble)

print("---Filter---")
struct Employee{
    var name: String
    var empId: Int
}

let team: [Employee] = [Employee(name: "John", empId: 1),
                        Employee(name: "Shaun", empId: 2),
                        Employee(name: "Jennifer", empId: 3)]

let filteredTeam: [Employee] = team.filter{ $0.name.contains("a") }
print(filteredTeam.map{ $0.name })

print("---Sort")
let grades = [90, 80, 70, 60, 50]
let sortedGrades = grades.sorted()
let sortedGrades2 = grades.sorted(by: >)
print(sortedGrades)
print(sortedGrades2)

let wordsToSort = ["apple", "Banana", "cherry", "Orange"]
let sortedCase = wordsToSort.sorted { $0 < $1 }
let sortedIgnoreCase = wordsToSort.sorted { $0.lowercased() < $1.lowercased() }

print(sortedCase)
print(sortedIgnoreCase)

print("---FlatMap")
let numbers = [[1, 2], [7, 3], [4, 5], [9, 8]]
let evenNumbers = numbers.flatMap{ $0 }.filter{ $0 % 2 == 0 }
//let evenNumbersFiltered = evenNumbers.filter{ $0 % 2 == 0 }
print(evenNumbers)

let studentCourses = [
    ["Math", "Science"],
    ["History", "Art"],
    ["Physics", "Chemistry"]
]
let allSubs = studentCourses.flatMap{ $0 }
print(allSubs)

print("---Compact Map")
let mixedValues = ["23", "Hello", "10", "Swift"]
let validNumbers = mixedValues.compactMap { Int($0) }
print(validNumbers)

let possibleNumbers: [Int?] = [1, nil, 3, nil, 6, 8]
let evenNonNilNumbers = possibleNumbers.compactMap { $0 }.filter { $0 % 2 == 0 }
print(evenNonNilNumbers)

print("---forEach")
let languages: [String] = ["javaScript", "Swift", "Python", "Kotlin"]

languages.enumerated().forEach {index, language in
    print("\(index): \(language)")
}
print("---forEach in Dictionary")
let basket: [String: Int] = ["apple": 4, "banana": 6, "orange": 0]
basket.forEach{ key, val in
    if val == 0{
        print("\(key) out of stock")
    } else{
        print("\(val) \(key)(s) in stock")
    }
}

print("---Reduce")
let nums2 = [2, 3, 4, 5, 6]
//array.reduce(initialValue) { accumulator, element in
//    // combine accumulator and element
//}
let sumOfAll = nums2.reduce(0, +)
print(sumOfAll)

let sumOfAll2 = nums2.reduce(0) { $0 + $1 }
print(sumOfAll2)
//So here:
//
//$0 represents the current total (accumulator),
//$1 represents each number in nums2 as we loop through it,
//and they’re added together.

print("---Reduce more examples")
let wordList = ["Trying", "To", "Learn", "Programming", "Languages"]
let longestWord = wordList.reduce(""){ currentLongest, word in
    var newLongest = currentLongest
    if word.count > newLongest.count{
        newLongest = word
    }
    return newLongest
}
print(longestWord)

//using shorthand notations
print("--Reduce word count using shorthand notations")
//$0 -> current longest / accumulator
//$1 -> each word
let longestWord2 = wordList.reduce(""){ $0.count > $1.count ? $0 : $1 }
print(longestWord2)

let longestWord3 = wordList.reduce("") {currentLongest, word in
    return word.count > currentLongest.count ? word : currentLongest
}
print(longestWord3)

print("--Reduce concatenating strings")
let cities = ["San Jose", "Miami", "Las Vegas", "Atlanta", "Dallas"]
let concatenatedCities = cities.reduce("Cities:"){ $0 + " " + $1 }
print(concatenatedCities)



let cities2 = ["San Jose", "Miami", "Las Vegas", "Atlanta", "Dallas"]
let concatenatedCities2 = cities2.reduce("Cities: "){ accumulator, city in
    return accumulator == "Cities: " ? accumulator + city : accumulator + ", " + city
}
print(concatenatedCities2)









