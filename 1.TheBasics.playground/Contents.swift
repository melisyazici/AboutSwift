import UIKit

// Constants and variables must be declared before they’re used.
// You can declare multiple constants or multiple variables on a single line, separated by commas:
var x = 0.0, y = 0.0, z = 0.0

// You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name:
var red, gree, blue: Double

// To print a value without a line break after it, pass an empty string as the terminator
var someValue = 9
print(someValue, terminator: "")
print("5")

// Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line:
let cat = "🐱"; print(cat)

// You can access the minimum and maximum values of each integer type with its min and max properties:
let minValue = UInt8.min
let maxValue = UInt8.max
let maxValue2 = UInt16.max

// Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. Double is preferred.
let float1: Float = 0.1
let float2: Float = 0.2
let totalFloat = float1 + float2
print(totalFloat)
print(String(format: "%.50f", totalFloat))  // 0.30000001192092895507812500000000000000000000000000

let double1: Double = 0.1
let double2: Double = 0.2
let totalDouble = double1 + double2
print(String(format: "%.50f", totalDouble)) // 0.30000000000000004440892098500626161694526672363281
// Swift always chooses Double (rather than Float) when inferring the type of floating- point numbers.


// All of these integer literals have a decimal value of 17:
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e
// Hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p
let num1 = 1.25e2 // 1.25 x 10(2)
let num2 = 1.25e-2 // 1.25 x 10(-2)

let num3 = 0xFp2 // 15 x 2(2)
let num4 = 0xFp-2 // 15 x 2(-2)

// All of these floating-point literals have a decimal value of 12.1875:
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


// Both integers and floats can be padded with extra zeros and can contain underscores to help with readability.

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)


typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


// Tuples

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is: \(statusCode)")
print("The status message is: \(statusMessage)")

let (justStatusCode, _) = http404Error
print("The status code is: \(justStatusCode)")

// You can access items using numerical positions starting from zero
print(http404Error.0)
print(http404Error.1)

// You can name the individual elements in a tuple when the tuple is defined
let http200Status = (statusCode: 200, description: "OK")
http200Status.statusCode
http200Status.description
http200Status.0
http200Status.1


// Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(convertedNumber ?? 0)

var serverResponseCode: Int? = 404
serverResponseCode = nil

// If you define an optional variable without providing a default value, the variable is automatically set to nil for you
var surveyAnswer: String?


if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

// You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer.")
}

// You can use the same name for the new constant or variable
let myNumber = Int(possibleNumber)
if let myNumber = myNumber {
    print("My number is \(myNumber)")
}

// You can include as many optional bindings and Boolean conditions in a single if statement as you need to, seperated by commas
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// Implicitly Unwrapped Optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point because forcedString declared as non-optional and it is assigned to an optional value
let assumedString: String! = "An implicity unwrapped optional string."
let implicitString: String = assumedString // no need for an axclamation point because you assign a non-optional value to an force-unwrapped optional value

let optionalString = assumedString // The type of optionalString is "String?" and assumedString isn't force-unwrapped
print(optionalString) // optional

if assumedString != nil {
    print(assumedString!)
}
if let definiteString = assumedString {
    print(definiteString)
}

// Error Handling
func canThrowAnError() throws {
    
}
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}


// Assertions and Preconditions
let age = -3
//assert(age >= 0, "A person's age can't be less than zero.")

// If the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate that an assertion has failed.
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
//    assertionFailure("A person's age can't be less than zero.")
}

//precondition(index > 0, "Index must be greater than zero")
