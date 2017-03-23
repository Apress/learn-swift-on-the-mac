// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for i in 1..<10 {
    println(i)
}

for i in 1...10 {
    println(i)
}


class Fruit {
}

class Banana : Fruit {
}

var fruit : Fruit = Banana()
if fruit is Banana {
    var banana = fruit as Banana
}

var anotherFruit = Fruit()
if anotherFruit is Banana {
    var banana = anotherFruit as Banana
}

var banana : Banana = fruit as Banana

if banana === fruit {
    println("they are the same")
}

if banana === anotherFruit {
    println("they are the same")
}

var variable1 : String? = nil
var variable2 : String? = nil
var value = variable1 ?? variable2 ?? "Unknown Value"


prefix operator ∑ {}
prefix func ∑ (array : [Double]) -> Double {
    var sum : Double = 0
    for item in array {
        sum += item
    }
    
    return sum
}

let b = ∑[1.0, 2.0, 3.0]
let a = [4.0, 5.0, 6.0, 7.0]
let c = ∑a

infix operator ÷ { associativity left precedence 150}
func ÷ (left : Double, right : Double) -> Double {
    return left / right
}

var d = 200.0 ÷ 2

infix operator ÷= {associativity right precedence 90 }
func ÷= (inout left : Double, right : Double) {
    left = left ÷ right
}

d ÷= 2

if variable1 != nil {
    value = variable1!
} else if variable2 != nil {
    value = variable2!
} else {
    value = "Unknown Value"
}
