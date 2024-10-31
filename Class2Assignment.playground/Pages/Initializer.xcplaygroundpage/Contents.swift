import Foundation

class Car {
    var make: String = "Toyota"
    var model: String = "Corolla"
    var year: Int = 2023
}

let defaultCar = Car()
print("--Default Init with default values")
print(defaultCar.make)
print(defaultCar.model)

class Car2 {
    var make: String = ""
    var model: String = ""
    var year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
}
let defaultCar2 = Car2(make: "Toyota", model: "Corolla", year: 2022)
print(defaultCar2.year)

//2. Memberwise Initializer (Struct-only)
print("--Memberwise Initializer")
struct Book {
    var title: String
    var author: String
    var pages: Int
}

let book = Book(title: "Swift Essentials", author: "Alex Tan", pages: 300)
print(book.title)

//3. Convenience Initializer
print("---Convenience Initializer")
class House {
    var rooms: Int
    var area: Double

    // Primary initializer
    init(rooms: Int, area: Double) {
        self.rooms = rooms
        self.area = area
    }

    // Convenience initializer
    convenience init(rooms: Int) {
        self.init(rooms: rooms, area: 100.0)
    }
}

let bigHouse = House(rooms: 5, area: 250.0)
let smallHouse = House(rooms: 2)
print(bigHouse.area)
print(smallHouse.area)


//4. Failable Initializer
print("---Failable Initializer")
class Phone {
    var brand: String
    var price: Double

    init?(brand: String, price: Double) {
        if price < 0 {
            return nil // Fails initialization if the price is negative
        }
        self.brand = brand
        self.price = price
    }
}

let validPhone = Phone(brand: "Apple", price: 999.99)
print(validPhone?.brand) // Output: Apple

let invalidPhone = Phone(brand: "Samsung", price: -1000)
print(invalidPhone?.brand) // Output: nil

// Required Init
print("---Required Initializer")

class Teacher {
    var dept: String
    var noOfSubs: Int
    
    init(dept: String, noOfSubs: Int) {
        self.dept = dept
        self.noOfSubs = noOfSubs
    }
}

class SportsTeacher: Teacher {
    var favSport: String

    // Primary initializer in subclass
    init(dept: String, noOfSubs: Int, favSport: String) {
        self.favSport = favSport
        super.init(dept: dept, noOfSubs: noOfSubs)
    }
    
    // Required initializer 
    required override init(dept: String, noOfSubs: Int) {
        self.favSport = "Unknown Sport"
        super.init(dept: dept, noOfSubs: noOfSubs)
    }
}

let sportsTeacher = SportsTeacher(dept: "Physical Education", noOfSubs: 3, favSport: "Basketball")
print(sportsTeacher.favSport) // Output: Basketball

let generalTeacher = SportsTeacher(dept: "Science", noOfSubs: 4)
print(generalTeacher.favSport) // Output: Unknown Sport










