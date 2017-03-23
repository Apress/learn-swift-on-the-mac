// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func equalInts(a : Int, b : Int) -> Bool {
    return a == b
}

func equalDoubls(a : Double, b : Double) -> Bool {
    return a == b
}

func equalStings(a : String, b : String) -> Bool {
    return a == b
}

func someFunction<Key>(argument : Key) {
    
}

func areValuesEqual<T : Equatable>(a : T, b: T) -> Bool {
    var localVarible : T = a
    return localVarible == b
}

var a = 5
var b = 6
var c = 6

areValuesEqual(a, b)
areValuesEqual(b, c)

areValuesEqual("ABC", "ABC")
areValuesEqual("abc", "ABC")

protocol Collection {
    typealias CollectionType
    func count() -> Int
    mutating func add(item : CollectionType)
    subscript(index : Int) -> CollectionType { get }
}

struct Stack<T> : Collection {
    private var stack = [T]()
    
    func empty () -> Bool {
        println("Stack Empty")
        return stack.count == 0
    }
    
    func peek () -> T? {
        return stack.last
    }
    
    mutating func pop () -> T? {
        let value = stack.last
        if nil != value {
            stack.removeLast()
        }
        return value
    }
    
    mutating func push (item : T) {
        stack.append(item)
    }
    
    // MARK - Collection Protocol
    func count() -> Int {
        return self.stack.count
    }
    
    mutating func add(item: T) {
        self.push(item)
    }
    
    subscript(index : Int) -> T {
        return self.stack[index]
    }
}

func areIdentical<T1 : Collection, T2 : Collection
    where T1.CollectionType == T2.CollectionType, T1.CollectionType : Equatable>
    (collection1 : T1, collection2 : T2) -> Bool {
    
        return true
}

var intStack = Stack<Int>()
var stringStack = Stack<String>()

class MyClass {
    
}

var myClassStack = Stack<MyClass>()

protocol SomeProtocol {
    typealias GenericType
    func someFunction(argument : GenericType)
}

class SomeClass : SomeProtocol {
    func someFunction(argument: Int) {
        // do your processing
    }
}