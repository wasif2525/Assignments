let fuelLevel = 80
let minimumRequiredFuel = 90

if fuelLevel >= minimumRequiredFuel {
    print("Fuel check complete! Ready for launch.")
} else if fuelLevel >= 50 {
    print("Fuel level is sufficient for a short mission. Consider refueling.")
} else {
    print("Warning: Insufficient fuel. Abort launch and refuel immediately!")
}

//Switch statements

let weatherCondition = "rainy"

switch weatherCondition {
case "sunny":
    print("Wear light clothing and sunglasses.")
case "rainy":
    print("Bring an umbrella and wear a raincoat.")
case "snowy":
    print("Wear a warm coat, gloves, and a hat.")
case "windy":
    print("Wear a windbreaker and secure loose items.")
default:
    print("Weather condition unknown. Dress appropriately.")
}

