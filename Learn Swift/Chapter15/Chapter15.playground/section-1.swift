// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

protocol SomeProtocol {
    // Your protocol requirements
    var readwriteProperty : Int { set get}
    var readonlyProperty : Int { get }
}

protocol AnotherProtocol {
    class var typeProperty : Int { get set }
}

struct SomeStruct : SomeProtocol, AnotherProtocol {
    var readwriteProperty : Int
    private(set) var readonlyProperty : Int
    static var typeProperty : Int {
        get {
        return 0
        }
        
        set {
            
        }
    }
}

protocol FullName {
    var fullName : String { get }
}

struct Person : FullName {
    var lastName : String
    var firstName : String
    var middleName : String?
    
    init (firstName : String, lastName : String) {
        self.lastName = lastName
        self.firstName = firstName
    }
    
    var fullName : String {
        return firstName + (middleName == nil ? "" : " " + middleName!) + " " + lastName
    }
}

var alan = Person(firstName: "Alan", lastName: "Turing")
println(alan.fullName)
alan.middleName = "Mathison"
println(alan.fullName)

class SomeClass {
    var protocolConformingProperty : SomeProtocol
    init(someObject : SomeProtocol) {
        self.protocolConformingProperty = someObject
    }
}

var myClass = SomeClass (someObject: SomeStruct(readwriteProperty: 5, readonlyProperty: 10))
println(myClass.protocolConformingProperty.readonlyProperty)
