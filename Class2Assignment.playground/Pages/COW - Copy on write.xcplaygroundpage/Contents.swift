//: [Previous](@previous)

import Foundation

var originalDict = ["name": "A", "age": "30"]
var copiedDict = originalDict

print("Before modification:")
print("originalDict: \(originalDict)")
print("copiedDict: \(copiedDict)")

// Modifying copiedDict triggers COW
copiedDict["occupation"] = "Engineer"

print("\nAfter modification:")
print("originalDict: \(originalDict)") // Remains unchanged
print("copiedDict: \(copiedDict)") // Now has an additional key-value pair



print("---Struct Rectangle Example")
struct Rectangle {
    var width: Int
    var height: Int
}

var rect1 = Rectangle(width: 20, height: 10)
var rect2 = rect1

print("Before modification:")
print("rect1: \(rect1)")
print("rect2: \(rect2)")

// Changing rect2 triggers COW
rect2.width = 40

print("\nAfter modification:")
print("rect1: \(rect1)") // Remains with width: 20
print("rect2: \(rect2)") // Now has width: 40



print("---String example")
var string1 = "Hello"
var string2 = string1

print("Before modification:")
print("string1: \(string1)")
print("string2: \(string2)")

// Modifying string2 triggers COW
string2.append(", World!")

print("\nAfter modification:")
print("string1: \(string1)") // Remains "Hello"
print("string2: \(string2)") // Becomes "Hello, World!"

