import UIKit

struct someStruct {
    var foo: String?
    var bar: String?
}

var someOptional: someStruct? = someStruct()

// someOptional?.bar = someOptional?.foo // Overlapping accesses to 'someOptional', but modification requires exclusive access; consider copying to a local variable
// You are mutating an instance property of someOptional and hence mutating the instance someOptional as well, while at the exact same time accessing another instance property of someOptional.

// A conflicting access to memory can occur when different parts of your code are trying to access the same location in memory at the same time.

let foo = someOptional?.foo
someOptional?.bar = foo //you don't access someOptional to get the value of foo, you access the value of the local variable directly





func oneMore(than number: Int) -> Int {
    return number + 1
}
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)






//---------------------------------------------
var stepSize = 1

func increment(_ number: inout Int) {
    number = number + stepSize
}

//increment(&stepSize) // error: Fatal access conflict detected.

var copyOfStepsize = stepSize
increment(&copyOfStepsize)

stepSize = copyOfStepsize



func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore) // OK
playerOneScore
playerTwoScore

//balance(&playerOneScore, &playerOneScore) // Inout arguments are not allowed to alias each other


// Conflicting Access to self in Methods
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria) // OK
// OK because there is a write access to oscar during the method call bacause oscar is the value of self in a mutating method, and there is a write access to maria for the same duration because maria was passed as an in-out parameter. Even though the two write accesses overlap in time, they don't conflict.

// However, if you pass oscar as the argument, there is a conflict:
// oscar.shareHealth(with: &oscar) // Overlapping accesses to 'oscar', but modification requires exclusive access; consider copying to a local variable
// The mutating method needs write access to self for the duration of the method, and the in-out parameter needs write access to teammate for the same duration. Within the method, both self and teammate refer to the same location in memory.







