// Base protocol for an electronic device
protocol Device {
    var brand: String { get }
    func powerOn()
}

// Protocol for devices that can make calls
protocol Callable: Device {
    func makeCall(to number: String)
}

// Protocol for devices that can play music
protocol MusicPlayable: Device {
    func playMusic(track: String)
}

// Protocol inheriting from both `Callable` and `MusicPlayable`
protocol SmartDevice: Callable, MusicPlayable {
    func browseInternet(url: String)
}

// Implementing `SmartDevice` for a Smartphone struct
struct Smartphone: SmartDevice {
    let brand: String

    func powerOn() {
        print("\(brand) smartphone is powering on.")
    }

    func makeCall(to number: String) {
        print("Calling \(number) from \(brand) smartphone.")
    }

    func playMusic(track: String) {
        print("Playing \(track) on \(brand) smartphone.")
    }

    func browseInternet(url: String) {
        print("Browsing \(url) on \(brand) smartphone.")
    }
}

let myPhone = Smartphone(brand: "TechBrand")
myPhone.powerOn()
myPhone.makeCall(to: "123-456-7890")
myPhone.playMusic(track: "Favorite Song")
myPhone.browseInternet(url: "www.example.com")
