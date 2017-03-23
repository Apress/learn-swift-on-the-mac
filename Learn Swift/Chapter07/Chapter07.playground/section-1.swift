// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

for i : Int8 in 1...6 {
    println(i)
}

for _ in 1...6 {
    var a = arc4random() % 3
    println(a)
}

for i : Int8 in 1..<6 {
    println(i)
}

let animals = ["Dog", "Cat", "Fish", "Lion"]
for animal in animals {
    println(animal)
}

let numberOfWheels = ["car" : 4, "bicycle" : 2, "tricycle" : 3]
for (mode, wheelCount) in numberOfWheels {
    println("The \(mode) has \(wheelCount) wheels")
}

for charcter in "Adam" {
    println(charcter)
}

for var i = 1; i <= 6; i++ {
    println(i)
}

//var i = 1
//for ; i <= 6; i++ {
//    println(i)
//}
//
//var i = 1
//for ; i <= 6; {
//    println(i)
//    i++
//}

var i : Int = 1
//for i = 1; i <= 6; i++ {
//    println(i)
//}
//println(i)

while i <= 6 {
    println(i)
    i++
}

//var n = 3456, s = 0, d = 0
//
//while 0 != n {
//    d = n % 10;
//    s = s * 10 + d;
//    n = n / 10;
//}
//println(s)

//var a = 2, r = 0, n = 45
//do {
//    r = n % a
//    if r == 0 {
//        println(a)
//    }
//    a++
//} while a <= n/2

let a = 10, b = 20, c = 30

if a > b && a > c {
    println("a is the greatest")
} else if b > c {
    println("b is the greatest")
} else {
    println("c is the greatest")
}

let character : Character = "a"
switch character {
case "a":
    fallthrough
case "e":
    fallthrough
case "i":
    fallthrough
case "o":
    fallthrough
case "u":
    println("A vowel")
default:
    println("Not a vowel")
}

let number = 300000
switch number {
case 0 ..< 10:
    println("Teens")
case 10 ... 99:
    println("tens")
case 100 ... 999:
    println("Hundereds")
case 1000 ... 999_999:
    println("thousands")
case 1_000_000 ..< 1_000_000_000:
    println("millions")
case 1_000_000_000 ..< 1_000_000_000_000:
    println("billions")
default:
    println("a vary large number")
}

let carMaker = "Porsche"

switch carMaker {
case "BMW", "Porsche", "Audi", "VW":
    println("German")
case "Toyota", "Nissan", "Mazda":
    println("Japanese");
case "GM", "Ford":
    println("American")
default:
    println("Unknown")
}

var odds = [Int]()
oddsloop : for i in 1...20 {
    switch i {
    case let a where a % 2 == 0:
        continue oddsloop
    default:
        odds.append(i)
    }
}

println(odds)

oddsloop1 : for i in odds {
    if i == 11 {
        break oddsloop1
    }
    println(i)
}

enum Suit {
    case Diamonds
    case Hearts
    case Spades
    case Clubs
    case Joker
}

let hand = Suit.Diamonds

switch hand {
case .Diamonds:
    println("Diamonds")
case .Hearts:
    println("Hearts")
case .Spades:
    println("Spades")
case .Clubs:
    println("Clubs")
default:
    break
}

switch hand {
case .Diamonds:
    println("Yippie")
    fallthrough
case .Hearts:
    println("Got Red cards")
case .Spades:
    fallthrough
case .Clubs:
    println("Got Black cards")
default:
    println("Got Joker")
}

func myfunction(input1 : Int?) {
    if nil == input1 {
        return
    }
    
    println("We executing function")
}
