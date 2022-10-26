import UIKit

// Collection Types
// To create immutable collections enables the Swift compiler to optimize the performance.

// Arrays
// An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.
// Creating an Empty Array
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts.count
someInts = []
someInts.count

// Creating an Array with a Default Value
// Swift’s Array type also provides an initializer for creating an array of a certain size with all of its values set to the same default value. You pass this initializer a default value of the appropriate type (called repeating): and the number of times that value is repeated in the new array (called count):
var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles.count
for i in threeDoubles {
    print("\(i)")
}

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]

// Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty and contains \(shoppingList.count) items.")
}
// You can add a new item to the end of an array by calling the array’s append(_:) method:
shoppingList.append("Flour")
// Alternatively, append an array of one or more compatible items with the addition assignment operator (+=):
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// Retrieve a value from the array by using subscript syntax:
var firstItem = shoppingList[0]
// You can use subscript syntax to change an existing value at a given index:
shoppingList[0] = "Six eggs"
print(shoppingList[0]) // "Six eggs"
print(firstItem) // "Eggs"
shoppingList[shoppingList.count - 1] // "Butter"

// You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
shoppingList[4...6] = ["Bananas", "Apples", "Peaches", "Bread", "Vanilin", "Rosemary"]
print(shoppingList)
// To insert an item into the array at a specified index, call the array’s insert(_:at:) method:
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

// remove an item from the array with the remove(at:) method. This method removes the item at the specified index and returns the removed item (although you can ignore the returned value if you don’t need it):
let mapleSyrup = shoppingList.remove(at: 0)
firstItem = shoppingList[0]
print(firstItem) // "Six eggs"
print(shoppingList[0]) // "Six eggs"

// If you want to remove the final item from an array, use the removeLast() method rather than the remove(at:) method to avoid the need to query the array’s count property.
let rosemary = shoppingList.removeLast()
print(rosemary)

// Iterating Over an Array
for item in shoppingList {
    print(item)
}

// If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead. For each item in the array, the enumerated() method returns a tuple composed of an integer and the item. The integers start at zero and count up by one for each item; if you enumerate over a whole array, these integers match the items’ indices. You can decompose the tuple into temporary constants or variables as part of the iteration:
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}



// Sets
// A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.
// Hash Values for Set Types
// A type must be hashable in order to be stored in a set. The type must provide a way to compute a hash value for itself. If a == b, the hash value of a is equal to the hash value of b. All of Swift's basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types.

// Set Type Syntax
//The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store.

// Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a") // (inserted true, memberAfterInsert "a")
letters // {"a"}
letters = []
letters // Set([])

// You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection.
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// You can write also like this, in a shorter form:
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)
// The favoriteGenres variable is only allowed to store String values.

// Accessing and Modifying a Set
// To find out the number of items in a set, check its read-only count property
print("I have \(favoriteGenres.count) favorite music genres.")

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

// You can add a new item into a set by calling the set’s insert(_:) method
favoriteGenres.insert("Jazz")

// You can remove an item from a set by calling the set’s remove(_:) method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set didn’t contain it. Alternatively, all items in a set can be removed with its removeAll() method.
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

// To check whether a set contains a particular item, use the contains(_:) method
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}


// Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
}

// Swift’s Set type doesn’t have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method, which returns the set’s elements as an array sorted using the < operator.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// Performing Set Operations
// You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some, or none of the same values.

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// Use the union(_:) method to create a new set with all of the values in both sets.
oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// Use the intersection(_:) method to create a new set with only the values common to both sets.
oddDigits.intersection(singleDigitPrimeNumbers).sorted() // [3, 5, 7]

// Use the subtracting(_:) method to create a new set with values not in the specified set.
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // [1, 9]

// Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
oddDigits.symmetricDifference(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]
oddDigits.symmetricDifference(oddDigits).sorted() // []


// Set Membership and Equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮","🐔","🐑","🐶","🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
// Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
houseAnimals == farmAnimals // false

// Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
houseAnimals.isSubset(of: farmAnimals) // true // Returns a Boolean value that indicates whether this set is a subset of the given set.

// Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
farmAnimals.isSuperset(of: houseAnimals) // true

// Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
houseAnimals.isStrictSubset(of: farmAnimals) // false // Returns a Boolean value that indicates whether the set is a strict subset of the given sequence.

// Use the isDisjoint(with:) method to determine whether two sets have no values in common.
houseAnimals.isDisjoint(with: cityAnimals) // true
farmAnimals.isDisjoint(with: cityAnimals) // true
houseAnimals.isDisjoint(with: farmAnimals) // false



// Dictionaries
// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary don’t have a specified order. You use a dictionary when you need to look up values based on their identifier.

// Dictionary Type Shorthand Syntax
// The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys. You can also write the type of a dictionary in shorthand form as [Key: Value].
// A dictionary Key type must conform to the Hashable protocol, like a set’s value type.

// Creating an Empty Dictionary
var namesOfIntegers: [Int : String] = [:] // Its keys are of type Int, and its values are of type String.
namesOfIntegers[16] = "sixteen"
namesOfIntegers // [16: "sixteen"]

namesOfIntegers = [:]
namesOfIntegers // [:]

// Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "BER": "Berlin"]
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "BER": "Berlin"]

// Accessing and Modifying a Dictionary
// you find out the number of items in a Dictionary by checking its read-only count property:
print("The airports dictionary contains \(airports.count) items.")

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

// You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type:
airports["LHR"] = "London"
airports // ["DUB": "Dublin", "YYZ": "Toronto Pearson", "BER": "Berlin", "LHR": "London"]

// You can also use subscript syntax to change the value associated with a particular key:
airports["LHR"] = "London Heatrow"
airports // ["BER": "Berlin", "YYZ": "Toronto Pearson", "LHR": "London Heatrow", "DUB": "Dublin"]

// As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or update the value for a particular key. the updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value if that key already exists. However, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
// The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
airports // ["LHR": "London Heatrow", "YYZ": "Toronto Pearson", "DUB": "Dublin Airport", "BER": "Berlin"]

// You can also use subscript syntax to retrieve a value from the dictionary for a particular key. Because it’s possible to request a key for which no value exists, a dictionary’s subscript returns an optional value of the dictionary’s value type. If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil:
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).") // The name of the airport is Dublin Airport.
} else {
    print("That airport isn't in the airports dictionary.")
}

if let anotherairportName = airports["TXL"] {
    print("the name of the airport is \(anotherairportName).")
} else {
    print("That airport isn't in the airports dictionary.") // That airport isn't in the airports dictionary.
}

// Iterating Over a Dictionary
// You can iterate over the key-value pairs in a dictionary with a for-in loop. Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple’s members into temporary constants or variables as part of the iteration:
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//YYZ: Toronto Pearson
//LHR: London Heatrow
//DUB: Dublin Airport
//BER: Berlin

// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//Airport code: LHR
//Airport code: BER
//Airport code: DUB
//Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
//Airport name: Dublin Airport
//Airport name: Toronto Pearson
//Airport name: Berlin
//Airport name: London Heatrow

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
print(airportCodes) // ["LHR", "DUB", "YYZ", "BER"]

let airportsNames = [String](airports.values)
print(airportsNames) // ["London Heatrow", "Dublin Airport", "Toronto Pearson", "Berlin"]

//When you create an array with dictionary's keys or values you should probably use the sorted() method to iterate over the keys or values in a specific order because eventually you are creating an array and you want that array to be ordered. So you can write that code like that:
let airportCodes2 = [String](airports.keys).sorted()
print(airportCodes2) // ["BER", "DUB", "LHR", "YYZ"]

let airportsNames2 = [String](airports.values).sorted()
print(airportsNames2) // ["Berlin", "Dublin Airport", "London Heatrow", "Toronto Pearson"]
// So everytime the compiler run your code it's gonna give you the same ordered array :)
