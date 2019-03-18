//
//  main.swift
//  SwiftTouring
//
//  Created by Rodrigo Ramele on 2/15/15.
//  Copyright (c) 2015 Baufest. All rights reserved.
//

import Foundation

print("Hello, World!")


// Variables, let, var.  They have scope.
var thisvar = 98.8

let pi =  3.1412


// Float, Int, Bool, String, Double

let yawPrecission: Float = 3.0

let  label = "The precission is"


let message = "The value of precission is \(yawPrecission)"


// dictionaries.  Array and Dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Float]()


var shoppingList = ["catfish", "water", "tulips", "blue paint"]

print("Shopping list \(shoppingList)")

shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

print("Occupations \(occupations)");

// String concatenation
var str = "hello,"
str += " world"

// Empty!
shoppingList = []
occupations = [:]

// Optionals.  Type-Safe
var optionalString: String? = "Hello"
optionalString == nil

print(optionalString)

var optionalName: String? = nil
var greeting = "Hello!"

// It will enter the if only when optionalName has a value different to nil.
// In that case name will hold its value.
if let name = optionalName {
    greeting = "Hello, \(name)"
}

print(greeting);


// Switchs works nicely in Swift


// vegetableComment needs to be properly defined.
var vegetableComment: String?=nil

let vegetable = "red pepper"

switch vegetable {
case "celery":
    vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    vegetableComment = "Is it a spicy \(x)?"
default:
    vegetableComment = "Everything tastes good in soup."
}

print("Chossen vegetable: \(vegetableComment)")



// interestingNumbers is a Nonmutable
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
// We have a tuple here (kind,numbers).  Key, value.
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


// While and do-while, straightforward
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)



// For-loops
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for i in 0..<4 {
    secondForLoop += i
}
print(secondForLoop)



// Functions
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet(name: "Bob", day:"Tuesday")



// Check it out this function returns a touple and receives an array of Int.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print ("Sum: \(statistics.sum)")
print ("Sum: \(statistics.2)")


// Funcitons are first class elements, so they can be used as classes, as parameters or as return values.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


// We can also take a parameters as a function
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Let's use a closure, an anonymous function.
var filteredNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print("Original Numbers  \(numbers)")
print("Processed Numbers \(filteredNumbers)")

// When the function signature is perfectly known, you can ommit its entire declaration
// In the following statement you are using number like the list representantion.  This is similar to Lync or how matlab, python works.
let mappedNumbers = numbers.map({ number in 3 * number })

print("Remapped numbers \(mappedNumbers)")

// You can also refer with numbers to the parameters.  Sorted function receives two parameters, the first and the second.
let sortedNumbers = numbers.sorted { $0 > $1 }

print("Sorted numbers \(sortedNumbers)")

// Classes
class Shape {
    // Property.
    var numberOfSides = 0
    
    var name: String = ""
    
    // Constructor
    init(name: String) {
        self.name = name
    }
    
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Constructor is straightforward, dot notation to access the properties.
//var shape = Shape()  // This will not work

var shape = Shape(name: "box")

shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

print("Shape description \(shape)  <- Classname identified")
print("Returned shape description \(shapeDescription)")

// Protocls, extensions and Generics
// These are very well implemented in Swift.


// Square is an extension of Shape.  Override as usual sets the function to override previous behavior.
class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")

print("Square Area \(test.area())")
print("Calling Square simpleDescription \(test.simpleDescription())")


protocol NiceProtocol {
    
}

// This extend Square functionality to allow it to have complexDescription and a property (like C#)
extension  Square: NiceProtocol {
    func complexDescription() -> String {
        return "Complex Description"
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    
}

var sq = Square(sideLength: 7, name: "rectangle")
print("Square value \(sq.complexDescription())")


// Generics
func rep<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    return result
}

// I will use Item as a String

var dat = rep(item:"knock", times: 4)

print ( "\(dat)")


// Too much to learn, but this is the basic, and the learning curve is not too steep.

