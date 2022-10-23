import UIKit

// Basic Operators
// Assignment Operator
let b = 10
var a = 5
a = b // a is now equal to 10

// If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once
let (x, y) = (1, 2)
x // x is equal to 1
y // y is equal to 2

1 + 2  // 3
5 - 3  // 2
2 * 3  // 6
10.0 / 2.5  // 4

"hello, " + "world" // "hello, world

9 % 4 // equals 1
-9 % 4 // equals -1

// The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator
let three = 3
let minusThree = -three // minusThree equlas -3
let plusThree = -minusThree // plusThree equlas 3

// The unary plus operator (+) simply returns the value it operates on, without any change
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix equlas -6

// Compound Assignment Operators
var c = 1
c += 2 // c = c + 2 -> c is now equal to 3

// Comparison Operators
1 == 1  // true
2 != 1  // true
2 > 1  // true
1 < 2  // true
1 >= 1  // true
2 <= 1  // false

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you") // Prints "hello, world", because name is indeed equal to "world".
}

// You can compare two tuples if they have the same type and the same number of values. Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal.
(1, "zebra") < (2, "apple")  // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")  // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog") // // true because 4 is equal to 4, and "dog" is equal to "dog"
("blue", -1) < ("purple", 1) // true
("blue", 1) > ("purple", -1) // false
// ("blue", false) < ("purple", true) // Error because < can't compare Boolean values

// Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20) // if hasHeader is true then rowHeight equals contentHeight + 50, if hasHeader is not true then rowHeight equls contentHeight + 20 and in that case hasHeader is true so rowHeight now equals 40 + 50 = 90
//let contentHeight = 40
//let hasHeader = true
//let rowHeight: Int
//if hasHeader {
//    rowHeight = contentHeight + 50
//} else {
//    rowHeight = contentHeight + 20
//}

// Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName // userDefinedColorName is nil, so colorNameToUse is set to the defaultColorName, which is "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName // userDefinedColorName isn't nil, so colorNameToUse is set to userDefinedColorName, which is "green"

// Range Operators
// Closed Range Operator (a...b)
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//1 times 5 is 5
//2 times 5 is 10
//3 times 5 is 15
//4 times 5 is 20
//5 times 5 is 25

// Half-Open Range Operator (a..<b)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
//Person 1 is called Anna
//Person 2 is called Alex
//Person 3 is called Brian
//Person 4 is called Jack

// One-Sided Ranges
for name in names[2...] { // a range all the elements of the array from index 2 to the end of the array
    print(name)
}

for name in names[...2] { // a range all the elements of the array from index 0 to index 2 (include the index 2)
    print(name)
}

for name in names[..<2] { // // a range all the elements of the array from index 0 to index 2 (not include the index 2)
    print(name)
}
// You can also check whether a one-sided range contains a particular value
let range = ...5
range.contains(7) // false
range.contains(4) // true
range.contains(-1) // true

// Logical Operators
// Logical NOT Operator
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED") // Prints "ACCESS DENIED"
}

//Logical AND Operator
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCES DENIED") // Prints "ACCESS DENIED"
}

// Logical OR Operator
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!") // Prints "Welcome!"
} else {
    print("ACCES DENIED")
}

// Combining Logical Operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!") // Prints "Welcome!"
} else {
    print("ACCES DENIED")
}
// The Swift logical operators && and || are left-associative, meaning that compound expressions with multiple logical operators evaluate the leftmost subexpression first.


// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!") // Prints "Welcome!"
} else {
    print("ACCESS DENIED")
}
