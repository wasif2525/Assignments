import Foundation

// Protocol for perimeter
protocol PerimeterCalculable {
    associatedtype Perimeter
    mutating func calculatePerimeter() -> Perimeter
}

struct Square: PerimeterCalculable {
    var side: Double
    typealias Perimeter = Double
    
    mutating func calculatePerimeter() -> Perimeter {
        return 4 * side
    }
}

struct Rectangle: PerimeterCalculable {
    var width: Double
    var height: Double
    typealias Perimeter = Double
    
    mutating func calculatePerimeter() -> Perimeter {
        return 2 * (width + height)
    }
}

var square = Square(side: 4)
print("Square perimeter: \(square.calculatePerimeter())")

var rectangle = Rectangle(width: 3, height: 5)
print("Rectangle perimeter: \(rectangle.calculatePerimeter())")



protocol PairProtocol {
    associatedtype First
    associatedtype Second
    var first: First { get }
    var second: Second { get }
}

struct Pair<A, B>: PairProtocol {
    var first: A
    var second: B
}

let intStringPair = Pair(first: 1, second: "One")
print("First: \(intStringPair.first), Second: \(intStringPair.second)")

let doubleBoolPair = Pair(first: 3.14, second: true)
print("First: \(doubleBoolPair.first), Second: \(doubleBoolPair.second)")
