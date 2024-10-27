import Foundation
//4 Pillars of OOP
//1. Encapsulation - hiding internal details from outside world & restricting direct access (functions or properties both can be private and hidden from outside world)
//2. Abstraction
//3. Inheritance
//4. Polymorphism - multiple behavior under different circumstances based on who is calling it
//polymorphism lets you use the same method or function in different ways depending on the object that is invoking it.

//class
//parent class
class Appliance {
    //properties
    var brand: String
    var powerConsumption: Int
    fileprivate var price: Int = 100 //Encapsulated Property
    
    //initializer
    init(brand: String, powerConsumption: Int, _ price: Int){
        self.brand = brand
        self.powerConsumption = powerConsumption
        self.price = price
        sufficient()
    }
    
    //abstraction - certain functionalities only available internally,
//    abstracting this functionality from outside world
    private func sufficient() {
        print("The \(brand) is in stock")
    }
    
    //methods
    func description() {
        print("The \(brand) appliance consumes \(powerConsumption) watts of power. \nThe price of this appliance is \(price)")
    }
    
    //func for the private var
    func getPrice() -> Int{
        return self.price
    }
    func setPrice(price: Int) {
        guard price > 0 && price <= 100000 else {
            
            if (price <= 0) {
                print("Price cannot be 0 or negative")
            }
            else if (price > 100000) {
                print("The price is too high!")
            }
            return
            
        }
        
        self.price = price
        print("New price is set to \(self.price) for the \(brand) branded machine")
    }
}
let a1 = Appliance(brand: "LG", powerConsumption: 200, 500)
print("---Description---")
a1.description()
print("--Get Price--")
print(a1.getPrice())
print("---Set Price---")
a1.setPrice(price: 1200)


//abstraction using protocol
protocol Machine {
    func turnOn()
    func turnOff()
}

//Inheritance
class CoffeeMachine: Appliance, Machine {
    private var model: String
    var color: String = "Brown"
    
    init(brand: String, powerConsumption: Int, price: Int, model: String) {
        self.model = model
        super.init(brand: brand, powerConsumption: powerConsumption, price)
    }
    
    //Implementation of abstract behaviors
    func turnOn() {
        print("\(brand) Coffee Machine is on")
    }
    
    func turnOff() {
        print("\(brand) Coffee Machine is off")
    }
    
    //method specific to CoffeeMachine itself
    func brewCoffee() {
        print("Brewing coffee on \(brand) \(model)")
    }
    
//    override
    override func description() {
        print("The \(brand) appliance consumes \(powerConsumption) watts of power. \nThe price of this appliance is \(price) The model of this coffee machine is \(model)")
    }
    
}
let c1 = CoffeeMachine(brand: "Nespresso", powerConsumption: 300, price: 62, model: "112B")
print("---Abstraction example using Protocol---")
c1.turnOn()
c1.turnOff()
c1.brewCoffee()
print("---Coffee Machine override description---")
c1.description()
print("---Coffee machine has access to props and methods as it inherits from Appliance----")
c1.setPrice(price: 92)
print(c1.getPrice())

//Classes are reference type
var c2 = c1 // They both share the same memory address, both point to the same memory address
print("---Classes are reference type---")
print("--Initially the color of coffee machine 1: \(c1.color)")
c2.color = "Red"
print("C2 machine color changed to :\(c2.color)")
print("Color of  C1 also: \(c1.color)")



