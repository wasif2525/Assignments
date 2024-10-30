import Foundation

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}
print("--Even Numbers--")
for i in 1...10 {
    print("Is \(i) even? \(i.isEven())")
}

//struct
struct Book{
    var title: String
}

extension Book{
    func printTitle(){
        print("Title of the book is \(self.title)")
    }
}
print("---Stuct Book---")
let book1 = Book(title: "The Alchemist")
book1.printTitle()

//practicing extension & enum
extension String{
    enum ValidationResult{
        case valid
        case invalid
    }
    
    func validatePhoneNumber() -> ValidationResult{
        if self.count == 10{
            return .valid
        }
        else {
            return .invalid
        }
    }
}

print("---Phone Number validation---")
let phoneNumber = "4042378290"
switch phoneNumber.validatePhoneNumber(){
case .valid:
    print("\(phoneNumber) is a valid phone number")
case .invalid:
    print("\(phoneNumber) is not valid")
}


