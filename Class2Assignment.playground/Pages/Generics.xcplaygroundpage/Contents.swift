//: [Previous](@previous)

import Foundation

func displayData<T>(data: T) {
    print("Display data: \(data)")
}

displayData(data: ["Apple", "Banana", "Cherry"])
displayData(data: Set([10, 20, 30]))
let dict = ["Alex": 25, "Bob": 30 ]
displayData(data: dict)
displayData(data: (name: "Alex", age: 25))

print("---Swapping")
func swapValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var str1 = "Hello"
var str2 = "World"
print("Before swapping: \(str1), \(str2)")
swapValues(a: &str1, b: &str2)
print("After swapping: \(str1), \(str2)")

var dict1 = ["key1": "value1"]
var dict2 = ["key2": "value2"]
print("Before swapping: \(dict1), \(dict2)")
swapValues(a: &dict1, b: &dict2)
print("After swapping: \(dict1), \(dict2)")

print("---Generic Items in class")
class Box<T>{
    var item: T
    init(item: T){
        self.item = item
    }
    func getItem() -> T{
        return item
    }
    func updateItem(newItem: T){
        self.item = newItem
    }
}
let boxOfStrings = Box(item: "Books")
let boxOfNumbers = Box(item: 42)
print("Box contains: \(boxOfStrings.getItem())")
print("Box contains: \(boxOfNumbers.getItem())")
boxOfStrings.updateItem(newItem: "Laptop")
print("Updated box contains: \(boxOfStrings.getItem())")
boxOfNumbers.updateItem(newItem: 100)
print("Updated box contains: \(boxOfNumbers.getItem())")

