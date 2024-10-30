// protocol for an electronic device
protocol Device {
    var brand: String { get }
    func powerOn()
}

// Protocol Inheritance
protocol Callable: Device {
    func makeCall(to number: String)
}

protocol MusicPlayable: Device {
    func playMusic(track: String)
}

typealias SmartDeviceTask = Callable & MusicPlayable

protocol SmartDevice: SmartDeviceTask {
    func browseInternet(url: String)
}

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
