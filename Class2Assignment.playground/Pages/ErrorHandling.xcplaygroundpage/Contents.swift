import Foundation

enum BankError: Error {
    case insufficientFunds
    case negativeAmount
    case unknownError
}

func withdraw(amount: Double, balance: Double) throws -> Double {
    guard amount > 0 else {
        throw BankError.negativeAmount
    }
    guard amount <= balance else {
        throw BankError.insufficientFunds
    }
    return balance - amount
}

// Try-Catch Block
do {
    let remainingBalance = try withdraw(amount: 200, balance: 150)
    print("Transaction successful! Remaining balance: \(remainingBalance)")
} catch {
    print("Transaction failed:", error.localizedDescription)
    switch error {
    case BankError.insufficientFunds:
        print("You don't have enough funds to complete this transaction.")
    case BankError.negativeAmount:
        print("The withdrawal amount must be greater than zero.")
    case BankError.unknownError:
        print("An unknown error occurred.")
    default:
        print("An error occurred.")
    }
}

enum UserAPIError: Error {
    case invalidURL
    case requestFailed
    case userNotFound
    case unknownError
}

func fetchUserData(userId: Int, completion: @escaping (Data?, UserAPIError?) -> Void) {
    let urlString = "https://dummyjson.com/users/\(userId)"
    guard let url = URL(string: urlString) else {
        completion(nil, .invalidURL)
        return
    }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            completion(nil, .requestFailed)
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 404:
                completion(nil, .userNotFound)
                return
            case 200..<300:
                break // continue with successful response
            default:
                completion(nil, .unknownError)
                return
            }
        }
        
        guard let data = data else {
            completion(nil, .unknownError)
            return
        }
        
        completion(data, nil)
    }
    dataTask.resume()
}

let userId = 5
fetchUserData(userId: userId) { data, error in
    if let data = data {
        print("User Data received: \(data)")
    } else {
        print(error?.localizedDescription ?? "An unknown error occurred while fetching user data.")
    }
}







enum UserAPIError2: Error {
    case invalidURL
    case requestFailed
    case userNotFound
    case unknownError
}

// Define Product struct matching the JSON structure
//Codable is a powerful protocol in Swift that allows instances of a type (like Product) to be encoded to or decoded from external formats like JSON.
struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let rating: Double
    let stock: Int
}

// Modify function to decode data
func fetchProductData2(productId: Int, completion: @escaping (Product?, UserAPIError2?) -> Void) {
    let urlString = "https://dummyjson.com/products/\(productId)"
    guard let url = URL(string: urlString) else {
        completion(nil, .invalidURL)
        return
    }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            completion(nil, .requestFailed)
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 404:
                completion(nil, .userNotFound)
                return
            case 200..<300:
                break
            default:
                completion(nil, .unknownError)
                return
            }
        }
        
        guard let data = data else {
            completion(nil, .unknownError)
            return
        }
        
        // Decode JSON data into a Product object
//        In fetchProductData, the data returned from the server is decoded using JSONDecoder
        /*
         JSONDecoder().decode(Product.self, from: data): This line attempts to decode the data into an instance of Product.
         Product.self: This is a way of saying, “decode data into an instance of Product.”
         */
        do {
            let product = try JSONDecoder().decode(Product.self, from: data)
            completion(product, nil)
        } catch {
            completion(nil, .unknownError)
        }
    }
    dataTask.resume()
}

// Usage
let productId = 5
fetchProductData2(productId: productId) { product, error in
    if let product = product {
        print("Product Data received for ID \(productId):")
        print("Title: \(product.title)")
        print("Description: \(product.description)")
        print("Price: $\(product.price)")
        print("Rating: \(product.rating) stars")
        print("Category: \(product.category)")
    } else {
        print(error?.localizedDescription ?? "An unknown error occurred while fetching product data.")
    }
}



