import Foundation

func printMyData() {
    print("Hello, World!")
}
printMyData()

//function accepts a parameter
func displayNames(name: String) {
    print("Name is \(name)")
}
displayNames(name: "Ken")

//multiple arguments
func displayNames(name: String, zipCode: Int) {
    print("Name is \(name)")
    print("zipCode is \(zipCode)")
}

displayNames(name: "Wasif", zipCode: 30106)

//without having to say the variable name

func displayNames(_ name: String, _ zipCode: Int) {
    print("Name is \(name)")
    print("zipCode is \(zipCode)")
}

displayNames("Zain", 93106)

//optional parameter
func addition(_ num1: Int, _ num2: Int? = 0){
    let sum = num1 + (num2 ?? 0)
    print(sum)
}

addition(10, nil)

//return some value from a function

func multiply(_ num1: Int, _ num2: Int) -> Int {
    let multiplication = num1 * num2
    return multiplication
}

let res = multiply(10, 20)
print(res)

//inout parameter, so no need to return but still can access
func makeSquare(num: inout Int) {
    num = num * num
}

//must use a variable, by default it's let, we are doing the calc in the address
var x = 3
makeSquare(num: &x)
print(x)

//returning multiple stuff using a tuple
//tuples -> light weight data structure that allows us to group multiple values
//into singular value
print()
print("----Tuples----")
let myTuple: (Int, String) = (100, "abc")
print(myTuple)
print(myTuple.0)
print(myTuple.1)

let person: (name: String, age: Int, isMarried: Bool) = ("Taylor", 2, true)
print(person)
print(person.age)
print(person.name)

print()
let nestedTuple: (Int, (Int, String)) = (100, (200, "xyz"))
print(nestedTuple)
print(nestedTuple.0)
print(nestedTuple.1)
print(nestedTuple.1.0)
print(nestedTuple.1.1)

func doApiCall(url: String) -> (String, Bool, Int) {
    return ("Success", true, 200)
}
print()

let output = doApiCall(url: "www.asasa.com/api/v1")
print(output)





