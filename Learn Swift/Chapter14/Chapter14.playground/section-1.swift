// Playground - noun: a place where people can play

import Cocoa

class Student {
    let name : String
    init(name : String) {
        self.name = name;
        print("Student \(self.name) is being initialized")
    }
    
    deinit {
        print("Student \(self.name) is being deinitialized")
    }
}

var student : Student? = Student(name: "Adam Malik")
student = nil
var student2 : Student? = nil
var student3 : Student? = nil
