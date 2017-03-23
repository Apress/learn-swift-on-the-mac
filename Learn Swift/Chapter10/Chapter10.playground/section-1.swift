// Playground - noun: a place where people can play

import Foundation

class Stack {
    private var stack = [Double]()
    
    func empty () -> Bool {
        println("local Empty")
        return stack.count == 0
    }
    
    func peek () -> Double? {
        return stack.last
    }
    
    func pop () -> Double? {
        let value = stack.last
        if nil != value {
            stack.removeLast()
        }
        return value
    }
    
    func push (item : Double) {
        stack.append(item)
    }
}

extension Stack {
    subscript(index : Int) -> Double? {
        if self.stack.count < index {
            return self.stack[index]
        }
        return nil
    }
}
var stack = Stack()
stack.push(5)
stack.push(103)
var value = stack.pop()
println(value)
println(stack[1])
struct SomeStruct {
    static func staticFunc () {
    }
}

SomeStruct.staticFunc()

enum SomeEnum {
    case value1, value2
    mutating func toggle () {
        switch self {
        case value1:
            self = value2
        case value2:
            self = value1
        }
    }
}

var myEnum = SomeEnum.value1
myEnum.toggle()

class SomeClass {
    class func typeMethod() {
        
    }
}

SomeClass.typeMethod()

class AClass {
    var value = 1
    func double () {
        self.value *= 2
    }
}

var aclass = AClass()
println(aclass.value)
aclass.double()
