import UIKit

let constant: Float = 4
print(constant)
//--------------------------------------------------------------------------
// Values are never implicitly converted to another type.
let label = "The width is "
let width = 94
let widthLabel: String = label + String(width)
print(widthLabel)

let widthLabel2: String = "\(label)" + "\(width)"
print(widthLabel2)
//--------------------------------------------------------------------------


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "T have \(apples + oranges) pieces of fruit."
//--------------------------------------------------------------------------



let name = "Melis"
let float: Float = 2.5

let sum: String = "\(name) " + "\(float)"
//--------------------------------------------------------------------------

// Use three double quotation marks (""") for strings that take up multiple lines.
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of
    fruit.
"""

print(quotation)
//--------------------------------------------------------------------------

var shoppingList: Array = ["catfish", "water", "tulips",]
shoppingList[1] = "bottle of water" // I changed the second value (index 1) in the array

var occupations: Dictionary = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

print(shoppingList)
print(shoppingList.first!) // I forced unwrapped it because an array could be empty and that's why .first is an optional.

if shoppingList.isEmpty == false {    // You can check here if is the array is empty or not
    print(shoppingList.first)  // but here it is gonna be still an optional value
}

if shoppingList.count > 0 {    // You can check here if is the array is empty or not
    print(shoppingList.first)  // but here it is gonna be still an optional value
}
// Even if the compiler check whether there is a value in the array still doesn't know on the next line the first element of the array is gonna be nil or not, because the compiler wouldn't know that you just know and you just check with the if statement whether there is a value in the array.

occupations["Jayne"] = "Public Relations" // I added a new value and its key to the dictionary
occupations.keys
occupations.values

shoppingList.append("blue paint")


var firstArray = ["a", "b", "c", "d"]
let secondArray = ["e", "f", "g"]
//firstArray.append(contentsOf: secondArray)
//print(firstArray)

firstArray += secondArray

//let thirdArray = firstArray + secondArray


// Create an empty array
var emptyArray: [String] = []
emptyArray.append("pi")

let emptyArray2 = [String]()
var emptyArray3: Array<String> // If you write like this you have to first initialize it before you append or whatever to do your array. You have to give it values elsewhere in the code.
// If you do that it's gonna give you "Variable 'emptyArray3' passed by reference before being initialized" error
emptyArray3 = ["A"]
emptyArray3.append("B")
var emptyArray4: Array<String> = Array()
emptyArray4.append("blue")

var emptyArray5: [Int]
//emptyArray5.append(1) // the same error at line 84 here

var emptyArray6 = Array<Int>()
emptyArray6.append(1)

// Create empty Dictionary
var emptyDictionary: [String: Float] = [:]
emptyDictionary.updateValue(5, forKey: "five")
emptyDictionary.keys
emptyDictionary.values
//--------------------------------------------------------------------------

// Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)



// An optional value either contains a value or contains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.
var optionalString: String? = "Hello"
print(optionalString)
print(optionalString == nil)


var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


// Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

// You can use a shorter spelling to unwrap a value, using the same name for that unwrapped value.
if let nickname = nickname {
    print("Hey, \(nickname)")
}


// Switches support any kind of data and a wide variety of comparison operations— they aren’t limited to integers and tests for equality.
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):  // Notice how let can be used in a pattern to assign the value that matched the pattern to a constant.
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


// You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind ,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            print("Largest number is now: \(number) from: \(kind)")
        }
    }
}
print(largest)


// Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
var n = 2
while n < 100 {
    n *= 2
    print(n)
}
print(n)

var m = 2
repeat {
    m *= 2
    print(m)
} while m < 100
            print(m)
            
            // You can keep an index in a loop by using ..< to make a range of indexes.
            var total = 0
            for i in 0..<4 {
    total += i
    print(total)
}
print(total)
//--------------------------------------------------------------------------

// Functions and Closures

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet2("John", on: "Thursday")


// Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
func calculateStatisctics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
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

let statistics = calculateStatisctics(scores: [5, 3, 100, 3, 9])
statistics.min
statistics.max
statistics.sum

statistics.0
statistics.1
statistics.2



// Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that’s long or complex.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


// Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrement() -> ((Int) -> (Int)) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrement()
increment(7)


// A function can take another function as one of its arguments.
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
hasAnyMatches(list: numbers, condition: lessThanTen(number:))


numbers.map({ (number: Int) -> Int in
    let result = number
    if number % 2 != 1 {
        return result
    } else {
        return 0  // returning 0 for all odd numbers
    }
})

// Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// When a closure is the only argument to a function, you can omit the parentheses entirely.
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


