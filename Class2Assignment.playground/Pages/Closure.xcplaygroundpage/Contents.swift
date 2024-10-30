import Foundation

let simpleClosure = {
    print("Closure assigned to a variable")
}
simpleClosure()

//default non-escaping closure
print("---Non Escaping Closure---")
func logProcessing(data: [String], onCompletion: () -> Void){
    for item in data{
        print("\(item) is processed")
    }
    onCompletion()
    print("End of function")
}
let items = ["item 1", "item 2", "item 3"]
//logProcessing(data: items, onCompletion: {print("Non escaping closure executed")})
logProcessing(data: items){
    print("Non escaping closure executed")
}

print("---Escaping Closure---")
func downLoadData(onCompletion: @escaping () -> Void) {
    print("Start downloading")
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        print("Download completed")
        onCompletion()
    }
    print("...End of Escaping function")
}
//downLoadData(onCompletion: {print("Escaping closure running after download is completed")})
downLoadData{
    print("Escaping closure running after download is completed")
}


print("---Trailing Closure multiplication---")

func doMultiplication(n1: Int, n2: Int, completion: (Int) -> Void) {
    completion(n1 * n2)
}

doMultiplication(n1: 5, n2: 1) { result in
    print("Result is \(result)")
}

print("---Trailing Closure Filter Array---")

func searchItems(array: [String], filter: (String) -> Void) {
    array.forEach(filter)  /*filter("Tom") filter("Alice") filter("Debbie") filter("Charlie") filter("Bob")*/
}
let names = ["Tom", "Alice", "Debbie", "Charlie", "Bob"]
searchItems(array: names) { name in
    if name.count > 3 {
        print("Name: \(name) has more than 3 characters")
    }
}


