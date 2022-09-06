
// Raman Kozar - module 11

// Libraries
import UIKit
import PlaygroundSupport
import Foundation

// Task 1.
var firstPerson: (firstName: String,
                  lastName: String,
                  age: Int,
                  company: String,
                  city: String) = (firstName: "Vasily", lastName: "Skrobot", age: 25, company: "EPAM", city: "Warsaw")

var secondPerson: (firstName: String,
                    lastName: String,
                    age: Int,
                    company: String,
                    city: String) = (firstName: "Michael", lastName: "Kruk", age: 30, company: "Exadel", city: "Poznań")

var firstNameOfFirstPerson = firstPerson.0
var lastNameOfFirstPerson = firstPerson.1
var ageOfFirstPerson = firstPerson.age

print("First name: \(firstNameOfFirstPerson), last name: \(lastNameOfFirstPerson), age: \(ageOfFirstPerson)")

var firstNameOfSecondPerson = secondPerson.0
var lastNameOfSecondPerson = secondPerson.1
var ageOfSecondPerson = secondPerson.age

print("First name: \(firstNameOfSecondPerson), last name: \(lastNameOfSecondPerson), age: \(ageOfSecondPerson)")

// Task 2.
var daysAtMonths: Array<Int> = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var namesOfMonths: Array<String> = ["January",
                                    "Febryary",
                                    "March",
                                    "April",
                                    "May",
                                    "June",
                                    "July",
                                    "August",
                                    "September",
                                    "October",
                                    "November",
                                    "December"]

// version 1.
for index in 0..<daysAtMonths.count {
    print("Month no. \(index + 1) - \(daysAtMonths[index]) days")
}

// version 2.
for _index in 0..<daysAtMonths.count {
    print("In \(namesOfMonths[_index]) it has \(daysAtMonths[_index]) days")
}

var arrayOfDaysAtMonthsUsingTuples: [(month: String, countDays: Int)] = [("January", 31),
                                                                        ("Febryary", 28),
                                                                         ("March", 31),
                                                                         ("April", 30),
                                                                         ("May", 31),
                                                                         ("June", 30),
                                                                         ("July", 31),
                                                                         ("August", 31),
                                                                         ("September", 30),
                                                                         ("October", 31),
                                                                         ("November", 30),
                                                                         ("December", 31)]

// version 3.
for __index in 0...11 {
    print("In month \(arrayOfDaysAtMonthsUsingTuples[__index].month) it has \(arrayOfDaysAtMonthsUsingTuples[__index].countDays) days")
}

// version 4.
for ___index in stride(from: arrayOfDaysAtMonthsUsingTuples.count - 1, through: 0, by: -1) {
    
    print("In month \(arrayOfDaysAtMonthsUsingTuples[___index].month) it has \(arrayOfDaysAtMonthsUsingTuples[___index].countDays) days")
    
    // To check after each iteration, I output the original array to make sure that it has not changed
    print(arrayOfDaysAtMonthsUsingTuples)
    
}


// Count the number of days until the end of the year
func countDaysUntilEndOfYear(day: Int, monthIndex: Int) {

    let arrayOfDaysAtMonthsUsingTuples: [(month: String, countDays: Int)] = [("January", 31),
                                                                            ("Febryary", 28),
                                                                             ("March", 31),
                                                                             ("April", 30),
                                                                             ("May", 31),
                                                                             ("June", 30),
                                                                             ("July", 31),
                                                                             ("August", 31),
                                                                             ("September", 30),
                                                                             ("October", 31),
                                                                             ("November", 30),
                                                                             ("December", 31)]
    
    var countDaysFinal: Int = 0
    
    for count in stride(from: arrayOfDaysAtMonthsUsingTuples.count - 1, through: 0, by: -1) {
        
        if count < monthIndex {
            break
        }
        
        if count > monthIndex {
            countDaysFinal += arrayOfDaysAtMonthsUsingTuples[count].countDays
        }
        
        if count == monthIndex {
            countDaysFinal += (arrayOfDaysAtMonthsUsingTuples[monthIndex].countDays - day)
        }
        
    }
    
    print("Day of month: \(day), month: \(arrayOfDaysAtMonthsUsingTuples[monthIndex].month), count of days until the end: \(countDaysFinal)")
    
}

// The index parameter is an index, not a month number. Those. in the range from 0 to 11!
countDaysUntilEndOfYear(day: 2, monthIndex: 0)

// Dictionaries
var studentsOfPrisonBrake: [String: Int] = ["Linkoln Barrows": 5,
                                            "Michal Scorfield": 4,
                                            "Fernando Sukre": 1,
                                            "John Abruzzi": 4,
                                            "Bread Bellik": 3,
                                            "Alex Mahone": 3]

// improve student's exam grade
func raiseGrade(_ newGrade: Int, _ studentName: String) {
 
    studentsOfPrisonBrake.updateValue(newGrade, forKey: studentName)
    print(studentsOfPrisonBrake[studentName]!)
    
}

raiseGrade(9, "John Abruzzi")

// writing a message to student
func writeMessageToStudent(_ studentName: String) {
    
    let gradeOfStudent = studentsOfPrisonBrake[studentName]
    
    if gradeOfStudent == 3 || gradeOfStudent == 4 || gradeOfStudent == 5 {
        print("Congratulations to \(studentName)")
    }
    
    if gradeOfStudent == 1 || gradeOfStudent == 2 {
        print("Student \(studentName) goes to retake exam!")
    }
    
}

writeMessageToStudent("Fernando Sukre")
writeMessageToStudent("Linkoln Barrows")

// adding a new students
studentsOfPrisonBrake["Charles Patoshik"] = 1
studentsOfPrisonBrake["Theodore Bagwell"] = 4
studentsOfPrisonBrake["Gretchen Morgan"] = 2

print(studentsOfPrisonBrake)

// deleting a bad student
studentsOfPrisonBrake.removeValue(forKey: "Fernando Sukre")
print(studentsOfPrisonBrake)

// Calculate the average score of the entire group
func calculateingAverageGradeAllTheGroup() -> Double {
    
    if studentsOfPrisonBrake.isEmpty {
        return 0
    }
    
    var finalCount: Int = 0
    
    for (_, studentGrade) in studentsOfPrisonBrake {
        finalCount += studentGrade
    }
    
    return Double(finalCount / studentsOfPrisonBrake.count)
    
}
        
print("Final result of the group: \(calculateingAverageGradeAllTheGroup())!")

