//: [Previous](@previous)

import Foundation

class MessagingService {
    func sendMessage(content: String) {
        print("Sending message: \(content)")
    }
}

class NotificationSender {
    let service: MessagingService

    // Constructor Injection
    init(service: MessagingService) {
        self.service = service
    }

    func notifyUser(message: String) {
        service.sendMessage(content: message)
    }
}

// Injecting the dependency during initialization
let messagingService = MessagingService()
let notificationSender = NotificationSender(service: messagingService)
notificationSender.notifyUser(message: "You've got a new message!")

class NotificationSender2 {
    var service: MessagingService?
    var msg: String = ""

    func notifyUser() {
        service?.sendMessage(content: msg)
    }
}

// Creating and assigning the dependency to a property after initialization
let notificationSender2 = NotificationSender2()
print("---Property Injection")
notificationSender2.service = messagingService
notificationSender2.notifyUser()
notificationSender2.msg = "Prop has been updated"
notificationSender2.notifyUser()

class NotificationSender3 {
    let service: MessagingService

    init(service: MessagingService) {
        self.service = service
    }

    func notifyUser(message: String) {
        service.sendMessage(content: message)
    }
    func notifyUser2(message: String, msgID: Int) {
        print("The message ID is \(msgID)")
        service.sendMessage(content: message)
    }
}
print("---Method Injection")
let notificationSender3 = NotificationSender3(service: messagingService)
notificationSender3.notifyUser2(message: "System update required", msgID: 4)



