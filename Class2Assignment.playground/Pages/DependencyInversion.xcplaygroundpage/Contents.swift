//: [Previous](@previous)

import Foundation

protocol PaymentMethod {
    func processPayment()
}

class CreditCardPayment: PaymentMethod {
    func processPayment() {
        print("Processing credit card payment...")
    }
    
    func checkCreditLimit() {
        print("Checking credit limit...")
    }
    
    func changePin() {
        print("Changing pin...")
    }
}

class PayPalPayment: PaymentMethod {
    func processPayment() {
        print("Processing PayPal payment...")
    }
    func changePaypalPassword(){
        print("Changing PayPal password...")
    }
}

class PaymentProcessor {
    private let paymentMethod: PaymentMethod
    
    init(paymentMethod: PaymentMethod) {
        self.paymentMethod = paymentMethod
    }
    
    func processPayment() {
        paymentMethod.processPayment()
    }
}

let creditCardPayment = CreditCardPayment()
let payPalPayment = PayPalPayment()
print("---Credit card payment---")
let paymentProcessor = PaymentProcessor(paymentMethod: creditCardPayment)
paymentProcessor.processPayment()
print("---Paypal Payment")
let paymentProcessor2 = PaymentProcessor(paymentMethod: payPalPayment)
paymentProcessor2.processPayment()


