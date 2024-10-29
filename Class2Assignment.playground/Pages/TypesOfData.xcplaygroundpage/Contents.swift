import Foundation

struct CompanyEmployee {
    // Stored property
    var name: String
    var hoursWorked: Int
    private let hourlyRate: Double = 20.0
    
    // Computed property: Calculates salary based on hours worked and hourly rate
    var salary: Double {
        print("Calculating salary...")
        return Double(hoursWorked) * hourlyRate
    }
    
    // Lazy property:
    // This calculation runs only the first time it's accessed.
    lazy var initialBonus: Double = {
        print("Calculating initial bonus...")
        return Double(hoursWorked) * hourlyRate * 0.1 // 10% of total earnings as bonus
    }()
    
}

var employee = CompanyEmployee(name: "Alex", hoursWorked: 40)

print("Salary: \(employee.salary)")
print("Initial Bonus: \(employee.initialBonus)")  // Lazy calculation happens here

employee.hoursWorked = 50

print("Hours worked updated. Recalculating salary and checking bonus:")
print("Updated Salary: \(employee.salary)")      // Computed property, recalculates
print("Initial Bonus (should remain unchanged): \(employee.initialBonus)") // Lazy property, no recalculation


