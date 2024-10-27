import Foundation

struct Book {
    var title: String
    var author: String
    var pageCount: Int
    var publisher: String?
    var publisherDetails: PublisherDetails?
    
//    init(title: String, author: String, pageCount: Int) {
//        self.title = title
//        self.author = author
//        self.pageCount = pageCount
//    }
    
    //Structs automatically get a initializer if no custom one is provided.
    //auto initializer will work if the props are not private
    func description() -> String {
        "\(title) by \(author). It contains \(pageCount) pages."
    }
    
    //structs are immutable unlike classes
    //to mutate need to add keyword 'mutating'
    mutating func changePageCount(newPageCount: Int) {
        pageCount = newPageCount
        print("Updated page count to \(self.pageCount)")
    }
    
    func getPublisherInfo() -> String {
        
        return publisher ?? "Publisher info is not available"
//        if let pub = publisher {
//            return "Published by \(pub)"
//        } else {
//            return "Publisher info is not available"
//        }
        
//        guard let pub = publisher else {
//            return "Publisher info is not available"
//        }
//        return "Published by \(pub)"
    }
}


var b1 = Book(title: "The Swift Programming Language", author: "Khalid Al-Balkhi", pageCount: 500)

print(b1.description())

var b2 = b1 //internally memory wise they each have their own separate copies of the data

b2.pageCount = 200 //instance itself is mutable but struct isn't

print("B2 page count changed to \(b2.pageCount)")
print("B1 page count still remains as \(b1.pageCount)") //struct is value type and it gets stored on stack memory so it is much faster than reference type or classes
//  whereas class is reference type and gets stored on heap memory

b1.changePageCount(newPageCount: 499)

print("---Optional Variable---")
print(b1.getPublisherInfo())
var b3 = Book(title: "The Swift Programming Language", author: "Khalid Al-Balkhi", pageCount: 500, publisher: "Ackermann Press")
print(b3.getPublisherInfo())

print("---Optional Chaining---")
let characterCount = b3.publisher?.count ?? 0
print("The number of character in Publisher is \(characterCount)")
//Inheritance not possible for struct

//struct StoryBook: Book {
//    init(){
//        super.init(title: String, author: String, pageCount: Int)
//    }
//    
//}
//var sb = StoryBook(title: "The Swift Programming Language", author: "Khalid Al-Balkhi", pageCount: 500)

struct PublisherDetails {
    var name: String
    var address: String
    
    func getFullAddress() -> String {
        return "\(name) \(address)"
    }
}

let publisherInfo = PublisherDetails(name: "The Cranberry", address: "Atlanta, GA")
var b5 = Book(title: "The Swift Programming Language", author: "Khalid Al-Balkhi", pageCount: 500, publisherDetails: publisherInfo)

if let publisherName = b1.publisherDetails?.name{
    print("Publisher name is \(publisherName)")
} else {
    print("Publisher name not available")
}

let pub2 = b5.publisherDetails?.address ?? "Publisher info not available"
print("Publisher address is \(pub2)")



