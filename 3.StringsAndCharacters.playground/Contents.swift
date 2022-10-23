import UIKit

// Strings and Characters
// String Literals
let someString = "Some string literal value"

// Multiline String Literals
let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
print("\n")
// When your source code includes a line break inside of a multiline string literal, that line break also appears in the string’s value. If you want to use line breaks to make your source code easier to read, but you don’t want the line breaks to be part of the string’s value, write a backslash (\) at the end of those lines:
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print(lineBreaks)
// You can also create a line break just printing ""
print("This is the first line.")
print("")
print("This is the second line.")

/*
Special Characters in String Literals:
 \0 (null character)
 \\ (backslash)
 \t (horizontal tab)
 \n (line feed)
 \r (carriage return)
 \" (double quotation mark)
 \' (single quotation mark)
 \u{n} (arbitrary Unicode scalar value)
*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)
let dollarSign = "\u{24}" // Unicode scalar U+0024
print(dollarSign)
let blackHeart = "\u{2665}" // Unicode scalar U+2665
print(blackHeart)
let sparklingHeart = "\u{1F496}" // Unicode scalar U+1F496
print(sparklingHeart)
// You can place a string literal within extended delimiters to include special characters in a string without invoking their effect. You place your string within quotation marks (") and surround that with number signs (#)
print(#"Line 1\#nLine 2"#)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// Initializing an Empty String
var emptyString = "" // empty string literal
var anotherEmptyString = String() // initializer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
} else {
    print(emptyString)
}


// Strings Are Value Types !!!
// Swift's String type is a value type. If you create a new String value, that String value is COPIED when it's passed to a function, method, or when it's assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.
// Swift's copy-by-default String behavior ensures that when a function or method passes you a String value, it's clear that you own that exact String value, regardless of where it came from. You can be confident that the string you are passed won't be modified unless you modify it yourself.
//Behind the scenes, Swift's compiler optimizes string usage so that actual copying takes place only when absolutely necessary.
// So when you copy a string, the whole thing is duplicated. This means that changing one copy of a string doesn't change the other copies.
var str = "Hello"
var copy1 = str
str = "Bye" // here i'm changing the original value
print(str)
print(copy1) // I changed the original value to "Bye" but the copy1 didn't change because String type is a value type, means won't change by a reference

var copy2 = copy1
copy1 = "Hi"
print(copy1) // i change the copy1's value to "Hi"
print(copy2) // because when im creating copy2, the copy1 was "Hello" and i assigned the copy2's value to copy1's value which was "Hello" and then i change the copy1's value to "Hi" but the copy2's value stay the same because changing one copy of a string doesn't change the other copies.


// Working with Characters
// You can access the individual Character values for a String by iterating over the string with a for-in loop
for character in "Dog!🐶" {
    print(character)
}

// you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation
let exclamationMark: Character = "!"

// String values can be constructed by passing an array of Character values as an argument to its initializer
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2
print(instruction)

// You can append a Character value to a String variable with the String type’s append() method
welcome.append(exclamationMark)

// String Interpolation
// a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal.
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Accessing and Modifying a String
// String Indices
// Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string. Different characters can require different amounts of memory to store, so in order to determine which Character is at a particular position, you must iterate over each Unicode scalar from the start or end of that String. For this reason, Swift strings can’t be indexed by integer values.
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
// greeting[greeting.index(before: greeting.startIndex)] // Attempting to access an index outside of a string’s range or a Character at an index outside of a string’s range will trigger a runtime error.

// Use the indices property to access all of the indices of individual characters in a string
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// Inserting and Removing
// To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))

// To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:
welcome1.remove(at: welcome1.index(before: welcome.endIndex))
welcome1

let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
welcome1.removeSubrange(range)


// Substrings
// When you get a substring from a string—for example, using a subscript or a method like prefix(_:)—the result is an instance of Substring, not another string. Unlike strings, you use substrings for only a short amount of time while performing actions on a string.
let greeting1 = "Hello, world!"
let index = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index] // Declaration: let beginning: String.SubSequence
let newString = String(beginning) // Declaration: let newString: String
// substrings aren’t suitable for long-term storage—because they reuse the storage of the original string, the entire original string must be kept in memory as long as any of its substrings are being used.

// Comparing Strings
// Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.
// String and Character Equality
let quotation1 = "We're a lor alike, you and I."
let sameQuotation = "We're a lor alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal.")
}
// Prefix and Suffix Equality
// To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


// Unicode Representations of Strings
let dogString = "Dog!!🐶"
// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit)", terminator: "")
}
print("")
// The first three decimal codeUnit values (68, 111, 103) represent the characters D, o, and g, whose UTF-8 representation is the same as their ASCII representation. The next three decimal codeUnit values (226, 128, 188) are a three-byte UTF-8 representation of the DOUBLE EXCLAMATION MARK character. The last four codeUnit values (240, 159, 144, 182) are a four-byte UTF-8 representation of the DOG FACE character.

// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit)", terminator: "")
}
print("")
// the first three codeUnit values (68, 111, 103) represent the characters D, o, and g, whose UTF-16 code units have the same values as in the string’s UTF-8 representation (because these Unicode scalars represent ASCII characters). The fourth codeUnit value (8252) is a decimal equivalent of the hexadecimal value 203C, which represents the Unicode scalar U+203C for the DOUBLE EXCLAMATION MARK character. This character can be represented as a single code unit in UTF-16. The fifth and sixth codeUnit values (55357 and 56374) are a UTF-16 surrogate pair representation of the DOG FACE character. These values are a high-surrogate value of U+D83D (decimal value 55357) and a low-surrogate value of U+DC36 (decimal value 56374).

// Unicode Scalar Representation
// You can access a Unicode scalar representation of a String value by iterating over its unicodeScalars property. This property is of type UnicodeScalarView, which is a collection of values of type UnicodeScalar. Each UnicodeScalar has a value property that returns the scalar’s 21-bit value, represented within a UInt32 value:
for scalar in dogString.unicodeScalars {
    print("\(scalar.value)", terminator: "")
}
print("")
// The value properties for the first three UnicodeScalar values (68, 111, 103) once again represent the characters D, o, and g. The fourth codeUnit value (8252) is again a decimal equivalent of the hexadecimal value 203C, which represents the Unicode scalar U+203C for the DOUBLE EXCLAMATION MARK character. The value property of the fifth and final UnicodeScalar, 128054, is a decimal equivalent of the hexadecimal value 1F436, which represents the Unicode scalar U+1F436 for the DOG FACE character.
// As an alternative to querying their value properties, each UnicodeScalar value can also be used to construct a new String value, such as with string interpolation:
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
