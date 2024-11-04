//: [Previous](@previous)

import Foundation
/*
 Swift uses Automatic Reference Counting (ARC) to manage memory, which works by counting references to each instance of a class. If the count drops to zero, the memory is deallocated.

  Memory Types - 1) Stack, 2) Heap
  1) Stack memory - Last in First out // like stack
  //used in structs, strings, enums, all value types
  //This is also used for storing all local variables, or parameter to function or return types
  //once value returned or work done for that part - data allocated on stack memory is automatically deallocated when usage is done by compiler itself
  //stack memory is fixed size memory
  
  2) Heap memory - Classes, Closures, Actors
  this is allocated at runtime
  Objects like views, arrays of Objects, complicated data will be saved
  
  To do memory management here -> ARC
 */

class Car {
    var brand: String
    init(brand: String) {
        self.brand = brand
        print("\(brand) Car created")
    }
    deinit {
        print("\(brand) Car deallocated")
    }
}

var car1: Car? = Car(brand: "Toyota")
car1 = nil // Setting to nil removes the reference, triggering deallocation

var car2: Car? = Car(brand: "BMW") // 0 + 1
var car3 = car2 // 1 + 1 = 2
car2 = nil // 2 - 1
//not yet deallocated
car3 = nil // 1 - 1 = 0, memory deallocated now

print("---Weak Reference")
var car4: Car? = Car(brand: "Audi")
weak var car5 = car4
print("Before nil, weak variable car5: \(car5?.brand)")
print("Before nil, variable car4: \(car4?.brand)")
print("--Setting weak var car5 to nil")
car5 = nil
print("\(car5?.brand)")
car4 = nil


print("---Unowned Reference")
var car6: Car? = Car(brand: "Mercedes")
unowned var car7 = car6
print("Before nil, unowned variable car7: \(car7?.brand)")
print("Before nil, variable car6: \(car6?.brand)")
print("--Setting unowned var car7 to nil")
car7 = nil
print("\(car7?.brand)")
car6 = nil






