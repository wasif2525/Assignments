import Foundation

enum GameLevel: Int {
    case beginner = 1
    case amateur
    case intermediate
    case advanced
    case expert = 10
    case master
}
print("---Game level Enums---")
print(GameLevel.advanced.rawValue)
print(GameLevel.master.rawValue)

enum LibrarySection: String, CaseIterable {
    case fiction = "Books that explore imaginative storytelling"
    case nonFiction = "Books based on factual information"
    case reference = "Encyclopedias, dictionaries, and handbooks"
    case children = "Books for younger readers"
    
    func description(){
        print("Section: \(self.rawValue)")
    }
}

print("---Enum Library Section---")
for section in LibrarySection.allCases {
    print(section.rawValue)
    print("-The Description-")
    section.description()
}
//Associated Type Enum
enum PaymentStatus {
    case success(amount: Double)
    case failed(reason: String)
    case pending(id: String)

    func paymentMessage() -> String {
        switch self {
        case .success(let amount):
            return "Payment succeeded with amount: $\(amount)"
        case .failed(let reason):
            return "Payment failed due to: \(reason)"
        case .pending(let id):
            return "Payment with ID \(id) is pending"
        }
    }
}
print("---Payment enum---")
let payment1 = PaymentStatus.success(amount: 150.0)
let payment2 = PaymentStatus.failed(reason: "Insufficient funds")
let payment3 = PaymentStatus.pending(id: "AB12345")

print(payment1.paymentMessage())
print(payment2.paymentMessage())
print(payment3.paymentMessage())

enum WeatherCondition: CaseIterable {
    case sunny
    case rainy
    case snowy
    case cloudy
    
    //computed property allowed
    var advice: String {
        switch self {
        case .sunny:
            return "Wear sunglasses and stay hydrated."
        case .rainy:
            return "Take an umbrella with you."
        case .snowy:
            return "Wear warm clothes and be cautious on the road."
        case .cloudy:
            return "It might rain today, keep an umbrella handy."
        }
    }
}
print("---Weather Enum---")
for condition in WeatherCondition.allCases {
    print("\(condition): \(condition.advice)")
}

enum FlightStatus {
    case onTime(departureTime: String)
    case delayed(delayReason: String, delayDuration: Int)
    case cancelled(reason: String)
    case boarding(gate: String)
}

func getFlightDetails(for status: FlightStatus) {
    switch status {
    case .onTime(let departureTime):
        print("The flight is on time and will depart at \(departureTime).")
    case .delayed(let reason, let duration):
        print("The flight is delayed due to \(reason). Expected delay: \(duration) minutes.")
    case .cancelled(let reason):
        print("The flight has been cancelled. Reason: \(reason)")
    case .boarding(let gate):
        print("The flight is now boarding at gate \(gate).")
    }
}

print("---Flight Statuses enum---")
getFlightDetails(for: .onTime(departureTime: "12:30 PM"))
getFlightDetails(for: .delayed(delayReason: "bad weather", delayDuration: 45))
getFlightDetails(for: .cancelled(reason: "technical issues"))
getFlightDetails(for: .boarding(gate: "A12"))


