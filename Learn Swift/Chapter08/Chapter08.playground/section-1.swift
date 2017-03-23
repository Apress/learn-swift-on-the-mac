// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func greeting(var name : String = "Waqar") -> String {
    name = "Hello " + name
    return name
}

let mygreeting = greeting(name: "Mishal")

func greeting2(#firstPersonName: String, #secondPersonName : String) -> String {
    let greetingMessage = "Hello " + firstPersonName + " and " + secondPersonName

    return greetingMessage
}

let greeting2Message = greeting2(firstPersonName: "Waqar", secondPersonName: "Adam")

func greeting0() -> String
{
    return "Hello, Swift"
}

let greeting0Message = greeting0()

func greeting3(name: String) -> Void {
    println("Hello " + name)
}

greeting3("Waqar")

func greeting4(name1 : String, name2 : String) -> (String, String) {
    let greeting1 = "Hello " + name1
    let greeting2 = "Hello " + name2
    
    return (greeting1, greeting2)
}

var greetings : (greeting1 : String, greeting2 : String) = greeting4("Waqar", "Adam")

println(greetings.greeting1)
println(greetings.greeting2)

func greeting5(firstPersonName name1: String, secondPersonName name2 : String) -> String {
    let greetingMessage = "Hello " + name1 + " and " + name2
    
    return greetingMessage
}

let greeeting5Message = greeting5(firstPersonName: "Waqar", secondPersonName: "Mishal")

func sum(numbers : Double...) -> Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    
    return sum
}

let mysum = sum(3.0, 5.0, 6.0)

func tripleit(inout value : Double) {
    value *= 3
}

var value = 2.0
tripleit(&value)
println(value)

func add(x: Double, y : Double) -> Double {
    return x + y
}

func multiply(x : Double, y : Double) -> Double {
    return x * y
}

var mathFunction : (Double, Double) -> Double

mathFunction = add
var result = mathFunction(3, 4)

mathFunction = multiply
result = mathFunction(3, 4)

func compute(#computeFunction: (Double, Double) -> Double, #x : Double, #y : Double) -> Double {
    return computeFunction(x, y)
}

result = compute(computeFunction: multiply, x: 3, y: 4)

func computeFunction(#type : String) -> ((Double, Double) -> Double) {
    if(type == "+")
    {
        return add
    } else if type == "*" {
        return multiply
    } else {
        func myRand(x: Double, y : Double ) -> Double {
            return 42.0
        }
        return myRand
    }
}

mathFunction = computeFunction(type: "+")
result = mathFunction(3, 5)

func computeFunction2(#type : String) -> ((Double, Double) -> Double) {
    func localAdd(x: Double, y : Double) -> Double {
        return x + y
    }
    
    func localMultiply(x : Double, y : Double) -> Double {
        return x * y
    }
    
    func myRand(x: Double, y : Double ) -> Double {
        return 42.0
    }

    if(type == "+")
    {
        return localAdd
    } else if type == "*" {
        return localMultiply
    } else {
        return myRand
    }
}

let numbers : [Int] = [119, 11, 45, 9, 34, 202]
func asending(element1 : Int, element2 : Int) -> Bool {
    return element1 < element2
}

var sortedNumbers = sorted(numbers, asending)

sortedNumbers = sorted(numbers, {(element1: Int, element2 : Int) -> Bool in
    return element1 < element2
})

sortedNumbers = sorted(numbers, { element1, element2  in
    return element1 < element2
})

sortedNumbers = sorted(numbers, {element1, element2 in element1 < element2})

sortedNumbers = sorted(numbers, { $0 < $1 })

sortedNumbers = sorted(numbers) {(element1: Int, element2 : Int) -> Bool in
    return element1 < element2
}

sortedNumbers = sorted(numbers) { element1, element2  in
    return element1 < element2
}

sortedNumbers = sorted(numbers) { $0 < $1}

func functionName(firstParameter : String, secondParamater : String ) {
    
}

functionName("Value", "Value2")

//func capturingValues() {
//    func increment(incrementBy : Double) {
//        a += incrementBy
//    }
//    var a : Double = 5
//    println(a)
//
//    increment(4)
//    println(a)
//    
//    increment(2)
//    println(a)
//}
//
//capturingValues()

