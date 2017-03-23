// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var someFruits = ["Banana", "Apple", "Pear", "Watermelon", "Mango", "Kiwi"]
someFruits[2...4] = ["Peaches", "Oranges"]
someFruits[2...3] = ["Guvava", "Plum", "Fig"]
println(someFruits)

var myFloats = [Float](count: 10, repeatedValue: 1.0)

var myInt : Int? = nil

myInt = 5

if myInt != nil {
    println(myInt!)
}

if let tmpInt = myInt {
    println(tmpInt)
}