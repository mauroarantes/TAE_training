import UIKit

// simple values

let myConstant = 38 //camel case

//myConstant = 50

let firstName = "Nathaniel"
let lastName = "Payne"
let myAge = 400

//hello world!
var greeting: String = "hello world!"
print(greeting)

//string interpolation
let fullName = firstName + " " + lastName
print(fullName)

let completeName2 = "My name is \(firstName) \(lastName) of the clan \(lastName), I was born in the highlands of Scotland \(myAge) years ago. In the end there can be only one"
print(completeName2)

let constant2: String
constant2 = "test"

/*
 simple Values are
 Int
 Double
 Strings
 */

// Optionals
let example: String?
let age = "37"
let convertedValue = Int(age)
print(convertedValue)
print(convertedValue!)

//optional binding
if let newAge = convertedValue {
    let year = 2021 - newAge
    greeting.append("Hello world!")
}

func generateGreeting(to value:String?)-> String? {
    var greeting = value
    greeting?.append(" Hey How Are you Today?")
    return greeting
}

var optionalValue: String?
print(generateGreeting(to: optionalValue))

//Double
let double1 :Double = 12.5 //Double = Float64
let double2 = 1_000.5
print(double2)

let double3: Float32 = 5.0

let implicitInt = 36
let explicitDouble: Double = 36

//guard let
//force unwrapping. --when you use ! bang or exclamation
//nil-coalescing -using ?? to validate an optional or provide a default value

var num: Int?
//num = 40
print(num ?? 28)

/*
 Swift reference
 
 docs.swift.org/
 */

//Collection Types
// Arrays
//Dictionaries
//Sets

let ages = [18,36,57,101]

let ages2: [Int]
ages2 = [21,98,53,37]

let ages3 = [Int]()
let ages4: [Int] = []
let age5 = Array<Int>()

print(ages2)

let set1 = Set(ages2)
print(set1)

//dictionary

var dictionary1 = Dictionary<String, String>()
var dictionary2: [String:String] = [:]
let dictionary3 = [String: String]()
dictionary1["name"] = "Nate"
print(dictionary1["name"] ?? "")

//access element in collection

print(ages2[2])
print(Array(set1)[0])
