import Foundation

protocol Device {
    var isOn: Bool { get set }
    var batteryLevel: Int { get set }
    mutating func turnOn()
    mutating func turnOff()
    func batteryStatus() -> String
}

// Extension for default method implementation in `Device`
extension Device {
    mutating func turnOn() {
        guard !isOn else {
            print("Device is already on.")
            return
        }
        print("Turning on device...")
        isOn = true
    }
    
    mutating func turnOff() {
        guard isOn else {
            print("Device is already off.")
            return
        }
        print("Turning off device...")
        isOn = false
    }
}

// Struct for a specific device conforming to protocol
struct SmartLamp: Device {
    var isOn: Bool = false
    var batteryLevel: Int
    
    mutating func updateBatteryLevel(_ level: Int) {
        batteryLevel = level
    }
    
    func batteryStatus() -> String {
        return batteryLevel > 20 ? "Battery level is sufficient." : "Battery is low. Please recharge soon."
    }
}

var myLamp = SmartLamp(batteryLevel: 50)
myLamp.turnOn()
print(myLamp.batteryStatus())
print()
print("Used lamp for a while...")
print()
myLamp.updateBatteryLevel(08)
print(myLamp.batteryStatus())
myLamp.turnOff()

