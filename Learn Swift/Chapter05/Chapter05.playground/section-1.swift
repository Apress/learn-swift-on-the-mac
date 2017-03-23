// Playground - noun: a place where people can play

let numberOfWheelsForBicycle = 2
var numberOfPassangers = 1

var a = 2.0, b = 5.0, c = 3.0

var songName : String

let Ω = "Omega"

let π = 3.1415
var 🐘 = "Elephant"

var radius = 4.0
var areaOfCircle = 2 * π * radius
println(π)
println(areaOfCircle)

println("Hello, This is a long string")
println("The area of circle = \(areaOfCircle)")

print("Area of Circle = ")
println(areaOfCircle)

println(UInt8.min)
println(UInt8.max)
println(Int8.min)
println(Int8.max)

var smallInteger : Int8 = 23
var largeInteger : Int16 = 4342

var exp0 = 12e2
var exp1 = 0xap2
var exp2 = 12e-2
var exp3 = 0xap-2

let million = 1_000_000
let billion = 1_000_000_000
let floating = 1_0.933_39484

var ab = million + Int(floating)

var ad = floating + Double(million)

let myFloat : Float = 444.455
let myDouble = 444.455

var string1 = String()

if string1.isEmpty {
    println("This is an empty string")
}

string1 = "Learn Swift on the Mac"
if string1.hasPrefix("Learn") {
    println("The string starts with \"Learn\"")
}

if string1.hasSuffix("Learn") {
    println("The string does not end in \"Learn\"")
}

string1 = string1 + " by Waqar Malik"

let animals = "🐑🐘🐍🐢🐛🐝🐜🐞🐌🐠🐟🐬🐳🐋🐄🐏🐃🐅🐇🐎"
println("Number of chracters \(countElements(animals))")
for animal in animals {
    print(animal)
}

let bookTitle1 = "Learn Swift on the Mac"
var bookTitle2 = "Learn Swift on the Mac"
if bookTitle1 == bookTitle2 {
    println("They are the same")
}

bookTitle2 = "Learn swift on the Mac"
if bookTitle1 == bookTitle2 {
    println("They are the same")
}

//if bookTitle1.uppercaseString == bookTitle2.uppercaseString {
//    println("They are the same")
//}

var someFruits : Array<String> = ["Banana", "Apple", "Pear", "Watermelon", "Mango", "Kiwi"]

someFruits.append("Guava")
println(someFruits.count)

if someFruits.isEmpty {
    println("Array is empty")
} else {
    println("Array is not empty")
}

let thirdItem = someFruits[2]
someFruits[0] = "Grapes"
println(someFruits)

someFruits[2...4] = ["Peaches", "Oranges"]

println(someFruits)
someFruits.insert("Nectarines", atIndex: 3)
println(someFruits)

someFruits.removeAtIndex(1)
someFruits.removeLast()

for fruit in someFruits {
    println(fruit)
}

for (index, fruit) in enumerate(someFruits) {
    println("Fruit at index \(index + 1) is \(fruit)")
}

var states = ["CA" : "California", "NV" : "Nevada", "OR": "Oregon", "AZ" : "Arizona"]
states.updateValue("State of California", forKey: "CA")

let oldValue = states.updateValue("State of Nevada", forKey: "NV")
println(oldValue)

for (key, value) in states {
    println("State name = \(value), abbreviation = \(key)")
}

for abbreviation in states.keys {
    println("Abbreviation = \(abbreviation)")
}

for name in states.values {
    println("Name = \(name)")
}

let myUnnamedTuple = ("Name", 4.24, 10)
println(myUnnamedTuple.0)
println(myUnnamedTuple.1)
println(myUnnamedTuple.2)

let (title, value, other) = myUnnamedTuple
println(title)
println(value)
println(other)

let myNamedTuple = (title: "Name", value: 4.25, other: 10)
println(myNamedTuple.title)
println(myNamedTuple.value)
println(myNamedTuple.other)

let namedAndTypedTuple : (title : String, value : Float, other : UInt) = ("Name", 4.25, 10)
